import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final TextOverflow overflow;
  const AppText(
    this.text, {
    Key key,
    this.style,
    this.textAlign = TextAlign.start,
    this.overflow,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: style,
        overflow: overflow,
        textAlign: textAlign,
      ),
    );
  }
}
