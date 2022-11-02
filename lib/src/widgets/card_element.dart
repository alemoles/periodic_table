import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:periodic_table/src/models/data_layout.dart';
import 'package:periodic_table/src/models/row_data.dart';
import 'package:periodic_table/src/utils/utils.dart';
import 'package:periodic_table/src/widgets/elemento.dart';
import 'package:periodic_table/src/widgets/flip_card.dart';
import 'package:provider/provider.dart';

class CardElement extends StatefulWidget {
  const CardElement({
    Key? key,
    required this.data,
  }) : super(key: key);

  final RowData data;

  @override
  State<CardElement> createState() => _CardElementState();
}

class _CardElementState extends State<CardElement> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final symbols = widget.data.symbolsUrl.map(
      (url) => _Symbol(
        url: url,
      ),
    );
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 200,
      ),
      padding: EdgeInsets.only(top: 0, bottom: !(isHover) ? 0 : 5),
      child: InkWell(
        onTap: () => print('Description'),
        onHover: (value) {          
          setState(() {
            isHover = value;
          });
          Provider.of<DataLayout>(context, listen: false).description =
              widget.data.descripcion;
        },
        child: Elemento(
          atomicNumber: widget.data.atomicNumber,
          atomicSymbol: widget.data.atomicSymbol,
          name: widget.data.name,
          widget: widget.data.widget,
          image: SvgPicture.asset(
            widget.data.imageUrl,
          ),
          symbols: [
            ...symbols,
          ],
          color: fromName(
            widget.data.type,
          ),
        ),
      ),
    );
  }
}

class _Symbol extends StatelessWidget {
  const _Symbol({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 1,
      ),
      child: SizedBox(
        height: 15,
        width: 15,
        child: SvgPicture.asset(
          url,
        ),
      ),
    );
  }
}
