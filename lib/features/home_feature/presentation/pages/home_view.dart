import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/recourses/color_manager/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/features/home_feature/presentation/widgets/home_view_profile_card.dart';
import '../../../../core/recourses/images_manger/images.dart';
import '../../../../core/recourses/styles_manger/styles_manager.dart';
import '../widgets/home_view_introduction_section.dart';
import '../widgets/home_view_stats_box.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;

        if (isMobile) {
          return Stack(
            children: [
              ShaderMask(
                shaderCallback: (bounds) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      ColorManager.scaffoldBackGroundColor,
                      Colors.transparent,
                    ],
                    stops: [.95, 1],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset(
                  ImagesManger.homeBackground,
                  height: MediaQuery.of(context).size.height *1.1,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 30.h,
                  ),
                  child: Column(
                    spacing: 30.h,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [SizedBox(height: 30.h,),
                      Text(
                        'Flutter Developer',
                        style: getBoldStyle(
                          fontSize: 100,
                          color: ColorManager.amber,
                        ),
                      ),

                      HomeViewIntroductionSection(),
                      HomeViewStatsBox(isMobile: true),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          return Stack(
            children: [
              ShaderMask(
                shaderCallback: (bounds) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      ColorManager.scaffoldBackGroundColor,
                      Colors.transparent,
                    ],
                    stops: [.95, 1],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset(
                  ImagesManger.homeBackground,
                  height: MediaQuery.of(context).size.height ,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .18,
                left: MediaQuery.of(context).size.width * .05,
                child: HomeViewProfileCard(),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .13,
                left: MediaQuery.of(context).size.width * .3,
                child: Text(
                  'Flutter Developer',
                  style: getBoldStyle(fontSize: 60, color: ColorManager.amber),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .28,
                left: MediaQuery.of(context).size.width * .3,
                child: HomeViewIntroductionSection(),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .2,
                left: MediaQuery.of(context).size.width * .8,
                child: HomeViewStatsBox(),
              ),
            ],
          );
        }
      },
    );
  }
}
