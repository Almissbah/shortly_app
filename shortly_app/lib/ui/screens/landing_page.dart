import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shortly_app/bloc/user/user_bloc.dart';
import 'package:shortly_app/gen/assets.gen.dart';
import 'package:shortly_app/ui/screens/intro_page.dart';
import 'package:shortly_app/ui/screens/shorter_page.dart';
import 'package:shortly_app/ui/widgets/app_button.dart';
import 'package:shortly_app/ui/widgets/app_svg_image.dart';
import 'package:shortly_app/ui/widgets/app_text.dart';

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
    _userBloc=BlocProvider.of<UserBloc>(context);
    _userBloc.getUserStatus();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) { 
          if(state is OldUserState){
            Navigator.pushNamed(context, ShorterPage.routeName);
          } 
        },
        child: _buildBody(context),
      ),
    );
  }

  SafeArea _buildBody(BuildContext context) {
    return SafeArea(
      child: Container(
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
                  child: AppSvgImage(imagePath: Assets.images.illustration),
                )),
              ],
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: AppText(
                  "More than just shorter links",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
            Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: AppText(
                  "Build your brand's recognition and get detailed insights on how your links are performing.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: AppButton(
                label: "START",onPressed: (){
                  Navigator.pushNamed(context, IntroPage.routeName);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
