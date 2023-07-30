import requests
import json

def get_instance_metadata():
    # Metadata URL for AWS instance
    metadata_url = "http://169.254.169.254/latest/dynamic/instance-identity/document"

    try:
        # Make a GET request to the metadata URL
        response = requests.get(metadata_url)

        # Check if the request was successful (status code 200)
        if response.status_code == 200:
            metadata = response.json()
            return metadata
        else:
            print(f"Failed to retrieve instance metadata. Status Code: {response.status_code}")
    except requests.RequestException as e:
        print(f"Error occurred while retrieving instance metadata: {e}")

    return None

def main():
    instance_metadata = get_instance_metadata()

    if instance_metadata:
        # Convert the dictionary to JSON-formatted string with indentation
        json_output = json.dumps(instance_metadata, indent=4)
        print(json_output)
    else:
        print("No instance metadata available.")

if __name__ == "__main__":
    main()
