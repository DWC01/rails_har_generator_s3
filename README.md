#Rails Har Generator API

This app allows you record the network request calls of a given URL in HAR format, and save the results in S3.

Simply send a URL and file path parameters (via json) to the API endpoint "har_file/new". The app will spin up a Firefox instance, visit that URL, and write the results of the network requests to your S3 bucket in HAR file format. 

## Config:

1.) Ensure you have correctly filled in your AWS credentials in the "config/initializers/aws.rb" file. You can replace the ENV variables with hardcoded values, or set these manually in your .bashrc file. 

## Usage

2.) To test: send a URL to the app via the command line in the following format.

- Note: 

  - The first parameter "url", will be the url you want to visit. 

  - The additional paramters user_id, model_name, model_id, and id are currently mandatory params as they create the unique file path for each HAR file saved to S3.

  - Why the current caveat.. This project was a tool built for another application where I needed the file path of each HAR file saved to be unique. I will soon change this to be more dynamic / flexable..

```
curl -d '{"url":"http://www.google.com", "user_id": "01", "model_name":"har_file", "model_id":"01", "id":"01"}' http://localhost:3000/api/har_filel/new --header "Accept: application/json" --header "Content-Type: application/json"

```

### Project Utilizes:

- Ruby on Rails
- Selenium WebDriver
- Firefox
- FireBug
- NetExport
- AWS SDK
- S3

