import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shortly_app/data/remote/model/shorten_url_response.dart';
import 'package:shortly_app/ui/widgets/app_text.dart';
import 'package:shortly_app/utils/app_colors.dart';

import 'app_button.dart';

class ShortendUrlWidget extends StatelessWidget {
  final UrlData urlData;
  final bool isCopied;
  final Function(String) onCopy;
  final Function(UrlData) onDelete;
  const ShortendUrlWidget(
      {Key key, this.urlData, this.isCopied, this.onCopy, this.onDelete})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            Divider(
              color: AppColors.primaryDarkColor,
            ),
            _buildContent()
          ],
        ));
  }

  Widget _buildContent() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: AppText(urlData.fullShortLink),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 30),
            child: Center(
                child: AppButton(
              backgroundColor: isCopied
                  ? AppColors.primaryDarkColor
                  : AppColors.primaryColor,
              label: isCopied ? "COPIED!" : "COPY",
              onPressed: () {
                Clipboard.setData(ClipboardData(text: urlData.fullShortLink));
                if (onCopy != null) {
                  onCopy(urlData.fullShortLink);
                }
              },
            )),
          )
        ],
      ),
    );
  }

  Container _buildHeader(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            top: 10, bottom: 5, start: 10, end: 10),
        child: Row(
          children: [
            Expanded(
                child: Container(
              child: AppText(
                urlData.originalLink,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            )),
            InkWell(
                onTap: () {
                  if (onDelete != null) {
                    onDelete(urlData);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(Icons.delete),
                ))
          ],
        ),
      ),
    );
  }
}