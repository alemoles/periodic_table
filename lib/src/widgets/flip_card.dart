import 'dart:math';

import 'package:flutter/material.dart';

class FlipCardWidget extends StatefulWidget {
  final FlipCardController controller;
  final Widget front;
  final Widget back;
  const FlipCardWidget({
    Key? key,
    required this.controller,
    required this.front,
    required this.back,
  }) : super(key: key);

  @override
  State<FlipCardWidget> createState() => _FlipCardWidgetState();
}

class _FlipCardWidgetState extends State<FlipCardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool isFront = true;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 800,
      ),
    );
    widget.controller._state = this;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future flipCard() async {
    if (controller.isAnimating) return;
    if (isFront) {
      await controller.forward();
    } else {
      await controller.reverse();
    }
    isFront = !isFront;
  }

  bool isFrontImage(double angle) {
    const degrees90 = pi / 2;
    const degrees270 = 3 * pi / 2;

    return angle <= degrees90 || angle >= degrees270;
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final angle = controller.value * pi;
        final transform = Matrix4.identity()
          ..rotateY(
            angle,
          );
        return Transform(
          transform: transform,
          alignment: Alignment.center,
          child: isFrontImage(angle.abs())
              ? widget.front
              : Transform(
                  transform: Matrix4.identity()
                    ..rotateY(
                      pi,
                    ),
                  alignment: Alignment.center,
                  child: widget.back,
                ),
        );
      });
}

class FlipCardController {
  _FlipCardWidgetState? _state;

  Future flipCard() async => _state?.flipCard();
}
