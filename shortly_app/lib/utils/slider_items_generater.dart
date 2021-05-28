import 'package:shortly_app/gen/assets.gen.dart';
import 'package:shortly_app/ui/widgets/intro_slider_item.dart';

class SliderItemsGenerator {
  static var items = [
    SliderItemData(
        title: "Brand Recognition",
        imagePath: Assets.images.diagram,
        content:
            "Boost your Recognition with each click. Generic links dont mean a thing, Branded links help instil confidence in your content."),
    SliderItemData(
        title: "Detailed Records",
        imagePath: Assets.images.gauge,
        content:
            "Boost your Recognition with each click. Generic links dont mean a thing, Branded links help instil confidence in your content."),
    SliderItemData(
        title: "Fully Customizable",
        imagePath: Assets.images.tools,
        content:
            "Boost your Recognition with each click. Generic links dont mean a thing, Branded links help instil confidence in your content.")
  ];
  static List<SliderItemData> getItems() {
    return items;
  }

  static List<IntroSliderItem> getWidgets() {
    return items
        .map((e) => IntroSliderItem(
              title: e.title,
              content: e.content,
              iconPath: e.imagePath,
            ))
        .toList();
  }
}

class SliderItemData {
  final String title, content, imagePath;

  SliderItemData({this.title, this.content, this.imagePath});
}
