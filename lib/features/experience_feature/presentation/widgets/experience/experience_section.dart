import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/recourses/color_manager/color_manager.dart';
import 'package:my_portfolio/core/recourses/styles_manger/styles_manager.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final multiplier = isMobile ? 1.5 : 1.0;

    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth:  isMobile ?MediaQuery.of(context).size.width *.95:MediaQuery.of(context).size.width *.65),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ExperienceItem(
              title: "Flutter Developer – Al Nada Company",
              duration: "August 2024 – June 2025",
              points:
              '''Designed a seamless user interface that improved user engagement by 25%.Integrated robust API connections, improving data speed by 30%. Implemented responsive design for various screen sizes.''',
              multiplier: multiplier,
            ),
            SizedBox(height: 20.h),
            ExperienceItem(
              title: "Flutter Developer – Tamk Programming Company",
              duration: "June 2025 – Present",
              points:
              '''Developed modular Flutter apps using clean architecture.Built apps with Firebase, payment systems, and real-time chat Applied MVVM, BLoC, reusable widgets, and screen responsiveness.''',
              multiplier: multiplier,
            ),
          ],
        ),
      ),
    );
  }
}

class ExperienceItem extends StatelessWidget {
  final String title;
  final String duration;
  final String points;
  final double multiplier;

  const ExperienceItem({
    super.key,
    required this.title,
    required this.duration,
    required this.points,
    required this.multiplier,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: getBoldStyle(
            color:ColorManager.white,
            fontSize: 25 * multiplier,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          duration,
          textAlign: TextAlign.center,
          style: getMediumStyle(
            color: ColorManager.grey,
            fontSize: 16 * multiplier,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          points,
          textAlign: TextAlign.center,
          style: getMediumStyle(
            color: ColorManager.lightGrey,
            fontSize: 18 * multiplier,
          ),
        ),
      ],
    );
  }
}
