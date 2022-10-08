import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Elemento extends StatelessWidget {
  final Color color;
  final String atomicSymbol;
  final List<Widget> symbols;
  final int atomicNumber;
  final String name;
  final Widget image;
  final String widget;
  const Elemento({
    Key? key,
    this.color = Colors.blueAccent,
    required this.atomicSymbol,
    this.symbols = const <Icon>[],
    required this.atomicNumber,
    required this.name,
    required this.widget,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Row inicial
          _ElementoHeader(
            atomicSymbol: atomicSymbol,
            atomicNumber: atomicNumber,
            symbols: symbols,
          ),
          // Nombre
          SizedBox(
            height: 2,
          ),
          Text(
            name,
            style: GoogleFonts.roboto(),
          ),
          SizedBox(
            height: 5,
          ),
          // Image
          Container(
            height: 60,
            child: image,
          ),
          // Widgets
          SizedBox(
            height: 5,
          ),
          Text(
            widget,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ElementoHeader extends StatelessWidget {
  final String atomicSymbol;
  final List<Widget> symbols;
  final int atomicNumber;
  const _ElementoHeader({
    Key? key,
    required this.atomicSymbol,
    this.symbols = const <Widget>[],
    required this.atomicNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 3,
              left: 3,
            ),
            child: Text(atomicSymbol),
          ),
          Row(
            children: [
              Container(
                height: 15,
                width: 15,
                child: SvgPicture.asset(
                  'assets/svgs/person.svg',
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 3,
              right: 3,
            ),
            child: Text("$atomicNumber"),
          ),
        ],
      ),
    );
  }
}
