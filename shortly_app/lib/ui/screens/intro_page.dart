import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shortly_app/gen/assets.gen.dart';
import 'package:shortly_app/ui/widgets/app_svg_image.dart';

class IntroPage extends StatelessWidget {
  static const routeName = "/IntroPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
                child: Padding(
              padding: const EdgeInsetsDirectional.only(top: 40),
              child: AppSvgImage(imagePath: Assets.images.logo),
            )),
          ],
        ),
      ),
    );
  }
}
