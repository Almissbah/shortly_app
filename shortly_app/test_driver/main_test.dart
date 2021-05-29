// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'cases/app_test_cases.dart';
import 'utils/my_driver.dart';

void main() {
  try {
    group('wathiq tests', () {
      FlutterDriver driver;
      MyTestDriver myDriver;

      // Connect to the Flutter driver before running any tests.
      setUpAll(() async {
        driver = await FlutterDriver.connect();
        myDriver = MyTestDriver(driver);
      });

      // Close the connection to the driver after the tests have completed.
      tearDownAll(() async {
        if (driver != null) {
          driver.close();
        }
      });

      test('testAppIsLaunching', () async {
        await AppTestCases.testAppIsLaunching(myDriver);
      });

      test('testNavigatingToIntroPage', () async {
        await AppTestCases.testNavigatingToIntroPage(myDriver);
      });

      test('testIntroSlider', () async {
        await AppTestCases.testIntroSlider(myDriver);
      });

      test('testNavigatingShortenScreen', () async {
        await AppTestCases.testNavigatingShortenScreen(myDriver);
      });
      test('testShortenAndStoreUrl', () async {
        await AppTestCases.testShortenUrls(myDriver);
      });

      test('testDeletingStoredUrls', () async {
        await AppTestCases.testDeleteUrls(myDriver);
      });

      test('testShowingErrors', () async {
        await AppTestCases.testShowingErrors(myDriver);
      });
    });
  } catch (e, s) {
    print(s);
  }
}
