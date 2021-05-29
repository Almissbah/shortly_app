// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "app_name": "Shortly App",
  "landing_screen": {
    "title": "More than just shorter links",
    "content": "Build your brand's recognition and get detailed insights on how your links are performing.",
    "start": "START"
  },
  "shorter_screen": {
    "copied": "COPIED!",
    "copy": "COPY",
    "shorten_it": "SHORTEN IT !",
    "plz_add_linke_here": "Please add a link here",
    "lets_start": "Let's get started!",
    "paste_first_link": "Paste your first link into the feild to shorten it",
    "shorten_link_here": "Shorten a link here ..."
  },
  "intro_screen": {
    "skip": "Skip",
    "send_message": "Send a message",
    "slider_item_1_title": "Brand Recognition",
    "slider_item_1_content": "Boost your Recognition with each click. Generic links dont mean a thing, Branded links help instil confidence in your content.",
    "slider_item_2_title": "Detailed Records",
    "slider_item_2_content": "Gain insights into who is clicking your links, knowing when and where people engage with your content helps inform better decisions.",
    "slider_item_3_title": "Fully Customizable",
    "slider_item_3_content": "Improve brand awareness and discoverability through customizable links, supercharging audience engagment."
  }
};
static const Map<String,dynamic> ar = {
  "app_name": "Shortly App",
  "landing_screen": {
    "title": "More than just shorter links",
    "content": "Build your brand's recognition and get detailed insights on how your links are performing.",
    "start": "START"
  },
  "shorter_screen": {
    "copied": "COPIED!",
    "copy": "COPY",
    "shorten_it": "SHORTEN IT !",
    "plz_add_linke_here": "Please add a link here",
    "lets_start": "Let's get started!",
    "paste_first_link": "Paste your first link into the feild to shorten it",
    "shorten_link_here": "Shorten a link here ..."
  },
  "intro_screen": {
    "skip": "Skip",
    "send_message": "Send a message",
    "slider_item_1_title": "Brand Recognition",
    "slider_item_1_content": "Boost your Recognition with each click. Generic links dont mean a thing, Branded links help instil confidence in your content.",
    "slider_item_2_title": "Detailed Records",
    "slider_item_2_content": "Gain insights into who is clicking your links, knowing when and where people engage with your content helps inform better decisions.",
    "slider_item_3_title": "Fully Customizable",
    "slider_item_3_content": "Improve brand awareness and discoverability through customizable links, supercharging audience engagment."
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ar": ar};
}
