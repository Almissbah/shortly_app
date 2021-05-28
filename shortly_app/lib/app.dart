import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shortly_app/bloc/user/user_bloc.dart';
import 'package:shortly_app/ui/screens/intro_page.dart';
import 'package:shortly_app/ui/screens/landing_page.dart';
import 'package:shortly_app/ui/screens/shorter_page.dart';
import 'package:shortly_app/utils/app_themes.dart';

import 'bloc/urls/url_bloc.dart';
import 'injection.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shortly App',
      theme: AppThemes.getPrimaryTheme(),
      initialRoute: LandingPage.routeName,
      routes: {
        LandingPage.routeName: (context) => BlocProvider<UserBloc>.value(
              value: getIt<UserBloc>(),
              child: LandingPage(),
            ),
        IntroPage.routeName: (context) => BlocProvider<UserBloc>.value(
              value:getIt<UserBloc>(),
              child: IntroPage(),
            ),
       ShorterPage.routeName: (context) => BlocProvider<UrlBloc>.value(
              value:getIt<UrlBloc>(),
              child: ShorterPage(),
            ),
      },
    );
  }
}
