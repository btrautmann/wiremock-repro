# wiremock_sample

This project is used as a playground for reproducing issues with WireMock. To get up and running:

1. Start the WireMock server:

- `cd server`
- `java -jar wiremock-standalone-3.0.0.jar --port 57247`

2. If you have Flutter installed, run the app:

- `cd` to the root of the workspace
- `flutter pub get`
- `flutter run`

3. Start recording requests with the following payload:
```json
{
  "targetBaseUrl" : "https://jsonplaceholder.typicode.com",
  "persist" : true,
  "repeatsAsScenarios" : true
}
```
4. If using the app, tap the deposit button
5. If using `curl`, use `curl` to make a `GET` request to `http://localhost:57247/todos/1`
6. Stop recording requests

