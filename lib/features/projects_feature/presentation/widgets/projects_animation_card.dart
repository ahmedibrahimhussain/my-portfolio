import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../core/widgets/hover_effect_wrapper.dart';

class ProjectsAnimationCard extends StatelessWidget {
  const ProjectsAnimationCard({
    super.key,
    this.cardWidth,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.onTap,
    required this.isMobile,
  });

  final Function() onTap;
  final bool isMobile;
  final double? cardWidth;
  final String title;
  final String description;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return HoverEffectWrapper(
      effect: HoverEffectType.flood,
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: EdgeInsets.all(isMobile ? 25.sp : 10.sp),
              width: cardWidth,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(17.r),
                border: Border.all(color: Colors.white.withOpacity(0.8)),

              ),
              child: Column(
                children: [
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SelectableText(
                          title,
                          style: getBoldStyle(
                            fontSize: isMobile ? 60 : 20,
                            color: ColorManager.white,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        SelectableText(
                          description,
                          maxLines: 3,
                          scrollPhysics: NeverScrollableScrollPhysics(),
                          style: getMediumStyle(
                            fontSize: isMobile ? 55 : 14,
                            color: ColorManager.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.network(
                        imagePath,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
