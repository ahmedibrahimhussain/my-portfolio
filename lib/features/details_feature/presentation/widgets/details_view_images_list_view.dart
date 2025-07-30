import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../core/recourses/constants/constants.dart';
import '../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../core/widgets/animated_text.dart';
import 'details_card.dart';

class DetailsViewImagesListView extends StatelessWidget {
  const DetailsViewImagesListView({
    super.key,
    required this.title,
    required this.images,
  });

  final String title;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth < 600 ? 20.w : 20.w;
    final isMobile = screenWidth < Constants.mobileSize;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        children: [
          SizedBox(height: 60.h),
          CustomAnimatedText(
            text: 'تفاصيل من $title',
            style: getBoldStyle(fontSize:isMobile ? 50 : 40, color: ColorManager.white),
          ),
          SizedBox(height: 30.h),
          ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              scrollbars: true,
              dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
            ),
            child: SizedBox(
              height: 600.h,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                separatorBuilder: (context, index) => SizedBox(width: 12.w),
                itemBuilder: (context, index) => DetailsCard(imagePath: images[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
