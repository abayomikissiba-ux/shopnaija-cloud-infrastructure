import json

def lambda_handler(event, context):

    print("New S3 Upload")

    print(json.dumps(event))

    return {
        "statusCode": 200,
        "body": "Upload logged successfully"
    }