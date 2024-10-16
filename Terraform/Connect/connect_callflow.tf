data "aws_connect_contact_flow" "default_outbound" {
  instance_id = aws_connect_instance.song.id
  name        = "Default outbound"
}



resource "aws_connect_contact_flow" "new_flow" {
  instance_id = aws_connect_instance.song.id
  name        = "Test"
  description = "Test Contact Flow Description"
  type        = "CONTACT_FLOW"
  content = jsonencode({
  "Version": "2019-10-30",
  "StartAction": "6e53ccd1-94bf-4f4e-a6c7-69d1f2b9cc20",
  "Metadata": {
    "entryPointPosition": {
      "x": 14.4,
      "y": 14.4
    },
    "ActionMetadata": {
      "a456069e-9995-4119-9427-bd63308fa17f": {
        "position": {
          "x": 925.6,
          "y": 512
        },
        "dynamicParams": []
      },
      "6e53ccd1-94bf-4f4e-a6c7-69d1f2b9cc20": {
        "position": {
          "x": 216,
          "y": 17.6
        }
      },
      "b11b10a6-c4bd-41ba-a9d9-098cc5374035": {
        "position": {
          "x": 582.4,
          "y": 24
        },
        "conditions": [],
        "conditionMetadata": [
          {
            "id": "15ef07de-b4ee-4625-b548-fa4b971e3d45",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "CHAT"
          },
          {
            "id": "18018848-2943-47f4-88b4-aeb3a978c3c6",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "TASK"
          }
        ]
      },
      "fe6810db-1fe8-4b8d-a939-65dadbb61ef7": {
        "position": {
          "x": 1388.8,
          "y": 70.4
        }
      },
      "f9d359f6-ab58-416a-8d69-d721cf49a2df": {
        "position": {
          "x": 1700,
          "y": 174.4
        },
        "parameters": {
          "ContactFlowId": {
            "displayName": "Sample secure input with no agent"
          }
        },
        "ContactFlow": {
          "text": "Sample secure input with no agent"
        }
      },
      "4c568499-9a87-46d1-87e2-213ebaf81c4e": {
        "position": {
          "x": 1700.8,
          "y": 337.6
        },
        "parameters": {
          "ContactFlowId": {
            "displayName": "Sample Lambda integration"
          }
        },
        "ContactFlow": {
          "text": "Sample Lambda integration"
        }
      },
      "6d68b65b-787d-4359-a58b-23959a0c18d7": {
        "position": {
          "x": 1697.6,
          "y": 492
        },
        "parameters": {
          "ContactFlowId": {
            "displayName": "Sample note for screenpop"
          }
        },
        "ContactFlow": {
          "text": "Sample note for screenpop"
        }
      },
      "f7ee6062-55b6-4bcf-9b06-35e5735fbad7": {
        "position": {
          "x": 1718.4,
          "y": 657.6
        },
        "parameters": {
          "ContactFlowId": {
            "displayName": "Sample AB test"
          }
        },
        "ContactFlow": {
          "text": "Sample AB test"
        }
      },
      "ae54d6c1-507d-4d6e-886e-e212cbbcf976": {
        "position": {
          "x": 1696,
          "y": 14.4
        },
        "parameters": {
          "ContactFlowId": {
            "displayName": "Sample Queue Configurations Flow"
          }
        },
        "ContactFlow": {
          "text": "Sample Queue Configurations Flow"
        }
      },
      "3b843a8a-19c1-4f34-b874-c28a8550a352": {
        "position": {
          "x": 1720.8,
          "y": 828
        },
        "parameters": {
          "ContactFlowId": {
            "displayName": "Sample recording behavior"
          }
        },
        "ContactFlow": {
          "text": "Sample recording behavior"
        }
      },
      "6063b277-5cd1-41fc-a069-ae76887f2a23": {
        "position": {
          "x": 1145.6,
          "y": 505.6
        }
      },
      "4cb86557-b541-46a3-a452-cee0b241a3cf": {
        "position": {
          "x": 714.4,
          "y": 302.4
        },
        "conditions": [],
        "conditionMetadata": [
          {
            "id": "78f82800-76a9-4132-9101-b04f3f5795d6",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "true"
          }
        ]
      },
      "83b76e76-52cc-4732-81ff-1519b0c0f132": {
        "position": {
          "x": 2201.6,
          "y": 580.8
        }
      },
      "7c0a92c0-3a0d-4941-9d0e-2ae0e16ce58b": {
        "position": {
          "x": 1978.4,
          "y": 580
        }
      },
      "98a70ec0-069b-44a4-ada6-2a1810b1c675": {
        "position": {
          "x": 1377.6,
          "y": 334.4
        },
        "conditionMetadata": [
          {
            "id": "e49f9f6a-a18f-415e-910d-0bc16fea81de",
            "value": "1"
          },
          {
            "id": "c73bc015-a468-47ce-b8e2-de549ddfc5ca",
            "value": "2"
          },
          {
            "id": "2897dc78-d7b2-420b-bd7d-be3cd653cd56",
            "value": "3"
          },
          {
            "id": "a86ac870-2f18-42e8-8b4b-1781348fbe2d",
            "value": "4"
          },
          {
            "id": "73eea8ef-b4a2-45ce-af13-97e53e866318",
            "value": "5"
          },
          {
            "id": "7057822f-99d3-4e8b-99ff-6d7a0e056612",
            "value": "6"
          },
          {
            "id": "64a6daa9-f8cc-4bb3-a2e0-70c6223b8f63",
            "value": "7"
          }
        ]
      },
      "f6e54fb1-d0db-4135-8eb2-5facb1d50b7e": {
        "position": {
          "x": 1722.4,
          "y": 988
        },
        "parameters": {
          "ContactFlowId": {
            "displayName": "Sample inbound flow (first contact experience)"
          },
          "Attributes": {
            "CustomerPhoneNumber": {
              "useDynamic": true
            }
          }
        },
        "ContactFlow": {
          "text": "Sample inbound flow (first contact experience)"
        }
      }
    },
    "Annotations": [],
    "name": "Sample inbound flow (first contact experience)",
    "description": "First contact experience",
    "type": "contactFlow",
    "status": "PUBLISHED",
    "hash": {}
  },
  "Actions": [
    {
      "Parameters": {
        "Attributes": {
          "greetingPlayed": "true"
        },
        "TargetContact": "Current"
      },
      "Identifier": "a456069e-9995-4119-9427-bd63308fa17f",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "6063b277-5cd1-41fc-a069-ae76887f2a23",
        "Errors": [
          {
            "NextAction": "6063b277-5cd1-41fc-a069-ae76887f2a23",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "EventHooks": {
          "CustomerRemaining": "arn:aws:connect:ap-southeast-1:117134819170:instance/d107e08d-4a9e-406f-9a20-60d05a4f33ea/contact-flow/9420d12c-807b-40c6-84cc-f1d9f39c626b"
        }
      },
      "Identifier": "6e53ccd1-94bf-4f4e-a6c7-69d1f2b9cc20",
      "Type": "UpdateContactEventHooks",
      "Transitions": {
        "NextAction": "b11b10a6-c4bd-41ba-a9d9-098cc5374035",
        "Errors": [
          {
            "NextAction": "b11b10a6-c4bd-41ba-a9d9-098cc5374035",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ComparisonValue": "$.Channel"
      },
      "Identifier": "b11b10a6-c4bd-41ba-a9d9-098cc5374035",
      "Type": "Compare",
      "Transitions": {
        "NextAction": "4cb86557-b541-46a3-a452-cee0b241a3cf",
        "Conditions": [
          {
            "NextAction": "fe6810db-1fe8-4b8d-a939-65dadbb61ef7",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "CHAT"
              ]
            }
          },
          {
            "NextAction": "fe6810db-1fe8-4b8d-a939-65dadbb61ef7",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "TASK"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "4cb86557-b541-46a3-a452-cee0b241a3cf",
            "ErrorType": "NoMatchingCondition"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Hello, thanks for contacting us. This is an example of what the Amazon Connect virtual contact center can enable you to do."
      },
      "Identifier": "fe6810db-1fe8-4b8d-a939-65dadbb61ef7",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "ae54d6c1-507d-4d6e-886e-e212cbbcf976"
      }
    },
    {
      "Parameters": {
        "ContactFlowId": "arn:aws:connect:ap-southeast-1:117134819170:instance/d107e08d-4a9e-406f-9a20-60d05a4f33ea/contact-flow/e273d7b6-3f7c-4906-9d9d-09b07117ea0f"
      },
      "Identifier": "f9d359f6-ab58-416a-8d69-d721cf49a2df",
      "Type": "TransferToFlow",
      "Transitions": {
        "NextAction": "7c0a92c0-3a0d-4941-9d0e-2ae0e16ce58b",
        "Errors": [
          {
            "NextAction": "7c0a92c0-3a0d-4941-9d0e-2ae0e16ce58b",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ContactFlowId": "arn:aws:connect:ap-southeast-1:117134819170:instance/d107e08d-4a9e-406f-9a20-60d05a4f33ea/contact-flow/affdbec0-8e18-4cd8-9e48-0c21af9f8ba9"
      },
      "Identifier": "4c568499-9a87-46d1-87e2-213ebaf81c4e",
      "Type": "TransferToFlow",
      "Transitions": {
        "NextAction": "7c0a92c0-3a0d-4941-9d0e-2ae0e16ce58b",
        "Errors": [
          {
            "NextAction": "7c0a92c0-3a0d-4941-9d0e-2ae0e16ce58b",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ContactFlowId": "arn:aws:connect:ap-southeast-1:117134819170:instance/d107e08d-4a9e-406f-9a20-60d05a4f33ea/contact-flow/ecc79abd-7092-4aab-902b-e9a43dc4e39f"
      },
      "Identifier": "6d68b65b-787d-4359-a58b-23959a0c18d7",
      "Type": "TransferToFlow",
      "Transitions": {
        "NextAction": "7c0a92c0-3a0d-4941-9d0e-2ae0e16ce58b",
        "Errors": [
          {
            "NextAction": "7c0a92c0-3a0d-4941-9d0e-2ae0e16ce58b",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ContactFlowId": "arn:aws:connect:ap-southeast-1:117134819170:instance/d107e08d-4a9e-406f-9a20-60d05a4f33ea/contact-flow/2f4bfa6e-b0d1-492f-83ef-04f0875ddfca"
      },
      "Identifier": "f7ee6062-55b6-4bcf-9b06-35e5735fbad7",
      "Type": "TransferToFlow",
      "Transitions": {
        "NextAction": "7c0a92c0-3a0d-4941-9d0e-2ae0e16ce58b",
        "Errors": [
          {
            "NextAction": "7c0a92c0-3a0d-4941-9d0e-2ae0e16ce58b",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ContactFlowId": "arn:aws:connect:ap-southeast-1:117134819170:instance/d107e08d-4a9e-406f-9a20-60d05a4f33ea/contact-flow/e13381a5-a8cc-4064-be30-efd0e61510fe"
      },
      "Identifier": "ae54d6c1-507d-4d6e-886e-e212cbbcf976",
      "Type": "TransferToFlow",
      "Transitions": {
        "NextAction": "7c0a92c0-3a0d-4941-9d0e-2ae0e16ce58b",
        "Errors": [
          {
            "NextAction": "7c0a92c0-3a0d-4941-9d0e-2ae0e16ce58b",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ContactFlowId": "arn:aws:connect:ap-southeast-1:117134819170:instance/d107e08d-4a9e-406f-9a20-60d05a4f33ea/contact-flow/b4f3565a-5188-4ccb-b683-681e98afa613"
      },
      "Identifier": "3b843a8a-19c1-4f34-b874-c28a8550a352",
      "Type": "TransferToFlow",
      "Transitions": {
        "NextAction": "7c0a92c0-3a0d-4941-9d0e-2ae0e16ce58b",
        "Errors": [
          {
            "NextAction": "7c0a92c0-3a0d-4941-9d0e-2ae0e16ce58b",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Hello, thanks for calling. These are some examples of what the Amazon Connect virtual contact center can enable you to do."
      },
      "Identifier": "6063b277-5cd1-41fc-a069-ae76887f2a23",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "98a70ec0-069b-44a4-ada6-2a1810b1c675"
      }
    },
    {
      "Parameters": {
        "ComparisonValue": "$.Attributes.greetingPlayed"
      },
      "Identifier": "4cb86557-b541-46a3-a452-cee0b241a3cf",
      "Type": "Compare",
      "Transitions": {
        "NextAction": "a456069e-9995-4119-9427-bd63308fa17f",
        "Conditions": [
          {
            "NextAction": "98a70ec0-069b-44a4-ada6-2a1810b1c675",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "true"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "a456069e-9995-4119-9427-bd63308fa17f",
            "ErrorType": "NoMatchingCondition"
          }
        ]
      }
    },
    {
      "Parameters": {},
      "Identifier": "83b76e76-52cc-4732-81ff-1519b0c0f132",
      "Type": "DisconnectParticipant",
      "Transitions": {}
    },
    {
      "Parameters": {
        "Text": "We're sorry, an error occurred. Goodbye."
      },
      "Identifier": "7c0a92c0-3a0d-4941-9d0e-2ae0e16ce58b",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "83b76e76-52cc-4732-81ff-1519b0c0f132"
      }
    },
    {
      "Parameters": {
        "Text": "Press 1 to be put in queue for an agent.\n2 to securely enter content. \n3 to hear the results of an AWS Lambda data dip. \n4 to set a screen pop for the agent. \n5 to roll the dice and simulate a and b testing. \n6 to set call recording behavior.\nOr 7 to create a task for an agent.",
        "StoreInput": "False",
        "InputTimeLimitSeconds": "8"
      },
      "Identifier": "98a70ec0-069b-44a4-ada6-2a1810b1c675",
      "Type": "GetParticipantInput",
      "Transitions": {
        "NextAction": "3b843a8a-19c1-4f34-b874-c28a8550a352",
        "Conditions": [
          {
            "NextAction": "ae54d6c1-507d-4d6e-886e-e212cbbcf976",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "1"
              ]
            }
          },
          {
            "NextAction": "f9d359f6-ab58-416a-8d69-d721cf49a2df",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "2"
              ]
            }
          },
          {
            "NextAction": "4c568499-9a87-46d1-87e2-213ebaf81c4e",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "3"
              ]
            }
          },
          {
            "NextAction": "6d68b65b-787d-4359-a58b-23959a0c18d7",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "4"
              ]
            }
          },
          {
            "NextAction": "f7ee6062-55b6-4bcf-9b06-35e5735fbad7",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "5"
              ]
            }
          },
          {
            "NextAction": "3b843a8a-19c1-4f34-b874-c28a8550a352",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "6"
              ]
            }
          },
          {
            "NextAction": "f6e54fb1-d0db-4135-8eb2-5facb1d50b7e",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "7"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "ae54d6c1-507d-4d6e-886e-e212cbbcf976",
            "ErrorType": "InputTimeLimitExceeded"
          },
          {
            "NextAction": "3b843a8a-19c1-4f34-b874-c28a8550a352",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "7c0a92c0-3a0d-4941-9d0e-2ae0e16ce58b",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Name": "Sample task",
        "ContactFlowId": "arn:aws:connect:ap-southeast-1:117134819170:instance/d107e08d-4a9e-406f-9a20-60d05a4f33ea/contact-flow/b17ee65b-9e38-4158-aa63-37f82b6a759f",
        "Description": "Example of an agent task to investigate customer issue from sample inbound flow.",
        "Attributes": {
          "CustomerPhoneNumber": "$.CustomerEndpoint.Address",
          "Type": "inbound"
        }
      },
      "Identifier": "f6e54fb1-d0db-4135-8eb2-5facb1d50b7e",
      "Type": "CreateTask",
      "Transitions": {
        "NextAction": "83b76e76-52cc-4732-81ff-1519b0c0f132",
        "Errors": [
          {
            "NextAction": "7c0a92c0-3a0d-4941-9d0e-2ae0e16ce58b",
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