import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/home_feature/presentation/controller/scroll_controller.dart';
import '../recourses/color_manager/color_manager.dart';
import '../recourses/constants/constants.dart';
import '../recourses/images_manger/images.dart';
import '../recourses/styles_manger/styles_manager.dart';

PreferredSize customAdminAppBar(
    BuildContext context, {
      required GlobalKey homeKey,
      required GlobalKey aboutKey,
      required GlobalKey servicesKey,
      required GlobalKey projectsKey,
      required GlobalKey upcomingProjectsKey,
      required GlobalKey contactKey,
    }) {
  final isMobile = MediaQuery.of(context).size.width < Constants.mobileSize;
  return PreferredSize(
    preferredSize: Size(double.infinity, 50.h),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(100.r),
              border: Border.all(color: Colors.white.withOpacity(0.3)),

            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (isMobile)
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  )
                else
                  Row(
                    children: [
                      AppBarItem(
                        title: 'Home',
                        onTap: () => scrollTo(homeKey),
                      ),
                      AppBarItem(
                        title: 'About',
                        onTap: () => scrollTo(aboutKey),
                      ),
                      AppBarItem(
                        title: 'Skills',
                        onTap: () => scrollTo(servicesKey),
                      ),
                      AppBarItem(
                        title: 'Projects',
                        onTap: () => scrollTo(projectsKey),
                      ),
                      AppBarItem(
                        title: 'Contact',
                        onTap: () => scrollTo(contactKey),
                      ),
                    ],
                  ),
                Image.asset(
                  ImagesManger.nameLogo,
                  width: isMobile ?500.w:300.w,height: 50,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class AppBarItem extends StatefulWidget {
  final String title;
  final VoidCallback? onTap;

  const AppBarItem({super.key, required this.title, this.onTap});

  @override
  State<AppBarItem> createState() => _AppBarItemState();
}

class _AppBarItemState extends State<AppBarItem> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: _isHovering
                ? Colors.white.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(16.r),
            border: _isHovering
                ? Border.all(color: Colors.white.withOpacity(0.3))
                : null,
          ),
          child: Text(
            widget.title,
            style: getMediumStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
