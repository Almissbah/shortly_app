import 'package:flutter/material.dart';
import 'package:shortly_app/gen/assets.gen.dart';
import 'package:shortly_app/generated/locale_keys.g.dart';
import 'package:shortly_app/ui/widgets/intro_slider_item.dart';
import 'package:shortly_app/utils/test_keys.dart';
import 'package:easy_localization/easy_localization.dart';

class SliderItemsGenerator {
  static var items = [
    SliderItemData(
        title: LocaleKeys.intro_screen_slider_item_1_title.tr(),
        imagePath: Assets.images.diagram,
        content: LocaleKeys.intro_screen_slider_item_1_content.tr()),
    SliderItemData(
        title: LocaleKeys.intro_screen_slider_item_2_title.tr(),
        imagePath: Assets.images.gauge,
        content: LocaleKeys.intro_screen_slider_item_2_content.tr()),
    SliderItemData(
        title: LocaleKeys.intro_screen_slider_item_3_title.tr(),
        imagePath: Assets.images.tools,
        content: LocaleKeys.intro_screen_slider_item_3_content.tr())
  ];
  static List<SliderItemData> getItems() {
    return items;
  }

  static List<IntroSliderItem> getWidgets() {
    return items.asMap().entries.map((entry) {
      int idx = entry.key;
      SliderItemData e = entry.value;

      return IntroSliderItem(
        key: Key(TestKeys.SLIDER_ITEM_KEY + '$idx'),
        title: e.title,
        content: e.content,
        iconPath: e.imagePath,
      );
    }).toList();
  }
}

class SliderItemData {
  final String title, content, imagePath;

  SliderItemData({this.title, this.content, this.imagePath});
}
