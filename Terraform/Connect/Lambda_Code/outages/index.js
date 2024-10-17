// Import the required AWS SDK v3 clients
const { SSMClient, GetParameterCommand, PutParameterCommand } = require('@aws-sdk/client-ssm');
const { ConnectClient, UpdateUserPhoneConfigCommand, ListUsersCommand } = require("@aws-sdk/client-connect");
const ssmClient = new SSMClient({ region: 'ap-southeast-1' }); // Specify your AWS region
const connectClient = new ConnectClient({ region: 'ap-southeast-1' });
exports.handler = async (event) => {
    console.log(event);
    const parameterName = 'outages'; // Change this to your parameter name

    switch (event.action) {
        case 'saveUsers':
            return await saveUsers(event.users, event.outage); // Pass users data to saveUsers function

        default:
            return await getParams(); // Ensure getParams is awaited and returned
    }


    async function getParams() {
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
        }
        catch (error) {
            console.error('Error retrieving parameter:', error);
            return {
                statusCode: 500,
                body: JSON.stringify({
                    message: 'Error retrieving parameter',
                    error: error.message,
                }),
            };
        }
    }

    async function saveUsers(users) {
        // Convert users data to a string format (e.g., JSON)

        const usersString = {};
        if (event.outage == "Enabled") {
            usersString.outage = true;
        }
        else {
            usersString.outage = false;
        }
        usersString.users = event.users;
        console.log(usersString);
        // Create the command to put or update the parameter
        const command = new PutParameterCommand({
            Name: parameterName,
            Value: JSON.stringify(usersString),
            Type: 'String', // Change this to 'SecureString' if needed
            Overwrite: true, // Set to true to overwrite an existing parameter
        });

        try {
            // Send the command to put/update the parameter
            await ssmClient.send(command);
            await updateDeskPhone();
            return {
                statusCode: 200,
                body: JSON.stringify({ message: 'Users updated successfully.' }),
            };
        }
        catch (error) {
            console.error('Error saving users:', error);
            return {
                statusCode: 500,
                body: JSON.stringify({
                    message: 'Error saving users',
                    error: error.message,
                }),
            };
        }
    }


    async function updateDeskPhone(phoneNumberId, instanceId, targetArn) {
        const input = { // ListUsersRequest
            InstanceId: "d107e08d-4a9e-406f-9a20-60d05a4f33ea", // required
            MaxResults: Number("100"),
        };
        const command = new ListUsersCommand(input);
        const response = await connectClient.send(command);
        let numberToUpdate;

        for (var i = 0; i < response.UserSummaryList.length; i++) {
            for (var j = 0; j < event.users.length; j++) {
                if (response.UserSummaryList[i].Username === event.users[j].username) {
                    if (event.outage == "Enabled") {
                        numberToUpdate = event.users[j].alt;
                    }
                    else {
                        numberToUpdate = event.users[j].main;
                    }
                    const input = { // UpdateUserPhoneConfigRequest
                        PhoneConfig: { // UserPhoneConfig
                            PhoneType: "DESK_PHONE", // required
                            AutoAccept: false,
                            AfterContactWorkTimeLimit: Number("60"),
                            DeskPhoneNumber: numberToUpdate,
                        },
                        UserId: response.UserSummaryList[i].Id, // required
                        InstanceId: "d107e08d-4a9e-406f-9a20-60d05a4f33ea", // required
                    };
                    console.log(input);
                    try {
                        const command = new UpdateUserPhoneConfigCommand(input);
                        const updateResponse = await connectClient.send(command);
                        console.log(updateResponse);
                    }
                    catch (error) {
                        console.error('Error updating desk phone:', error);
                        return {
                            statusCode: 500,
                            body: JSON.stringify({
                                message: 'Error updating desk phone',
                                error: error.message,
                            }),
                        };
                    }
                }
            }
        }

        /**/


        try {
            // Send the command to update the phone number
            /*const response = await connectClient.send(command);

            return {
                statusCode: 200,
                body: JSON.stringify({
                    message: 'Desk phone updated successfully.',
                    PhoneNumberArn: response.PhoneNumberArn,
                    PhoneNumberId: response.PhoneNumberId,
                }),
            };*/
        }
        catch (error) {
            console.error('Error updating desk phone:', error);
            return {
                statusCode: 500,
                body: JSON.stringify({
                    message: 'Error updating desk phone',
                    error: error.message,
                }),
            };
        }
    }
};
