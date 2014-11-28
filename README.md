API Built with inspiration from:
https://codelation.com/blog/rails-restful-api-just-add-water

Project Uses:
- Ruby on Rails
- Selenium WebDriver
- Firefox
- FireBug
- NetExport
- AWS SDK
- S3

This app allows yout to send a url (as a json parameter) to the '/test_url' API endpoint. The Selenium WebDriver running Firefox, will visit that url, record and save the network calls (in har format) to your S3 account. 