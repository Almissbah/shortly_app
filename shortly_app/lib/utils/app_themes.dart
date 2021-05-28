import 'package:flutter/material.dart';
import 'package:shortly_app/gen/fonts.gen.dart';
import 'package:shortly_app/utils/app_colors.dart';
import 'package:shortly_app/utils/app_consts.dart';

class AppThemes {
  static ThemeData getPrimaryTheme() {
    return ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.whiteColor,
        fontFamily: FontFamily.poppins,
        textTheme: TextTheme(
            bodyText1: TextStyle(
                fontSize: AppConstants.bodyFontSize,
                fontFamily: FontFamily.poppins),
            bodyText2: TextStyle(
                color: AppColors.primaryColor,
                fontSize: AppConstants.bodyFontSize,
                fontFamily: FontFamily.poppins),
            headline1: TextStyle(
                fontSize: AppConstants.headLine1FontSize,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryDarkColor,
                fontFamily: FontFamily.poppins),
            headline3: TextStyle(
                fontSize: AppConstants.headLine3FontSize,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryDarkColor,
                fontFamily: FontFamily.poppins)),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: AppColors.whiteColor,
            backgroundColor: AppColors.primaryColor,
            minimumSize: Size(300, 50),
            alignment: Alignment.center,
            textStyle: TextStyle(
                fontSize: AppConstants.buttonFontSize,
                fontWeight: FontWeight.bold,
                fontFamily: FontFamily.poppins),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ));
  }
}
