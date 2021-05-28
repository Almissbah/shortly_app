import 'package:flutter/material.dart';
import 'package:shortly_app/ui/widgets/app_text.dart';
import 'package:shortly_app/utils/app_colors.dart';

class AppButton extends StatelessWidget {
  final Function onPressed;
  
  final String label;
  final Color textColor, backgroundColor;
  const AppButton(
      {Key key,
      this.onPressed,
      @required this.label,
      this.textColor = Colors.white,
      this.backgroundColor = AppColors.primaryColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: onPressed,
        child: Container(
            child: AppText(label,
                style: TextStyle(
                  color: textColor,
                ))),
        style: _getButtonStyle(context),
      ),
    );
  }

  ButtonStyle _getButtonStyle(BuildContext context) => Theme.of(context)
      .textButtonTheme
      .style
      .copyWith(backgroundColor: MaterialStateProperty.all(backgroundColor));
}
