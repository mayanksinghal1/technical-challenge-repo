The get_instance_metadata function sends a GET request to the AWS metadata URL for the instance. This URL is http://169.254.169.254/latest/dynamic/instance-identity/document. AWS instances have this internal IP address reserved for retrieving metadata.
If the request is successful (status code 200), the function parses the JSON response and returns it as a Python dictionary.
The main function calls get_instance_metadata to fetch the metadata, and if successful, it converts the dictionary to a JSON-formatted string with indentation.
The script outputs the JSON-formatted metadata to the console.