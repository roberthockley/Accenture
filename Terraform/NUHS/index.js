const { TranscribeClient, StartTranscriptionJobCommand, StartCallAnalyticsJobCommand } = require("@aws-sdk/client-transcribe");

const client = new TranscribeClient({
    region: process.env.AWS_REGION
});

exports.handler = async (event) => {
    console.log(JSON.stringify(event));
    
    try {
        const record = event.Records[0];
        const bucketName = record.s3.bucket.name;
        const objectKey = record.s3.object.key;
        const filename = record.s3.object.key.slice(11).slice(0,-4)

        const params = {
            TranscriptionJobName: `TranscriptionJob-${Date.now()}`,
            LanguageCode: "en-US",
            MediaFormat: "wav",
            Media: {
                MediaFileUri: `s3://${bucketName}/${objectKey}`,
            },
            OutputBucketName: bucketName,
            OutputKey: `transcripts/${filename}.json`,
        };

        const data = await client.send(new StartTranscriptionJobCommand(params));
        console.log("Transcription job started:", data);

        return {
            statusCode: 200,
            body: JSON.stringify('Transcription job initiated successfully'),
        };

    } catch (error) {
        console.error("Error starting transcription job:", error);
        return {
            statusCode: 500,
            body: JSON.stringify({
                message: 'Error starting transcription job',
                error: error.message
            }),
        };
    }
};
