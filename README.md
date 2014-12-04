#Rails Har Generator API

This app allows you record the network request calls of any given URL, saves the results in HAR format, then stores the file in S3 for retrieval.

Simply send a URL, and file path parameters, to the API endpoint "har_file/new". The app will spin up a FireFox instance, visit that URL, and write the results of the network requests to your S3 bucket in HAR file format. 

## The Set Up:

1.) Ensure you have correctly filled in your AWS credentials in the "config/initializers/aws.rb" file. Your can replace the ENV variables with hardcoded values, or set these manually in your .bashrc file. 

2.) To test: send a URL via the command line in the following formatt.

```
curl -d '{"url":"http://www.google.com", "user_id": "01", "model_name":"har_file", "model_id":"01", "id":"01"}' http://localhost:3000/api/har_filel/new --header "Accept: application/json" --header "Content-Type: application/json"

```


Project Uses:
- Ruby on Rails
- Selenium WebDriver
- Firefox
- FireBug
- NetExport
- AWS SDK
- S3

