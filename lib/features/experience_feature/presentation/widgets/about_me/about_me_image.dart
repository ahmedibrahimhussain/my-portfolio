import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutMeImage extends StatelessWidget {
  const AboutMeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Image.asset(
        'assets/images/flutter_dev_workspace.jpg',
        fit: BoxFit.cover,
        width: 500.w,
        height: 350.h,
      ),
    );
  }
}
