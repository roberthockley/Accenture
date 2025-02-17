const { BedrockAgentRuntimeClient, RetrieveAndGenerateCommand } = require("@aws-sdk/client-bedrock-agent-runtime");

exports.handler = async (event) => {

  for (const record of event.Records) {
    // Kinesis data is base64 encoded so decode here
    const payload = Buffer.from(record.kinesis.data, 'base64').toString('ascii');
    var JSONpayload = JSON.parse(payload)
    if (JSONpayload.Segments && JSONpayload?.Segments[0]?.Transcript?.ParticipantRole == "CUSTOMER") {
      const details = {
        instanceId: JSONpayload.InstanceId,
        contactId: JSONpayload.ContactId,
        transcript: JSONpayload.Segments[0].Transcript.Content
      };
      console.log(record.kinesis)
      await getKB(details);
    }
  }

  async function getKB(details) {

    
        try {
          let transcriptContent = null;
          if (details.transcript.toLowerCase().includes("what") || details.transcript.toLowerCase().includes("when") || details.transcript.toLowerCase().includes("where") || details.transcript.toLowerCase().includes("why") || details.transcript.toLowerCase().includes("how") || details.transcript.toLowerCase().includes("can")) {
              transcriptContent = details.transcript;
            }
          console.log("Searching for", transcriptContent )
          if (transcriptContent) {
            const bedrockClient = new BedrockAgentRuntimeClient({ region: "ap-southeast-1" });
            const params = {
              input: { text: transcriptContent },
              retrieveAndGenerateConfiguration: {
                type: 'KNOWLEDGE_BASE',
                knowledgeBaseConfiguration: {
                  knowledgeBaseId: '9KZQDG5TQA',
                  modelArn: 'arn:aws:bedrock:ap-southeast-1::foundation-model/anthropic.claude-instant-v1'
                }
              }
            };
            console.log(params)
            const command = new RetrieveAndGenerateCommand(params);
    
            const response = await bedrockClient.send(command);
            console.log("Generated response:", response.output.text);
            console.log("Citations:", response.citations);
    
          } else {
            console.log("No transcript content found.");
            // Handle this case appropriately
          }
    
        } catch (error) {
          console.error("Error invoking model or processing response:", error);
        }
  }
};