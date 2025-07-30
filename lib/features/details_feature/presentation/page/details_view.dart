import 'package:my_portfolio/features/details_feature/data/models/details_model.dart';
import 'package:my_portfolio/features/details_feature/data/services/services.dart';
import 'package:my_portfolio/features/details_feature/presentation/widgets/details_view_images_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../contact_us_feature/presentation/pages/contact_us_view.dart';
import '../widgets/details_view_top_part.dart';

class DetailsView extends StatelessWidget {
  final String projectId;

  const DetailsView({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<DetailsModel?>(
        future: DetailsServices.fetchProject(projectId: projectId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || !snapshot.hasData) {
            return const Center(child: Text('حدث خطأ أثناء تحميل البيانات'));
          }

          final project = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80.h),
                DetailsViewTopPart(
                  imagePath: project.coverImage,
                  title: project.name,
                  description: project.description,
                ),
                const SizedBox(height: 24),
                DetailsViewImagesListView(
                  title: project.name,
                  images: project.appImages,
                ),
                const ContactUsView(),
              ],
            ),
          );
        },
      ),
    );
  }
}
