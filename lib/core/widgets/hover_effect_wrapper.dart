import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

enum HoverEffectType { none, float, scale, flood, threeD }

class HoverEffectWrapper extends StatefulWidget {
  final Widget child;
  final HoverEffectType effect;
  final Color normalBorderColor;
  final Color hoverBorderColor;

  const HoverEffectWrapper({
    super.key,
    required this.child,
    this.effect = HoverEffectType.float,
    this.normalBorderColor = const Color(0xFF2C2C2C),
    this.hoverBorderColor = const Color(0xFF333833),
  });

  @override
  State<HoverEffectWrapper> createState() => _HoverEffectWrapperState();
}

class _HoverEffectWrapperState extends State<HoverEffectWrapper> {
  bool _hovered = false;
  double _rotateX = 0;
  double _rotateY = 0;

  void _onHover(PointerHoverEvent event) {
    if (widget.effect == HoverEffectType.threeD) {
      final renderBox = context.findRenderObject() as RenderBox;
      final size = renderBox.size;
      final center = size.center(Offset.zero);
      final dx = (event.localPosition.dx - center.dx) / center.dx;
      final dy = (event.localPosition.dy - center.dy) / center.dy;

      setState(() {
        _rotateY = dx * 0.35;
        _rotateX = -dy * 0.35;
      });
    }
  }

  void _onExit(PointerExitEvent event) {
    _setHovered(false);
    _rotateX = 0;
    _rotateY = 0;
  }

  void _setHovered(bool hovered) => setState(() => _hovered = hovered);

  @override
  Widget build(BuildContext context) {
    Matrix4 transform = Matrix4.identity();

    if (_hovered) {
      switch (widget.effect) {
        case HoverEffectType.float:
          transform = Matrix4.translationValues(0, -10, 0);
          break;
        case HoverEffectType.scale:
          transform = Matrix4.identity()..scale(1.05);
          break;
        case HoverEffectType.flood:
          transform = Matrix4.translationValues(0, -5, 0)..scale(1.03);
          break;
        case HoverEffectType.threeD:
          transform =
              Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(_rotateX)
                ..rotateY(_rotateY);
          break;
        case HoverEffectType.none:
          transform = Matrix4.identity();
          break;
      }
    }

    return MouseRegion(
      onEnter: (_) => _setHovered(true),
      onExit: _onExit,
      onHover: _onHover,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        transform: transform,
        decoration: BoxDecoration(
          border: Border.all(
            color:
                _hovered ? widget.hoverBorderColor : widget.normalBorderColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow:
              _hovered
                  ? [
                    BoxShadow(
                      color: widget.hoverBorderColor.withOpacity(
                        widget.effect == HoverEffectType.flood ? 0.8 : 0.4,
                      ),
                      blurRadius:
                          widget.effect == HoverEffectType.flood ? 20 : 10,
                      spreadRadius:
                          widget.effect == HoverEffectType.flood ? 4 : 1,
                      offset: const Offset(0, 4),
                    ),
                  ]
                  : [],
        ),
        child: widget.child,
      ),
    );
  }
}
