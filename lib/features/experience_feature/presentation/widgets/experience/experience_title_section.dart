import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/recourses/color_manager/color_manager.dart';
import 'package:my_portfolio/core/recourses/styles_manger/styles_manager.dart';

class ExperienceTitleSection extends StatelessWidget {
  const ExperienceTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final multiplier = isMobile ? 1.5 : 1.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Skills & Experience",
          textAlign: TextAlign.center,
          style: getBoldStyle(
            color: Colors.white,
            fontSize: 55 * multiplier,
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20.w : 50.w),
          child: Text(
            "The main area of expertise is Flutter development (client side of mobile apps).\n"
                "Using Dart, BLoC, GetX, Firebase, clean architecture, and more to build beautiful & responsive apps.",
            textAlign: TextAlign.center,
            style: getMediumStyle(
              color: ColorManager.lightGrey,
              fontSize: 20 * multiplier,
            ),
          ),
        ),
      ],
    );
  }
}
