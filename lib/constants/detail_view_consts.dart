import 'package:flutter/material.dart';

class DetailViewConsts {
  double bannerBottomLeftRadius = 60;
  double bannerBottomRightRadius = 60;
  double backIconSize = 30;
  double starHorizontalPadding = 4;
  double maxRateTextSize =25;
  int starCount = 5;

  String maxRateText =  " / 5";

  Color titleColor = const Color.fromRGBO(255, 0, 0, 0.9);
  Color dateColor = const Color.fromRGBO(219, 219, 219, 1);
  Color starFillColor = const Color.fromRGBO(239, 80, 80, 1);
  Color maxRateTextColor = const Color.fromRGBO(197, 197, 197, 1);
  bannerHeight(context) {
    return MediaQuery.of(context).size.height * 0.5;
  }
}
