import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/recourses/constants/constants.dart';
import '../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../core/widgets/animated_text.dart';
import '../widgets/projects_gridview.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
  final isMobile = screenWidth < Constants.mobileSize;
    return Column(
      children: [
        CustomAnimatedText(
          text: "My Projects",
          style: getBoldStyle(fontSize: isMobile ? 90 : 30, color: ColorManager.amber),
        ),
        SizedBox(height: 30.h),
        const ProjectsGridview(),
        SizedBox(height: 30.h),
      ],
    );
  }
}
