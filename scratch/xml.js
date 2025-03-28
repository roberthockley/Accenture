const AWS = require('aws-sdk');
const s3 = new AWS.S3();
const dynamodb = new AWS.DynamoDB.DocumentClient();
const xml2js = require('xml2js');
const parser = new xml2js.Parser({ explicitArray: false, ignoreAttrs: false });

exports.handler = async (event) => {
    try {
        // Get uploaded file details
        const bucket = event.Records[0].s3.bucket.name;
        const key = decodeURIComponent(event.Records[0].s3.object.key.replace(/\+/g, ' '));
        
        // Get XML file from S3
        const params = { Bucket: bucket, Key: key };
        const data = await s3.getObject(params).promise();
        const xmlData = data.Body.toString('utf-8');
        
        // Parse XML
        const parsedData = await parser.parseStringPromise(xmlData);
        
        // Extract metadata (adjust according to your XML structure)
        const metadata = {
            recordingRef: parsedData['x:recording'].$.x_ref,
            startTime: parsedData['x:recording']['x:starttime'],
            switchId: parsedData['x:recording']['x:switch_id'],
            captureVersion: parsedData['x:recording']['x:captureversion'],
            compressionType: parsedData['x:recording']['x:compressiontype'],
            // Add other fields as needed
        };
        
        // Prepare DynamoDB put parameters
        const dbParams = {
            TableName: 'YourDynamoDBTableName',
            Item: {
                recordingId: metadata.recordingRef, // Primary key
                timestamp: new Date().toISOString(),
                ...metadata
            }
        };
        
        // Write to DynamoDB
        await dynamodb.put(dbParams).promise();
        return { status: 'Metadata processed successfully' };
        
    } catch (err) {
        console.error('Error:', err);
        throw err;
    }
};
