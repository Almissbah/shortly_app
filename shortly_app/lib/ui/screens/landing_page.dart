import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shortly_app/bloc/user/user_bloc.dart';
import 'package:shortly_app/gen/assets.gen.dart';
import 'package:shortly_app/generated/locale_keys.g.dart';
import 'package:shortly_app/ui/screens/intro_page.dart';
import 'package:shortly_app/ui/screens/shorter_page.dart';
import 'package:shortly_app/ui/widgets/app_button.dart';
import 'package:shortly_app/ui/widgets/app_svg_image.dart';
import 'package:shortly_app/ui/widgets/app_text.dart';
import 'package:shortly_app/utils/test_keys.dart';
import 'package:easy_localization/easy_localization.dart';
class LandingPage extends StatefulWidget {

  static const routeName = "/LandingPage";
  LandingPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  UserBloc _userBloc;

  @override
  void initState() {
    _userBloc = BlocProvider.of<UserBloc>(context);
    _userBloc.getUserStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is OldUserState) {
            Navigator.pushReplacementNamed(context, ShorterPage.routeName);
          }
        },
        child: _buildBody(context),
      ),
    );
  }

  SafeArea _buildBody(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is FirstTimeUserState)
            return _buildFirstTimeUI(context);
          else
            return Center(
              child: Container(width: 50,height: 50,child: CircularProgressIndicator()),
            );
        },
      ),
    );
  }

  Container _buildFirstTimeUI(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              child: Padding(
            padding: const EdgeInsetsDirectional.only(top: 40),
            child: AppSvgImage(imagePath: Assets.images.logo),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  child: Padding(
                padding: const EdgeInsetsDirectional.only(top: 20),
                child: AppSvgImage(imagePath: Assets.images.illustration,key: Key(TestKeys.LOGO_KEY),),
              )),
            ],
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: AppText(
                LocaleKeys.landing_screen_title.tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: AppText(
                 LocaleKeys.landing_screen_content.tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: AppButton(key: Key(TestKeys.START_BUTTON_KEY),
              label: LocaleKeys.landing_screen_start.tr(),
              onPressed: () {
                Navigator.pushReplacementNamed(context, IntroPage.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
