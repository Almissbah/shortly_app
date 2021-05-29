import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shortly_app/bloc/user/user_bloc.dart';
import 'package:shortly_app/data/remote/model/shorten_url_response.dart';
import 'package:shortly_app/data/repo/users_repo.dart';
import 'package:shortly_app/ui/widgets/app_button.dart';
import 'package:shortly_app/ui/widgets/app_text.dart';
import 'package:shortly_app/ui/widgets/intro_slider_item.dart';
import 'package:shortly_app/ui/widgets/shortened_url_widget.dart';
import 'package:shortly_app/utils/app_themes.dart';

Widget getTestableOptionalWidget(Widget widget) {
  return Theme(
    data: AppThemes.getPrimaryTheme(),
    child: MediaQuery(
        data: MediaQueryData(size: Size(400, 600)),
        child: BlocProvider(
          create: (context) => UserBloc(MockedUsersRepo()),
          child: Directionality(
              textDirection: TextDirection.rtl, child: Material(child: widget)),
        )),
  );
}

void main() {
  group("Test app widgets", () {
    testWidgets('Test AppButton', (WidgetTester tester) async {
      await tester.pumpWidget(getTestableOptionalWidget(AppButton(
        label: "START",
      )));
      expect(find.text('START'), findsOneWidget);
    });

    testWidgets('Test AppText', (WidgetTester tester) async {
      await tester.pumpWidget(getTestableOptionalWidget(
        AppText("text"),
      ));

      expect(find.text('text'), findsOneWidget);
    });

    testWidgets('Test IntroSliderItem', (WidgetTester tester) async {
      await tester.pumpWidget(getTestableOptionalWidget(
        IntroSliderItem(
          title: "title",
          content: "content",
          iconPath: "",
        ),
      ));

      expect(find.text('title'), findsOneWidget);
      expect(find.text('content'), findsOneWidget);
    });

    testWidgets('Test ShortendUrlWidget', (WidgetTester tester) async {
      await tester.pumpWidget(getTestableOptionalWidget(
        ShortendUrlWidget(
          isCopied: false,
          urlData: UrlData(
              originalLink: "originalLink", fullShortLink: "fullShortLink"),
        ),
      ));

      expect(find.text('fullShortLink'), findsOneWidget);
      expect(find.text('originalLink'), findsOneWidget);
    });
  });
}
