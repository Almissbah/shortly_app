import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shortly_app/bloc/urls/url_bloc.dart';
import 'package:shortly_app/data/remote/model/shorten_url_response.dart';
import 'package:shortly_app/gen/assets.gen.dart';
import 'package:shortly_app/ui/widgets/app_button.dart';
import 'package:shortly_app/ui/widgets/app_svg_image.dart';
import 'package:shortly_app/ui/widgets/app_text.dart';
import 'package:shortly_app/ui/widgets/app_text_field.dart';
import 'package:shortly_app/ui/widgets/shortened_url_widget.dart';
import 'package:shortly_app/utils/app_colors.dart';
import 'package:shortly_app/utils/test_keys.dart';

class ShorterPage extends StatefulWidget {
  static const routeName = "/ShorterPage";

  @override
  _ShorterPageState createState() => _ShorterPageState();
}

class _ShorterPageState extends State<ShorterPage> {
  UrlBloc _urlBloc;
  TextEditingController _textEditingController = TextEditingController();
  String copiedUrl = "";
  @override
  void initState() {
    _urlBloc = BlocProvider.of<UrlBloc>(context);
    _urlBloc.getStoredUrls();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundOffWhiteColor,
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Container(
        child: Padding(
      padding: const EdgeInsetsDirectional.only(top: 40),
      child: Column(
        children: [_buildContent(), _buildFooter(context)],
      ),
    ));
  }

  _buildContent() {
    return BlocBuilder<UrlBloc, UrlState>(
      condition: (previous, current) => !(current is ShortenUrlLoading),
      builder: (context, state) {
        if (state is ShortenedUrlsList && state.urls.isNotEmpty)
          return _buildUrlsList(state.urls);
        else if (state is ShortenUrlFailed && state.urls.isNotEmpty)
          return _buildUrlsList(state.urls);
        else
          return _buildEmptyState(context);
      },
    );
  }

  Expanded _buildUrlsList(List<UrlData> urls) {
    return Expanded(
      key: Key(TestKeys.URL_LIST_KEY),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: urls.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: ShortendUrlWidget(
                key: Key(TestKeys.SHORTENED_URL_KEY + "$index"),
                deleteButtonKey: Key(TestKeys.SHORTENED_URL_DELETE_KEY + "$index"),
                isCopied: copiedUrl == urls[index].fullShortLink,
                urlData: urls[index],
                onCopy: (url) {
                  setState(() {
                    copiedUrl = url;
                  });
                },
                onDelete: (url) {
                  _urlBloc.delete(url);
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Expanded _buildEmptyState(BuildContext context) {
    return Expanded(
        key: Key(TestKeys.EMPTY_LIST_KEY),
        child: Column(
          children: [
            Container(
                child: Padding(
              padding: const EdgeInsetsDirectional.only(top: 40),
              child: AppSvgImage(imagePath: Assets.images.logo),
            )),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: Padding(
                    padding: const EdgeInsetsDirectional.only(top: 20),
                    child: AppSvgImage(imagePath: Assets.images.illustration),
                  )),
                ],
              ),
            ),
            Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
                child: AppText(
                  "Let's get started!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: 200,
                child: AppText(
                  "Paste your first link into the feild to shorten it",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          ],
        ));
  }

  _buildFooter(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .25,
      width: MediaQuery.of(context).size.width,
      color: AppColors.primaryDarkColor,
      child: Stack(
        children: [
          Positioned.directional(
              textDirection: Directionality.of(context),
              end: 0,
              top: 0,
              child: AppSvgImage(imagePath: Assets.images.shape)),
          Container(
            width: MediaQuery.of(context).size.width,
            child: _buildFooterContent(),
          )
        ],
      ),
    );
  }

  GlobalKey<AppTextFieldState> _textFieldKey = GlobalKey<AppTextFieldState>();
  Widget _buildFooterContent() {
    return BlocBuilder<UrlBloc, UrlState>(
      builder: (context, state) {
        if (state is ShortenedUrlsList) {
          _textEditingController.clear();
        } else if (state is ShortenUrlFailed) {}

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 300,
                height: 80,
                child: AppTextField(
                  key: _textFieldKey,
                  hint: "Shorten a link here ...",
                  enabled: !(state is ShortenUrlLoading),
                  controller: _textEditingController,
                )),
            (state is ShortenUrlLoading)
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(
                          backgroundColor: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  )
                : AppButton(
                    key: Key(TestKeys.SHORTEN_IT_KEY),
                    label: "SHORTEN IT !",
                    onPressed: () {
                      if (_textFieldKey.currentState.validate())
                        _urlBloc.shortUrl(_textEditingController.text);
                    },
                  ),
            (state is ShortenUrlFailed)
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppText(
                      state.msg,
                      textAlign: TextAlign.center,
                      key: Key(TestKeys.INVALID_URL_ERROR_KEY),
                    ),
                  )
                : Container()
          ],
        );
      },
    );
  }
}
