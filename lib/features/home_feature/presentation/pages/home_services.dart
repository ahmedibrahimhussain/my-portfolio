import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/recourses/images_manger/images.dart';
import '../../../../core/services/url_services.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../contact_us_feature/presentation/pages/contact_us_view.dart';
import '../../../experience_feature/presentation/pages/about_me_view.dart';
import '../../../experience_feature/presentation/pages/experience_view.dart';
import '../../../projects_feature/presentation/pages/projects_view.dart';
import '../pages/home_view.dart';

class HomeServices extends StatelessWidget {
  HomeServices({super.key});

  final ScrollController scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey upcomingProjectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomAdminDrawer(
        context: context,
        homeKey: homeKey,
        aboutKey: aboutKey,
        servicesKey: servicesKey,
        projectsKey: projectsKey,
        upcomingProjectsKey: upcomingProjectsKey,
        contactKey: contactKey,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(20.0.sp),
        child: GestureDetector(
          onTap: () => openWhatsApp("1064544851"),
          child: SvgPicture.asset(
            ImagesManger.whatsapp,
            height: MediaQuery.of(context).size.height * .1,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(key: homeKey, child: HomeView()),
                Container(key: aboutKey, child: AboutMeView()),
                Container(key: servicesKey, child: ExperienceView()),
                Container(key: projectsKey, child: ProjectsView()),
                Container(key: contactKey, child: ContactUsView()),
              ],
            ),
          ),

          Positioned(top: 10.h,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: customAdminAppBar(
                context,
                homeKey: homeKey,
                aboutKey: aboutKey,
                servicesKey: servicesKey,
                projectsKey: projectsKey,
                upcomingProjectsKey: upcomingProjectsKey,
                contactKey: contactKey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
