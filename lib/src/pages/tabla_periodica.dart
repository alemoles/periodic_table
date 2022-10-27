import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:periodic_table/src/models/data_layout.dart';
import 'package:periodic_table/src/widgets/elemento.dart';
import 'package:periodic_table/src/widgets/flip_card.dart';
import 'package:provider/provider.dart';

class TablaPeriodicaPage extends StatefulWidget {
  const TablaPeriodicaPage({Key? key}) : super(key: key);

  @override
  State<TablaPeriodicaPage> createState() => _TablaPeriodicaPageState();
}

class _TablaPeriodicaPageState extends State<TablaPeriodicaPage> {
  final controller = FlipCardController();
  @override
  Widget build(BuildContext context) {
    final elements = Provider.of<DataLayout>(context).elements;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => controller.flipCard(),
            child: FlipCardWidget(
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
          GestureDetector(
            onTap: () => controller.flipCard(),
            child: FlipCardWidget(
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
