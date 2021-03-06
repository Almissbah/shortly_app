import 'package:flutter/material.dart';
import 'package:shortly_app/generated/locale_keys.g.dart';
import 'package:shortly_app/ui/widgets/app_text.dart';
import 'package:shortly_app/utils/test_keys.dart';
import 'package:easy_localization/easy_localization.dart';
class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool enabled;
  final String hint;
  const AppTextField(
      {Key key, this.controller, this.enabled = true, this.hint = ""})
      : super(key: key);
  @override
  AppTextFieldState createState() => AppTextFieldState();
}

class AppTextFieldState extends State<AppTextField> {
  var showError = false;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 60,
        child: TextFormField(
          key: Key(TestKeys.URL_TEXT_FIELD_KEY),
          controller: widget.controller,
          enabled: widget.enabled,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFF2F2F2),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 4, color: Colors.red)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1, color: Colors.black)),
            hintText: widget.hint,
            hintStyle: TextStyle(
              fontSize: 20,
              color: Color(0xFFB3B1B1),
            ),
          ),
          obscureText: false,
        ),
      ),
      showError
          ? InkWell(
              onTap: () {
                setState(() {
                  showError = false;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.white),
                width: 300,
                height: 60,
                child: Center(
                    child: AppText(
                  LocaleKeys.shorter_screen_plz_add_linke_here.tr(),
                  style: Theme.of(context).textTheme.headline4,
                  key: Key(TestKeys.EMPTY_TEXT_FIELD_KEY),
                )),
              ),
            )
          : Container()
    ]);
  }

  validate() {
    setState(() {
      showError = widget.controller.text.isEmpty;
    });
    return !showError;
  }
}
