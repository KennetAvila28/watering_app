import 'package:flutter/material.dart';

class CustomPageController extends PageController {
  CustomPageController(
      {customInitialPage = 0,
      customKeepPage = true,
      customViewportFraction = 1.0})
      : super(
            initialPage: customInitialPage,
            keepPage: customKeepPage,
            viewportFraction: customViewportFraction);

  
  void jumpToPageCustom(int page) {
    jumpToPage(page);
  }

  
  void animateToPageCustom(int page, ) {
    animateToPage(page, duration:const Duration(seconds: 1), curve: Curves.easeInToLinear);
  }
}
