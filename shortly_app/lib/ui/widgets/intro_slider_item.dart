import 'package:flutter/material.dart';
import 'package:shortly_app/ui/widgets/app_svg_image.dart';
import 'package:shortly_app/ui/widgets/app_text.dart';
import 'package:shortly_app/utils/app_colors.dart';

class IntroSliderItem extends StatelessWidget {
  final String title, content, iconPath;

  const IntroSliderItem(
      {Key key,
      @required this.title,
      @required this.content,
      @required this.iconPath})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Stack(
        children: [
          _buildRoundedContainer(
              child: Column(
            children: [
              AppText(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline3,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 10),
                child: AppText(
                  content,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          )),
          _buildIcon(),
        ],
      ),
    );
  }

  Positioned _buildRoundedContainer({Widget child}) {
    return Positioned(
        top: 40,
        left: 10,
        right: 10,
        child: Container(
          height: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsetsDirectional.only(top: 60),
            child: child,
          ),
        ));
  }

  Positioned _buildIcon() {
    return Positioned(
        left: 0,
        right: 0,
        top: 0,
        child: Center(
          child: (iconPath != null && iconPath.isNotEmpty)
              ? CircleAvatar(
                  backgroundColor: AppColors.primaryDarkColor,
                  maxRadius: 40,
                  child: AppSvgImage(
                    imagePath: iconPath,
                  ),
                )
              : Container(),
        ));
  }
}
