import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../core/recourses/constants/constants.dart';
import '../../../../core/widgets/hover_effect_wrapper.dart';

class DetailsCard extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;

  const DetailsCard({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < Constants.mobileSize;

    final double cardWidth = isMobile ? 600.w : 200.w;
    final double cardHeight = isMobile ? 250.h : 400.h;
    final double padding = isMobile ? 6.sp : 12.sp;
    final double borderRadius = 20.r;
    final double shadowBlur = 20.r;

    return Padding(
      padding: EdgeInsets.all(padding),
      child: HoverEffectWrapper(
        hoverBorderColor: ColorManager.primary,
        effect: HoverEffectType.scale,
        child: Container(
          width: width ?? cardWidth,
          height: height ?? cardHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: shadowBlur,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Image.network(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: Center(
                    child: Icon(Icons.broken_image, color: Colors.grey, size: 40.sp),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
