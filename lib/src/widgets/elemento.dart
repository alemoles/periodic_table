import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:periodic_table/src/widgets/card_container.dart';

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
    return CardContainer(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
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
            const SizedBox(
              height: 2,
            ),
            Text(
              name,
              style: GoogleFonts.roboto().copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            // Image
            SizedBox(
              height: 45,
              child: image,
            ),
            // Widgets
            const SizedBox(
              height: 5,
            ),
            Text(
              widget,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto().copyWith(
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}

class ElementBack extends StatelessWidget {
  const ElementBack({
    Key? key,
    this.color = Colors.blueAccent,
    required this.descripcion,
  }) : super(key: key);

  final Color color;
  final String descripcion;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      child: Text(
        descripcion,
        textAlign: TextAlign.center,
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
            children: [...symbols],
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
