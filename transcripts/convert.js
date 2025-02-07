const fs = require('fs');

// Function to read JSON file
function readJsonFile(filePath) {
    fs.readFile(filePath, 'utf8', (err, data) => {
        if (err) {
            console.error(`Error reading file from disk: ${err}`);
            return;
        }

        try {
            // Parse JSON data
            const jsonData = JSON.parse(data);
            let newTranscript = [];
            let transcriptData = {};
            for (let i = 0; i < jsonData.Transcript.length; i++) {
                transcriptData.role = jsonData.Transcript[i].ParticipantId;
                transcriptData.content = jsonData.Transcript[i].Content;
                newTranscript.push(JSON.parse(JSON.stringify(transcriptData)));
            }
            fs.writeFile("./newOutput.json", JSON.stringify(newTranscript), 'utf8', (err) => {
                if (err) {
                    console.error('Error writing JSON data to file:', err);
                } else {
                    console.log('JSON data saved to file successfully.');
                }
            });
        } catch (err) {
            console.error(`Error parsing JSON data: ${err}`);
        }
    });
}

// Specify the path to your JSON file
const filePath = './transcript.json';
readJsonFile(filePath);
