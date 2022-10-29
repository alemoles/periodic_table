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

  List<Widget> buildData(List<RowData> elements) {
    final widgets = <Widget>[];
    final rowData = <Widget>[];
    for (int index = 0; index < elements.length; index++) {
      rowData.add(
        CardElement(
          controller: controller,
          data: elements[index],
        ),
      );
      if (elements[index].atomicNumber == 2 ||
          elements[index].atomicNumber == 10) {
        widgets.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: rowData.toList(),
          ),
        );
        rowData.clear();
      }
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final elements = Provider.of<DataLayout>(context).elements;
    return Container(
      child: elements.isNotEmpty
          ? Column(
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
    return GestureDetector(
      onTap: () => controller.flipCard(),
      child: FlipCardWidget(
        controller: controller,
        front: Elemento(
          atomicNumber: data.atomicNumber,
          atomicSymbol: data.atomicSymbol,
          name: data.name,
          widget: data.widget,
          image: SvgPicture.asset(data.imageUrl),
          symbols: [
            SvgPicture.asset(
              data.symbolsUrl[0],
            ),
          ],
          color: fromName(
            data.type,
          ),
        ),
        back: ElementBack(
          descripcion: data.descripcion,
        ),
      ),
    );
  }
}
