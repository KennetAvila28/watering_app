import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watering_system/presentation/utils/resources/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  final String assetTitle;
  final List<Widget> actions;
  // final PreferredSizeWidget bottom;
  const CustomAppBar({
    super.key,
    required this.assetTitle,
    required this.actions,
    // required this.bottom
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AppBar(
      backgroundColor: AppColors.appIconBlue,
      title: assetTitle.endsWith('.svg')
          ? SvgPicture.asset(
              assetTitle,
              fit: BoxFit.cover,
              height: size.height * 0.08,
            )
          : Image.asset(
              assetTitle,
              fit: BoxFit.cover,
              height: size.height * 0.1,
            ),
      centerTitle: true,
      actions: actions,
      elevation: 4,
      // bottom: bottom,
    );
  }
}
