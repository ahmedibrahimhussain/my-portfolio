import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/recourses/constants/constants.dart';
import '../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../core/routing/routes.dart';
import 'projects_animation_card.dart';

class ProjectsGridview extends StatelessWidget {
  const ProjectsGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection('projects').get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text(
              "لا يوجد برامج حالياً.",
              style: getBoldStyle(),
            ),
          );
        }

        final docs = snapshot.data!.docs;
        final screenWidth = MediaQuery.of(context).size.width;
        final isMobile = screenWidth < Constants.mobileSize;

        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 70.w : 10.w),
            child: GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: docs.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 1 : 3,
                crossAxisSpacing: isMobile ? 20.w : 30.w,
                mainAxisSpacing: 40.h,
                childAspectRatio: isMobile?1.65.h:1.55.h,
              ),
              itemBuilder: (context, index) {
                final data = docs[index].data() as Map<String, dynamic>;

                return ProjectsAnimationCard(
                  imagePath: data['coverImage'] ?? '',
                  title: data['name'] ?? '',
                  description: data['description'],
                  isMobile: isMobile,
                  onTap: () {
                    context.go('${Routes.detailsView}/${docs[index].id}');
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
