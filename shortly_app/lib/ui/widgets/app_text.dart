import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  const AppText(
    this.text, {
    Key key,
    this.style,
    this.textAlign = TextAlign.start,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: style,
        textAlign: textAlign,
      ),
    );
  }
}
