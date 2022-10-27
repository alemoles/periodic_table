// To parse this JSON data, do
//
//     final dataMapping = dataMappingFromMap(jsonString);

import 'dart:convert';

import 'package:periodic_table/src/models/row_data.dart';

class DataMapping {
  DataMapping({
    required this.data,
  });

  final List<RowData> data;

  factory DataMapping.fromJson(String str) =>
      DataMapping.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataMapping.fromMap(Map<String, dynamic> json) => DataMapping(
        data: json["data"] == null
            ? []
            : List<RowData>.from(json["data"].map((x) => RowData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toMap())),
      };
}