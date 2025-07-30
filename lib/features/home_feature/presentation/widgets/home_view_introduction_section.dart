import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/recourses/color_manager/color_manager.dart';
import 'package:my_portfolio/core/recourses/styles_manger/styles_manager.dart';

class HomeViewIntroductionSection extends StatelessWidget {
  const HomeViewIntroductionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;
    final multiplier = isMobile ? 2.3 : 1.0;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 40.sp : 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '''class DevInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      child: (''',
                style: getRegularStyle(
                  fontSize: 16 * multiplier,
                  color: ColorManager.grey,
                ),
              ),
              SizedBox(height: 8.h),

              Padding(
                padding: EdgeInsets.only(left: 0.w),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Hey I’m ',
                        style: getRegularStyle(
                          fontSize: 27 * multiplier,
                          color: ColorManager.white,
                        ),
                      ),
                      TextSpan(
                        text: 'Ahmed Ibrahim Hussain,',
                        style: getBoldStyle(
                          fontSize: 35 * multiplier,
                          color: ColorManager.white,
                        ),
                      ),
                      TextSpan(
                        text: '\nFlutter Developer',
                        style: getRegularStyle(
                          fontSize: 35 * multiplier,
                          color: ColorManager.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: SizedBox(
                  width: isMobile ? double.infinity : 500.w,
                  child: Text(
                    '''As a Flutter developer, I specialize in building high-performance, scalable mobile and web applications that drive business success. I’m passionate about crafting clean, maintainable code and delivering pixel-perfect user interfaces. If you're looking for a results-driven developer who transforms ideas into seamless digital experiences — you're in the right place''',
                    style: getMediumStyle(
                      fontSize: 16 * multiplier,
                      color: ColorManager.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 8.h),

              Text(
                '      ),\n    );\n  }\n}',
                style: getRegularStyle(
                  fontSize: 16 * multiplier,
                  color: ColorManager.grey,
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ],
    );
  }
}
