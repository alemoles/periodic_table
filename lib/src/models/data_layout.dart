import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:periodic_table/src/models/data_mapping.dart';
import 'package:periodic_table/src/models/row_data.dart';
import 'package:periodic_table/src/utils/utils.dart';

class DataLayout extends ChangeNotifier {
  final _elements = SplayTreeMap<int, List<RowData>>();
  var _description = '';

  SplayTreeMap<int, List<RowData>> get elements => _elements;

  void loadData() async {
    final data = await getJson('assets/source/source.json');
    final dataMapping = DataMapping.fromJson(data);

    _elements.clear();
    for (var element in dataMapping.data) {
      if (_elements.containsKey(element.column)) {
        _elements.update(element.column, (list) {
          list.add(element);
          return list;
        });
      } else {
        _elements.putIfAbsent(element.column, () => [element]);
      }
    }
    notifyListeners();
  }

  String get description => _description;

  set description(String value) {
    _description = value;
    notifyListeners();
  }
}
