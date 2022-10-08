import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:periodic_table/src/widgets/elemento.dart';

class TablaPeriodicaPage extends StatelessWidget {
  const TablaPeriodicaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Elemento(
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
    );
  }
}
