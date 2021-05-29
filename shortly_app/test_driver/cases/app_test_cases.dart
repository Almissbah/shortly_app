import 'package:shortly_app/utils/test_keys.dart';

import '../utils/my_driver.dart';

class AppTestCases {
  static Future<dynamic> testAppIsLaunching(MyTestDriver driver,
      {Duration timeout = const Duration(seconds: 1)}) async {
    await driver.delay(2);
    await driver.waitFor(TestKeys.START_BUTTON_KEY);
    await driver.expectPresent(TestKeys.LOGO_KEY);
  }

  static Future<dynamic> testNavigatingToIntroPage(MyTestDriver driver,
      {Duration timeout = const Duration(seconds: 1)}) async {
    await driver.expectPresent(TestKeys.START_BUTTON_KEY);
    await driver.tap(TestKeys.START_BUTTON_KEY);
    await driver.delay(1);

    await driver.waitFor(TestKeys.SLIDER_KEY); 
  }


    static Future<dynamic> testIntroSlider(MyTestDriver driver,
      {Duration timeout = const Duration(seconds: 1)}) async {
  
    await driver.scrollToPosition(
        TestKeys.SLIDER_KEY, TestKeys.SLIDER_ITEM_KEY_2);
    await driver.delay(1);
    await driver.expectPresent(TestKeys.SLIDER_ITEM_KEY_2);
    await driver.scrollToPosition(
        TestKeys.SLIDER_KEY, TestKeys.SLIDER_ITEM_KEY_3);
    await driver.delay(1);
    await driver.expectPresent(TestKeys.SLIDER_ITEM_KEY_3);
  }

  static Future<dynamic> testNavigatingShortenScreen(MyTestDriver driver,
      {Duration timeout = const Duration(seconds: 1)}) async {
    await driver.expectPresent(TestKeys.SKIP_BUTTON_KEY);
    await driver.tap(TestKeys.SKIP_BUTTON_KEY);
    await driver.delay(1);
    await driver.waitFor(TestKeys.SHORTEN_IT_KEY);
  }

  static Future<dynamic> testShortenUrls(MyTestDriver driver,
      {Duration timeout = const Duration(seconds: 1),
      int urlsCount = 3}) async {
    var testUrl = 'http://test';
    await driver.expectPresent(TestKeys.EMPTY_LIST_KEY);
    await driver.tap(TestKeys.URL_TEXT_FIELD_KEY);
    for (int i = 0; i < urlsCount; i++) {
      await driver.tap(TestKeys.URL_TEXT_FIELD_KEY);
      await driver.setTextEntryEmulation(true);
      await driver.enterText(testUrl + "$i");
      await driver.delay(1);
      await driver.tap(TestKeys.SHORTEN_IT_KEY);
      await driver.waitFor(TestKeys.SHORTENED_URL_KEY + "$i");
      await driver.delay(1);
    }
  }

  static Future<dynamic> testDeleteUrls(MyTestDriver driver,
      {Duration timeout = const Duration(seconds: 1),
      int urlsCount = 2}) async {
    await driver.expectPresent(TestKeys.URL_LIST_KEY);
    for (int i = 0; i < urlsCount; i++) {
      await driver.tap(TestKeys.SHORTENED_URL_DELETE_KEY + "$i");
      await driver.delay(1);
    }
  }

  static Future<dynamic> testShowingErrors(MyTestDriver driver,
      {Duration timeout = const Duration(seconds: 1),
      int urlsCount = 3}) async {
    //test invalid url
    await driver.tap(TestKeys.URL_TEXT_FIELD_KEY);
    await driver.setTextEntryEmulation(true);
    await driver.enterText("invalidUrl");
    await driver.tap(TestKeys.SHORTEN_IT_KEY);
    await driver.delay(2);
    await driver.expectPresent(TestKeys.INVALID_URL_ERROR_KEY);

    // Test empty URl
    await driver.tap(TestKeys.URL_TEXT_FIELD_KEY);
    await driver.setTextEntryEmulation(true);
    await driver.enterText("");
    await driver.tap(TestKeys.SHORTEN_IT_KEY);
    await driver.delay(1);
    await driver.expectPresent(TestKeys.EMPTY_TEXT_FIELD_KEY);
  }
/* 
  static Future<dynamic> testTypingOnLoginFields(WiotTestDriver driver) async {
    await driver.waitFor(TestId.loginUserName);
    await driver.tap(TestId.loginUserName);
    await driver.setTextEntryEmulation(true);
    await driver.enterText('wth-95584169');
    await driver.delay(1);
    await driver.tap(TestId.loginPassword);
    await driver.setTextEntryEmulation(true);
    await driver.enterText('664413');
    await driver.takeScreenshot("testLoginFields");
    await driver.delay(1);
    expect(await driver.getText(TestId.loginUserName), "wth-95584169");
    expect(await driver.getText(TestId.loginPassword), "664413");
    await driver.takeScreenshot("testTypingOnLoginFields");
  } */

}
