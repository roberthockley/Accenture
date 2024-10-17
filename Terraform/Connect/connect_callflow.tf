data "aws_connect_contact_flow" "default_outbound" {
  instance_id = aws_connect_instance.song.id
  name        = "Default outbound"
}



resource "aws_connect_contact_flow" "new_flow" {
  instance_id = aws_connect_instance.song.id
  name        = "SSG"
  description = "SSG Demp"
  type        = "CONTACT_FLOW"
  content = jsonencode({
  "Version": "2019-10-30",
  "StartAction": "Welcome Prompt",
  "Metadata": {
    "entryPointPosition": {
      "x": 40,
      "y": 40
    },
    "ActionMetadata": {
      "Welcome Prompt": {
        "position": {
          "x": 200.8,
          "y": 36
        },
        "isFriendlyName": true
      },
      "79c3f2c8-aa64-4d77-a13f-8d3b6b10d262": {
        "position": {
          "x": 553.6,
          "y": 302.4
        }
      },
      "9271dae1-f525-4127-a10d-de1f1818c47f": {
        "position": {
          "x": 461.6,
          "y": 30.4
        },
        "parameters": {
          "QueueId": {
            "displayName": "BasicQueue"
          }
        },
        "queue": {
          "text": "BasicQueue"
        }
      },
      "69a3836f-2aad-41c9-bd60-c14644639d3c": {
        "position": {
          "x": 724,
          "y": 27.2
        }
      }
    },
    "Annotations": [],
    "name": "SSG Demo",
    "description": "",
    "type": "contactFlow",
    "status": "PUBLISHED",
    "hash": {}
  },
  "Actions": [
    {
      "Parameters": {
        "Text": "This is the deskphone failover option demo"
      },
      "Identifier": "Welcome Prompt",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "9271dae1-f525-4127-a10d-de1f1818c47f",
        "Errors": [
          {
            "NextAction": "9271dae1-f525-4127-a10d-de1f1818c47f",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {},
      "Identifier": "79c3f2c8-aa64-4d77-a13f-8d3b6b10d262",
      "Type": "DisconnectParticipant",
      "Transitions": {}
    },
    {
      "Parameters": {
        "QueueId": "${aws_connect_queue.sales.arn}"
      },
      "Identifier": "9271dae1-f525-4127-a10d-de1f1818c47f",
      "Type": "UpdateContactTargetQueue",
      "Transitions": {
        "NextAction": "69a3836f-2aad-41c9-bd60-c14644639d3c",
        "Errors": [
          {
            "NextAction": "69a3836f-2aad-41c9-bd60-c14644639d3c",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {},
      "Identifier": "69a3836f-2aad-41c9-bd60-c14644639d3c",
      "Type": "TransferContactToQueue",
      "Transitions": {
        "NextAction": "79c3f2c8-aa64-4d77-a13f-8d3b6b10d262",
        "Errors": [
          {
            "NextAction": "79c3f2c8-aa64-4d77-a13f-8d3b6b10d262",
            "ErrorType": "QueueAtCapacity"
          },
          {
            "NextAction": "79c3f2c8-aa64-4d77-a13f-8d3b6b10d262",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    }
  ]
})

  tags = {
    "Name"        = "Test Contact Flow"
    "Application" = "Terraform"
    "Method"      = "Create"
  }
}