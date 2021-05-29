# Shortly App
This a simple Application to shorten and store URLs.
 

## App Features 

1.   View the optimal layout for the mobile app depending on their device's screen size.
2.   Shorten any valid URL.
3.   See a list of their shortened links ("Link History").
4.   Copy the shortened link to their clipboard in a single click
5.   Delete a shortened link from their Link History
6.   Receive an error message when the `form` is submitted if:
    -   The `input` field is empty
7.   Receive and display API errors.

## App architecture
Based on Bloc architecture and dependancy injection to inject real and mocked datasources.

### The app includes the following main components:

* A local database that servers as a single source of truth for data presented to the user.
* A web api service for shorten the URLs.
* A repository that works with the database and the api service, providing a unified data interface. 
* A DI module to handle Prod and Test modes.
* Unit Test cases, Widget test cases and Integration tests.

### App Packages:
* **data** - contains :
  * remote - contains the api classes to make api calls using Retrofit and Dio.
  * local - contains the db classes to store shorened URLs.
  * repo - contains real and mocked repository classes for triggering API requests and storing the shortened URLs in the database.
* **di** - contains dependency injection modules for Injectable lib.
* **ui** - contains screens and widgets to build and display the UI.
* **utils** - contains themes,colors and app constants.

### App Envs:
* **Prod** - main.dart : the dependancy injection will be set to Prod mode and it will use real datasourse.
* **Test** - main_mock.dart : the dependancy injection will be set to Test mode and it will use mocked datasources.
### App Specs
* Developed with Flutter 2.0.6 SDK
* Dart 
* Bloc Architecture
* Injectable and GetIT for dependency injection.
* Prod and Test Enves
* Retrofit for API integration.
* Floor Database. 
------ 

### Run the app

#####  Mocked Mode (No Actual DB or API request)
flutter run lib/main_mock.dart 
#####  Debug Mode
flutter run 
#####  Profile Mode:
flutter run --profile

------ 

### Run App Tests
#####  Run Widget and Unit Tests
flutter test
#####  Run Test Driver (Mocked Env)
flutter drive --target=test_driver/main.dart