import 'package:flutter/material.dart';
import 'package:periodic_table/src/models/data_layout.dart';
import 'package:periodic_table/src/models/row_data.dart';
import 'package:periodic_table/src/widgets/card_container.dart';
import 'package:periodic_table/src/widgets/card_element.dart';
import 'package:provider/provider.dart';

class TablaPeriodicaPage extends StatefulWidget {
  const TablaPeriodicaPage({Key? key}) : super(key: key);

  @override
  State<TablaPeriodicaPage> createState() => _TablaPeriodicaPageState();
}

class _TablaPeriodicaPageState extends State<TablaPeriodicaPage> {
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
    final description = Provider.of<DataLayout>(context).description;
    return Stack(
      alignment: Alignment.center,
      children: [
        CardContainer(
          child: Text(
            description,
          ),
        ),
        Container(
          child: elements.isNotEmpty
              ? Row(
                  children: [
                    ...buildData(
                      elements,
                    ),
                  ],
                )
              : const CircularProgressIndicator.adaptive(),
        ),
      ],
    );
  }
}
