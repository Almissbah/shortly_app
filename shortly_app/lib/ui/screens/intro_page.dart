import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shortly_app/bloc/user/user_bloc.dart';
import 'package:shortly_app/gen/assets.gen.dart';
import 'package:shortly_app/ui/screens/shorter_page.dart';
import 'package:shortly_app/ui/widgets/app_svg_image.dart';
import 'package:shortly_app/ui/widgets/app_text.dart';
import 'package:shortly_app/utils/app_colors.dart';
import 'package:shortly_app/utils/slider_items_generater.dart';

class IntroPage extends StatefulWidget {
  static const routeName = "/IntroPage";

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int _current = 0;
UserBloc _userBloc;
  @override
  void initState() {
  _userBloc=BlocProvider.of<UserBloc>(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundOffWhiteColor,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  child: Padding(
                padding: const EdgeInsetsDirectional.only(top: 40),
                child: AppSvgImage(imagePath: Assets.images.logo),
              )),
              _buildSlider(),
              InkWell(onTap: (){
                _userBloc.setOldUserStatus();
                Navigator.pushReplacementNamed(context, ShorterPage.routeName);
              },child: AppText("Skip"))
            ],
          ),
        ),
      ),
    );
  }

  _buildSlider() {
    return Column(
      children: [
        Container(width: double.infinity, 
          child: CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              items: SliderItemsGenerator.getWidgets()),
        ),
        _buildIndicators()
      ],
    );
  }

  Container _buildIndicators() {
    return Container(height: 20,
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: SliderItemsGenerator.getItems()
              .map((e)  {
                 int index = SliderItemsGenerator.getItems().indexOf(e);
                return Padding(
                padding: const EdgeInsets.all(3.0),
                child: Indicator(
                      isSelected: _current== index,
                    ),
              );})
              .toList(),
        ),
      );
  }
}

class Indicator extends StatelessWidget {
  final bool isSelected;

  const Indicator({Key key, this.isSelected = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10, 
      decoration: BoxDecoration(
        shape: BoxShape.circle,border: Border.all(color: Colors.grey,width: 2),
        color: isSelected
            ? Colors.grey
            : AppColors.backgroundOffWhiteColor,
      ),
    );
  }
}
