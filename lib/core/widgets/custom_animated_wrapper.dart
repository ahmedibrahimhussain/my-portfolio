import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CustomAnimatedWrapper extends StatelessWidget {
  final Widget child;
  final List<Effect>? effects;
  final Duration? delay;
  final Duration? duration;
  final Curve? curve;
  final bool autoPlay;
  final void Function(AnimationController)? onPlay;
  final void Function(AnimationController)? onComplete;

  const CustomAnimatedWrapper({
    super.key,
    required this.child,
    this.effects,
    this.delay,
    this.duration,
    this.curve,
    this.autoPlay = true,
    this.onPlay,
    this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    final animationDuration = duration ?? 1000.ms;
    final animationCurve = curve ?? Curves.easeOutQuart;

    return Animate(
      effects: effects ??
          [
            FadeEffect(
              duration: animationDuration,
              curve: animationCurve,
            ),
            SlideEffect(
              begin: const Offset(0, 0.2), // من الأسفل لأعلى
              end: Offset.zero,
              duration: animationDuration,
              curve: animationCurve,
            ),
            ScaleEffect(
              begin: const Offset(0.95, 0.95),
              end: const Offset(1.0, 1.0),
              duration: animationDuration,
              curve: animationCurve,
            ),
          ],
      delay: delay ?? 100.ms,
      onPlay: onPlay,
      onComplete: onComplete,
      autoPlay: autoPlay,
      child: child,
    );
  }
}

