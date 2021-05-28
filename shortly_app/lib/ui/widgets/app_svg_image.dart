import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppSvgImage extends StatelessWidget {
  final String imagePath;

  const AppSvgImage({Key key, @required this.imagePath}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(child: SvgPicture.asset(imagePath,));
  }
}
