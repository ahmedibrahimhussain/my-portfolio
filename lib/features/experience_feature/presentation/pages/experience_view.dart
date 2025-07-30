import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/features/experience_feature/presentation/widgets/experience/experience_skills_grid.dart';
import 'package:my_portfolio/features/experience_feature/presentation/widgets/experience/experience_title_section.dart';
import '../../data/model/experience_model.dart';
import '../widgets/experience/experience_section.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const ExperienceTitleSection(),
        SizedBox(height: 30.h),
        const ExperienceSection(),
        SizedBox(height: 50.h),
        const SkillsSection(),        SizedBox(height: 50.h),

      ],
    );
  }
}
