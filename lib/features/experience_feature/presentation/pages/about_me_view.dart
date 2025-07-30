import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../core/recourses/constants/constants.dart';
import '../../../../core/recourses/images_manger/images.dart';
import '../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../core/widgets/animated_text.dart';
import '../../../../core/widgets/custom_image.dart';

class AboutMeView extends StatelessWidget {
  const AboutMeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 80.h, horizontal: 40.w),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 900;

          return isMobile
              ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                  CustomAnimatedText(
                    text: Constants.advantagesViewText1,
                    style: getSemiBoldStyle(
                      fontSize: 90,
                      color: ColorManager.amber,
                    ),
                  ),
                  SizedBox(height: 20.h),

                  SizedBox(
                    width:  MediaQuery.of(context).size.width * .95,
                    child: SelectableText(
                      Constants.advantagesViewText2,
                      textAlign: TextAlign.center,
                      style: getRegularStyle(
                        fontSize: 50,
                        color: ColorManager.lightGrey,
                      ),
                    ),
                  ),
                  SizedBox(height: 60.h),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Image(
                      image: AssetImage(ImagesManger.aboutMeImage2),
                      height: MediaQuery.of(context).size.height * .4,
                      width: MediaQuery.of(context).size.width * .9,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAnimatedText(
                          text: Constants.aboutMeText,
                          style: getBoldStyle(
                            fontSize: 30,
                            color: ColorManager.white,
                          ),
                        ),
                        SizedBox(height: 30.h),

                        CustomAnimatedText(
                          text:  Constants.advantagesViewText1,
                          style: getSemiBoldStyle(
                            fontSize: 40,
                            color: ColorManager.amber,
                          ),
                        ),
                        SizedBox(height: 16.h),

                        SelectableText(
                          Constants.advantagesViewText2,
                          style: getRegularStyle(
                            fontSize: 25,
                            color: ColorManager.lightGrey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Image(
                      image: AssetImage(ImagesManger.aboutMeImage2),
                      height: MediaQuery.of(context).size.height * .7,
                      width: MediaQuery.of(context).size.width * .45,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
        },
      ),
    );
  }
}
