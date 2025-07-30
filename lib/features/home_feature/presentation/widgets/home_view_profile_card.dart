import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/recourses/color_manager/color_manager.dart';
import 'package:my_portfolio/core/recourses/images_manger/images.dart';
import 'package:my_portfolio/core/widgets/custom_button.dart';
import '../../../../core/recourses/styles_manger/styles_manager.dart';

class HomeViewProfileCard extends StatelessWidget {
  const HomeViewProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 35.h),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagesManger.homeBackground),
          fit: BoxFit.cover,
        ),
        border: Border.all(color: ColorManager.lightGrey, width: 3),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(120.r),
          bottomRight: Radius.circular(120.r),
        ),
        color: ColorManager.scaffoldBackGroundColor,
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 70.r,
            backgroundImage: const NetworkImage(
              'https://avatars.githubusercontent.com/u/49122783?v=4',
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Ahmed Ibrahim',
            style: getBoldStyle(fontSize: 20, color: Colors.white),
          ),

          SizedBox(height: 12.h),
          _infoRow(Icons.email, 'ihahima54321@gmail.com'),
          _infoRow(Icons.location_on, 'Egypt'),
          _infoRow(Icons.work, 'Full-time / Part-time / Freelancer'),
          SizedBox(height: 12.h),
          Wrap(
            runSpacing: 6.h,
            spacing: 6.w,
            children: [
              _chip('Flutter'),
              _chip('Dart'),
              _chip('Bloc'),
              _chip('REST API'),
              _chip('Clean Architecture'),
            ],
          ),
          SizedBox(height: 20.h),
          CustomButton(
            text: "Download CV",
            onPressed: () {},
            backgroundColor: ColorManager.white,
            foregroundColor: ColorManager.primary,
            width: 160.w,
            height: 45.h,
          ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h),
      child: Row(
        children: [
          Icon(icon, color: ColorManager.lightGrey, size: 16),
          SizedBox(width: 6.w),
          Flexible(
            child: Text(
              text,
              style: getBoldStyle(color: Colors.white70, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: ColorManager.white,
      labelStyle: getBoldStyle(color: ColorManager.primary, fontSize: 10),
    );
  }
}
