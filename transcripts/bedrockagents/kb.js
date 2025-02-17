const { BedrockAgentRuntimeClient, RetrieveAndGenerateCommand } =require( "@aws-sdk/client-bedrock-agent-runtime");
exports.handler = async (event) => {
  const client = new BedrockAgentRuntimeClient({ region: "ap-southeast-1" });

  const params = {
    input: { text: "What is ncss?" },
    retrieveAndGenerateConfiguration: {
      type: 'KNOWLEDGE_BASE',
      knowledgeBaseConfiguration: {
        knowledgeBaseId: '9KZQDG5TQA',
        modelArn: 'arn:aws:bedrock:ap-southeast-1::foundation-model/anthropic.claude-instant-v1'
      }
    }
  };

  try {
    const command = new RetrieveAndGenerateCommand(params);

    const response = await client.send(command);
    console.log("Generated response:", response.output.text);
    console.log("Citations:", response.citations);
  } catch (error) {
    console.error("Error querying knowledge base:", error);
    console.error("Error stack:", error.stack);
  }
};
