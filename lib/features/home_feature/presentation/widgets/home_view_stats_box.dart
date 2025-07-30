import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/recourses/color_manager/color_manager.dart';
import '../controller/home_controller/home_cubit.dart';

class HomeViewStatsBox extends StatelessWidget {
  final bool isMobile;
  const HomeViewStatsBox({super.key, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccess) {
          final stats = state.model;

          final statWidgets = [
            _statItem('${stats.experienceYears}+ ', 'Years of Experience'),
            _statItem('${stats.mobileApps}', 'Mobile Apps'),
            _statItem('${stats.webProjects}', 'Web Projects'),
          ];

          return Container(
            padding: EdgeInsets.all(16.w),
            margin: isMobile ? EdgeInsets.symmetric(horizontal: 30.w) : null,
            decoration: BoxDecoration(
              color: const Color(0xFF2A2A2A),
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: isMobile
                ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: statWidgets
                  .map((widget) => Expanded(child: widget))
                  .toList(),
            )
                : Column(
              children: [
                statWidgets[0],
                Divider(color: ColorManager.grey),
                statWidgets[1],
                Divider(color: ColorManager.grey),
                statWidgets[2],
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _statItem(String number, String label) {
    final multiplier = isMobile ? 0.7 : 1.0;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 6.w),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 20 * multiplier,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.h),
          Text(
            number,
            style: TextStyle(
              fontSize: 26 * multiplier,
              color: Colors.tealAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
