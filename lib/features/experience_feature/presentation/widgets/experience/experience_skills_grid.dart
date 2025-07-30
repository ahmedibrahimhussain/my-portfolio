import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/recourses/color_manager/color_manager.dart';
import 'package:my_portfolio/core/recourses/styles_manger/styles_manager.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> skills = [
      {"Dart": "https://upload.wikimedia.org/wikipedia/commons/7/7e/Dart-logo.png"},
      {"Flutter": "https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png"},
      {"BLoC": "https://i1.wp.com/resocoder.com/wp-content/uploads/2020/08/blocsmol.png?w=694&ssl=1"},
      {"GetX": "https://www.wladimirfilho.com/getx_logo.png"},
      {"MVVM": "https://th.bing.com/th/id/R.85b5668257d8d11fa5ce0b2f9b02201c?rik=wQIQ6FuOIf4QGw&pid=ImgRaw&r=0"},
      {"SOLID": "https://tse2.mm.bing.net/th/id/OIP.pl0icxmhhZPHdbSCwjzHtgHaHa?rs=1&pid=ImgDetMain&o=7&rm=3"},
      {"Firebase": "https://static.vecteezy.com/system/resources/previews/053/066/797/non_2x/free-logo-firebase-free-png.png"},
      {"SQFLite": "https://cdn-icons-png.flaticon.com/512/1792/1792486.png"},
      {"Maps": "https://th.bing.com/th/id/R.0d3af2b49877a4305282ecf378b0d752?rik=BS4NLcqacmV3cA&pid=ImgRaw&r=0"},
      {"Payment": "https://cdn-icons-png.flaticon.com/512/196/196561.png"},
      {"Figma": "https://cdn-icons-png.flaticon.com/512/5968/5968705.png"},
      {"Git": "https://cdn-icons-png.flaticon.com/512/2111/2111288.png"},
      {"Teamwork": "https://cdn-icons-png.flaticon.com/512/2620/2620972.png"},
    ];

    final isMobile = MediaQuery.of(context).size.width < 800;
    final multiplier = isMobile ? 1.6 : 1.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 30.w : 0),
      child: Wrap(
        spacing: 30.w,
        runSpacing: 30.h,
        alignment: WrapAlignment.center,
        children: skills
            .map((item) => SkillItem(
          title: item.keys.first,
          imageUrl: item.values.first,
          multiplier: multiplier,
        ))
            .toList(),
      ),
    );
  }
}

class SkillItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double multiplier;

  const SkillItem({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.multiplier,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          imageUrl,
          width: 70.w * multiplier,
          height: 70.w * multiplier,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) =>
          const Icon(Icons.error, color: Colors.red),
        ),
        SizedBox(height: 8.h),
        Text(
          title,
          style: getBoldStyle(
            color: ColorManager.white,
            fontSize: 16 * multiplier,
          ),
        ),
      ],
    );
  }
}
