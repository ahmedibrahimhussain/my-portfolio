import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/recourses/styles_manger/styles_manager.dart';

class ContactRow extends StatelessWidget {
  final String imageUrl;
  final String text;
  final double multiplier;

  const ContactRow({
    super.key,
    required this.imageUrl,
    required this.text,
    required this.multiplier,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          imageUrl,
          height: 20.h * multiplier,
          width: 20.w * multiplier,
          color: null,
        ),
        SizedBox(width: 10.w),
        SelectableText(
          text,
          style: getMediumStyle(
            color: Colors.white,
            fontSize: 14 * multiplier,
          ),
        ),
      ],
    );
  }
}
