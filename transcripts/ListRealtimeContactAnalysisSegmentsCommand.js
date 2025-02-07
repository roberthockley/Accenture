const { ConnectContactLensClient, ListRealtimeContactAnalysisSegmentsCommand } = require("@aws-sdk/client-connect-contact-lens");
const { BedrockRuntimeClient, InvokeModelCommand } = require("@aws-sdk/client-bedrock-runtime");

exports.handler = async (event) => {
  console.log(JSON.stringify(event));

  async function getTranscript() {
    const client = new ConnectContactLensClient({ region: "ap-southeast-1" });
    let transcriptId;
    /*if (event.Details.ContactData.InitialContactId == event.Details.ContactData.PreviousContactId) {
      transcriptId = event.Details.ContactData.PreviousContactId
    } else {
      transcriptId = event.Details.ContactData.InitialContactId
    }*/
    transcriptId = event.detail.contactId;
    const params = {
      InstanceId: process.env.Connect_Instance,
      ContactId: transcriptId,
      MaxResults: 100,
      SegmentTypes: ["Transcript"]
    };

    try {
      const command = new ListRealtimeContactAnalysisSegmentsCommand(params);
      const response = await client.send(command);
      return response.Segments;
    } catch (error) {
      console.error("Error fetching transcript:", error);
      throw error;
    }
  }

  try {
    // Usage
    const segments = await getTranscript();
    console.log(segments); // Verify transcript data

    let transcriptContent = "";
    for (let i = 0; i < segments.length; i++) {
      if (segments[i]?.Transcript?.Content) {
        transcriptContent += segments[i].Transcript.Content + " ";
      }
    }

    if (transcriptContent.trim() !== "") {
      const prompt = "Summarize this call and provide next actions: " + transcriptContent;

      const bedrockClient = new BedrockRuntimeClient({ region: "ap-southeast-1" });
      const nativeRequest = {
        anthropic_version: "bedrock-2023-05-31",
        max_tokens: 512,
        temperature: 0.5,
        messages: [
          {
            role: "user",
            content: prompt,
          },
        ],
      };

      const bedrockParams = {
        body: JSON.stringify(nativeRequest),
        contentType: "application/json",
        accept: "application/json",
        modelId: "anthropic.claude-instant-v1",
      };
      console.log(bedrockParams)
      const bedrockCommand = new InvokeModelCommand(bedrockParams);
      const bedrockResponse = await bedrockClient.send(bedrockCommand);
      console.log(bedrockResponse);

      // Convert Uint8Array to JSON
      const responseBody = Buffer.from(bedrockResponse.body).toString('utf-8');
      const parsedResponse = JSON.parse(responseBody);
      console.log("Parsed Response:", parsedResponse);
    } else {
      console.log("No transcript content found.");
      // Handle this case appropriately
    }

  } catch (error) {
    console.error("Error invoking model or processing response:", error);
  }
};
