import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shortly_app/bloc/user/user_bloc.dart';
import 'package:shortly_app/ui/screens/intro_page.dart';
import 'package:shortly_app/ui/screens/landing_page.dart';
import 'package:shortly_app/ui/screens/shorter_page.dart';
import 'package:shortly_app/utils/app_themes.dart';

import 'bloc/urls/url_bloc.dart';
import 'generated/codegen_loader.g.dart';
import 'injection.dart';

runAdminApp() {
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'),],
      path: 'resources/lang',
      assetLoader: CodegenLoader(),
      fallbackLocale: Locale('en'),
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shortly App',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.getPrimaryTheme(),
      initialRoute: LandingPage.routeName,
      routes: {
        LandingPage.routeName: (context) => BlocProvider<UserBloc>.value(
              value: getIt<UserBloc>(),
              child: LandingPage(),
            ),
        IntroPage.routeName: (context) => BlocProvider<UserBloc>.value(
              value: getIt<UserBloc>(),
              child: IntroPage(),
            ),
        ShorterPage.routeName: (context) => BlocProvider<UrlBloc>.value(
              value: getIt<UrlBloc>(),
              child: ShorterPage(),
            ),
      },
    );
  }
}
