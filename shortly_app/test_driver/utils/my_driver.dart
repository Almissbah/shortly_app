import 'dart:io';
import 'package:flutter_driver/flutter_driver.dart'; 
import 'package:test/test.dart';
 

class MyTestDriver {
  MyTestDriver(this.driver);

  FlutterDriver driver;

  Future<void> waitFor(String keyValue) async {
    return driver.waitFor(getSerializableFinder(keyValue));
  }

  Future<void> tap(String keyValue) async {
    return driver.tap(getSerializableFinder(keyValue));
  }

  Future<void> enterText(String text) async {
    return driver.enterText(text);
  }

  Future<String> getText(String keyValue) async {
    return driver.getText(getSerializableFinder(keyValue));
  }

  Future<void> setTextEntryEmulation(bool value) async {
    return driver.setTextEntryEmulation(enabled: value);
  }

  Future<List<int>> takeScreenshot(String fileName) async {
    final List<int> data = await driver.screenshot();
    final File file = File('screenshots/test/$fileName.png');
    if (!await file.exists()) {
      await file.create();
    }
    await file.writeAsBytes(data);
    return data;
  }

  static Future<List<int>> takeScreenshotStatic(
      String fileName, FlutterDriver driver) async {
    final List<int> data = await driver.screenshot();
    final File file = File('screenshots/test/$fileName.png');
    if (!await file.exists()) {
      await file.create();
    }
    await file.writeAsBytes(data);
    return data;
  }

  Future<dynamic> delay(int seconds) async {
    return Future<dynamic>.delayed(Duration(seconds: seconds));
  }

  Future<bool> isPresent(String byValueKey,
      {Duration timeout = const Duration(seconds: 1)}) async {
    final SerializableFinder finder = find.byValueKey(byValueKey);
    try {
      await driver.waitFor(finder, timeout: timeout);
      return true;
    } catch (exception) {
      return false;
    }
  }

  Future<bool> expectPresent(String keyValue) async {
    final bool isItemPresent = await isPresent(keyValue);
    expect(isItemPresent, true);
    return isItemPresent;
  }

  static SerializableFinder getSerializableFinder(String testId) {
    return find.byValueKey(testId);
  }

  Future<void> log(String data, {bool isClear = false}) async {
    final File file = File('screenshots/report.html');
    if (!await file.exists()) {
      await file.create();
    } else {
      if (isClear) {
        await file.writeAsString('', mode: FileMode.write);
      }
    }
    await file.writeAsString(data, mode: FileMode.append);
  }

  Future<void> scrollToPosition(
      String scrollViewKeyValue, String itemToScrollToKeyValue) {
    return driver.scrollUntilVisible(
      // Scroll through the list
      getSerializableFinder(scrollViewKeyValue),
      // Until finding this item
      getSerializableFinder(itemToScrollToKeyValue),
      dyScroll: -300.0,
    );
  }
 
}
