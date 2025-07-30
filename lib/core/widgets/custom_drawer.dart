import 'package:my_portfolio/core/recourses/color_manager/color_manager.dart';
import 'package:my_portfolio/core/recourses/styles_manger/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/home_feature/presentation/controller/scroll_controller.dart';

class CustomAdminDrawer extends StatefulWidget {
  final GlobalKey homeKey;
  final GlobalKey aboutKey;
  final GlobalKey servicesKey;
  final GlobalKey projectsKey;
  final GlobalKey upcomingProjectsKey;
  final GlobalKey contactKey;
  final BuildContext context;

  const CustomAdminDrawer({
    super.key,
    required this.homeKey,
    required this.aboutKey,
    required this.servicesKey,
    required this.projectsKey,
    required this.upcomingProjectsKey,
    required this.contactKey,
    required this.context,
  });

  @override
  CustomAdminDrawerState createState() => CustomAdminDrawerState();
}

class CustomAdminDrawerState extends State<CustomAdminDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 600.w,
      child: Container(
        color: ColorManager.scaffoldBackGroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _drawerItem('الرئيسية', () => scrollTo(widget.homeKey)),
            _drawerItem('من نحن', () => scrollTo(widget.aboutKey)),
            _drawerItem('خدماتنا', () => scrollTo(widget.servicesKey)),
            _drawerItem('أعمالنا', () => scrollTo(widget.projectsKey)),
            _drawerItem('أعمالنا القادمة', () => scrollTo(widget.upcomingProjectsKey)),
            _drawerItem('اتصل بنا', () => scrollTo(widget.contactKey)),
          ],
        ),
      ),
    );
  }

  ListTile _drawerItem(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(title, textDirection: TextDirection.rtl,style: getSemiBoldStyle(color: Colors.white,fontSize: 45),),
      onTap: onTap,
    );
  }

  void openDrawer() {
    Scaffold.of(widget.context).openDrawer();
  }
}
