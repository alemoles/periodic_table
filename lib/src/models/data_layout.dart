import 'package:flutter/material.dart';

import 'package:periodic_table/src/models/data_mapping.dart';
import 'package:periodic_table/src/utils/utils.dart';

class DataLayout extends ChangeNotifier {
  final _elements = <int, List<RowData>>{};

  get elements => _elements;

  void loadData() async {
    final data = await getJson('assets/source/source.json');
    
  }
}
