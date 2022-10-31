import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:periodic_table/src/models/data_layout.dart';
import 'package:periodic_table/src/models/row_data.dart';
import 'package:periodic_table/src/utils/utils.dart';
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
  void initState() {
    super.initState();
    Provider.of<DataLayout>(
      context,
      listen: false,
    ).loadData();
  }

  List<Widget> buildData(Map<int, List<RowData>> elements) {
    final widgets = <Widget>[];

    for (MapEntry<int, List<RowData>> item in elements.entries) {
      widgets.add(
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: item.value
              .map(
                (element) => CardElement(
                  controller: controller,
                  data: element,
                ),
              )
              .toList(),
        ),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final elements = Provider.of<DataLayout>(context).elements;
    return Container(
      child: elements.isNotEmpty
          ? Row(
              children: [
                ...buildData(
                  elements,
                ),
              ],
            )
          : const CircularProgressIndicator.adaptive(),
    );
  }
}

class CardElement extends StatelessWidget {
  const CardElement({
    Key? key,
    required this.controller,
    required this.data,
  }) : super(key: key);

  final FlipCardController controller;
  final RowData data;

  @override
  Widget build(BuildContext context) {
    final symbols = data.symbolsUrl.map(
      (url) => _Symbol(
        url: url,
      ),
    );
    return GestureDetector(
      onTap: () => controller.flipCard(),
      child: FlipCardWidget(
        controller: controller,
        front: Elemento(
          atomicNumber: data.atomicNumber,
          atomicSymbol: data.atomicSymbol,
          name: data.name,
          widget: data.widget,
          image: SvgPicture.asset(
            data.imageUrl,
          ),
          symbols: [
            ...symbols,
          ],
          color: fromName(
            data.type,
          ),
        ),
        back: ElementBack(
          descripcion: data.descripcion,
          color: fromName(
            data.type,
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
