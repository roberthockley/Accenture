// Import the required AWS SDK v3 clients
const { SSMClient, GetParameterCommand } = require('@aws-sdk/client-ssm');

// Initialize the SSM client
const ssmClient = new SSMClient({ region: 'ap-southeast-1' }); // Specify your AWS region

exports.handler = async (event) => {
    const parameterName = 'outages'; // Change this to your parameter name

    // Create the command to get the parameter
    const command = new GetParameterCommand({
        Name: parameterName,
        WithDecryption: true // Set to true if you're retrieving a SecureString
    });

    try {
        // Send the command to retrieve the parameter
        const response = await ssmClient.send(command);
        
        return {
            statusCode: 200,
            body: JSON.parse(response.Parameter.Value) // Return the parameter value
        };
    } catch (error) {
        console.error('Error retrieving parameter:', error);
        return {
            statusCode: 500,
            body: JSON.stringify({
                message: 'Error retrieving parameter',
                error: error.message,
            }),
        };
    }
};