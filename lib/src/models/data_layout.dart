import 'package:flutter/material.dart';

import 'package:periodic_table/src/models/data_mapping.dart';
import 'package:periodic_table/src/models/row_data.dart';
import 'package:periodic_table/src/utils/utils.dart';

class DataLayout extends ChangeNotifier {
  var _elements = <RowData>[];

  List<RowData> get elements => _elements;

  void loadData() async {
    final data = await getJson('assets/source/source.json');
    final dataMapping = DataMapping.fromJson(data);
    _elements = dataMapping.data;
    notifyListeners();
  }
}
