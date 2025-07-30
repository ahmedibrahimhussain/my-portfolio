import 'package:flutter/material.dart';

import '../color_manager/color_manager.dart';
import '../styles_manger/styles_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(

    primaryColor: ColorManager.primary,
    scaffoldBackgroundColor: ColorManager.scaffoldBackGroundColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: Colors.black,
        size: 26,
      ),
      backgroundColor: ColorManager.scaffoldBackGroundColor,
      titleTextStyle: getRegularStyle(
        color: ColorManager.black,
        fontSize: 16,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
    ),
  );
}
