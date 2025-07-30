import 'package:my_portfolio/core/recourses/styles_manger/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAnimatedText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  const CustomAnimatedText({super.key, required this.text, this.style});

  @override
  CustomAnimatedTextState createState() => CustomAnimatedTextState();
}

class CustomAnimatedTextState extends State<CustomAnimatedText>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;
  late String _displayText;

  @override
  void initState() {
    super.initState();
    _displayText = '';
    _controller = AnimationController(
      duration: Duration(milliseconds: widget.text.length * 100),
      vsync: this,
    );

    _animation = IntTween(
      begin: 0,
      end: widget.text.length,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addListener(() {
      setState(() {
        _displayText = widget.text.substring(0, _animation.value);
      });
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      _displayText,
      style: widget.style ?? getBoldStyle(color: Colors.white, fontSize: 25.sp),

    );
  }
}
