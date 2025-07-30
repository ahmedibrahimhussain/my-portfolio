import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';


class AboutMeTextCard extends StatelessWidget {
  final bool isMobile;
  const AboutMeTextCard({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
      ),
      child: SelectableText.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "<p>\n",
              style: getMediumStyle(color: ColorManager.amber, fontSize: 14.sp),
            ),
            TextSpan(
              text: "  Hello Flutter Devs!\n",
              style: getBoldStyle(color: ColorManager.lightGrey, fontSize: 18.sp),
            ),
            TextSpan(
              text:
              "  I'm a Flutter Developer specializing in building beautiful,\n"
                  "  high-performance apps for both Android and iOS.\n\n",
              style: getMediumStyle(color: ColorManager.lightGrey, fontSize: 14.sp),
            ),
            TextSpan(
              text: "  Skills: ",
              style: getSemiBoldStyle(color: ColorManager.white, fontSize: 14.sp),
            ),
            TextSpan(
              text: "Dart, Flutter, Firebase, REST API, Clean Architecture\n\n",
              style: getMediumStyle(color: ColorManager.amber, fontSize: 14.sp),
            ),
            TextSpan(
              text: "  When I'm not coding, I love writing blogs,\n"
                  "  exploring UI/UX trends, and learning new tools.\n",
              style: getMediumStyle(color: ColorManager.lightGrey, fontSize: 14.sp),
            ),
            TextSpan(
              text: "</p>",
              style: getMediumStyle(color: ColorManager.amber, fontSize: 14.sp),
            ),
          ],
        ),
        style: TextStyle(fontFamily: 'monospace'),
      ),
    );
  }
}
