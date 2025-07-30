import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/recourses/color_manager/color_manager.dart';
import 'package:my_portfolio/core/recourses/images_manger/images.dart';
import 'package:my_portfolio/core/recourses/styles_manger/styles_manager.dart';
import '../widgets/contact_row.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final multiplier = isMobile ? 2.0 : 1.0;

    return Stack(
      children: [
        Container(
          height: 0.3.sh,
          width: double.infinity,
          color: ColorManager.black,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 32.h),
          child: isMobile
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                ImagesManger.fullLogo,
                height:  MediaQuery.of(context).size.height * .3,
                width: MediaQuery.of(context).size.width * .8,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20.h),

              Row(
                children: [    Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: contactData
                      .map(
                        (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: ContactRow(
                        imageUrl: item['image']!,
                        text: item['text']!,
                        multiplier: multiplier,
                      ),
                    ),
                  )
                      .toList(),
                ),
                  Column(
                    children: [
                      Text(
                        'Let\'s Work Together',
                        style: getBoldStyle(
                          color: Colors.white,
                          fontSize: 24 * multiplier,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        'I\'m Ahmed, a passionate Flutter developer\nready to bring your ideas to life!',
                        style: getMediumStyle(
                          color: Colors.white70,
                          fontSize: 14 * multiplier,
                        ),
                        textAlign: TextAlign.center,
                      ), SizedBox(height: 80.h),
                    ],
                  ),


                ],
              ),
            ],
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Contact Info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: contactData
                    .map(
                      (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ContactRow(
                      imageUrl: item['image']!,
                      text: item['text']!,
                      multiplier: multiplier,
                    ),
                  ),
                )
                    .toList(),
              ),

              // About Me Text
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Let\'s Work Together',
                    style: getBoldStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'I\'m Ahmed, a passionate Flutter developer\nready to bring your ideas to life!',
                    style: getMediumStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              // Logo
              Image.asset(
                ImagesManger.fullLogo,
                height: 300.h,
                width: 350.w,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

const List<Map<String, String>> contactData = [
  {
    'image': 'https://cdn-icons-png.flaticon.com/512/724/724664.png',
    'text': '+20 01064544851',
  },
  {
    'image': 'https://cdn-icons-png.flaticon.com/512/732/732200.png',
    'text': 'ihahima4321@email.com',
  },
  {
    'image': 'https://cdn-icons-png.flaticon.com/512/732/732200.png',
    'text': 'ahmedibrahim5544332211@email.com',
  },
  {
    'image': 'https://cdn-icons-png.flaticon.com/512/145/145807.png',
    'text': 'https://www.linkedin.com/in/ahmed-ibrahim-119a6535b',
  },
];
