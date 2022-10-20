import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:periodic_table/src/widgets/elemento.dart';

class TablaPeriodicaPage extends StatefulWidget {
  const TablaPeriodicaPage({Key? key}) : super(key: key);

  @override
  State<TablaPeriodicaPage> createState() => _TablaPeriodicaPageState();
}

class _TablaPeriodicaPageState extends State<TablaPeriodicaPage> {
  final controller = FlipCardController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: () => controller.flipCard(),
            child: _FlipCardWidget(
              controller: controller,
              front: Elemento(
                atomicNumber: 1,
                atomicSymbol: "H",
                name: "Hidrogeno",
                widget: "Sol y Estrellas",
                image: SvgPicture.asset('assets/svgs/sun.svg'),
                symbols: [
                  SvgPicture.asset(
                    'assets/svgs/person.svg',
                  ),
                ],
              ),
              back: ElementBack(
                descripcion: "Hidrogeno",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FlipCardWidget extends StatefulWidget {
  final FlipCardController controller;
  final Widget front;
  final Widget back;
  const _FlipCardWidget({
    Key? key,
    required this.front,
    required this.back,
    required this.controller,
  }) : super(key: key);

  @override
  State<_FlipCardWidget> createState() => __FlipCardWidgetState();
}

class __FlipCardWidgetState extends State<_FlipCardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool isFront = true;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(
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
    final degrees90 = pi / 2;
    final degrees270 = 3 * pi / 2;

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
  __FlipCardWidgetState? _state;

  Future flipCard() async => _state?.flipCard();
}
