import 'dart:convert';

class RowData {
  RowData({
    required this.atomicNumber,
    required this.atomicSymbol,
    required this.name,
    required this.widget,
    required this.imageUrl,
    required this.symbolsUrl,
    required this.descripcion,
    required this.isRange,
    required this.isRadioactive,
    required this.type,
    required this.column,
  });

  final int atomicNumber;
  final String atomicSymbol;
  final String name;
  final String widget;
  final String imageUrl;
  final List<String> symbolsUrl;
  final String descripcion;
  final bool isRange;
  final bool isRadioactive;
  final String type;
  final int column;

  factory RowData.fromJson(String str) => RowData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RowData.fromMap(Map<String, dynamic> json) => RowData(
        atomicNumber: json["atomicNumber"],
        atomicSymbol: json["atomicSymbol"],
        name: json["name"],
        widget: json["widget"],
        imageUrl: json["imageURL"],
        symbolsUrl: json["symbolsURL"] == null
            ? []
            : List<String>.from(json["symbolsURL"].map((x) => x)),
        descripcion: json["descripcion"],
        isRange: json["isRange"],
        isRadioactive: json["isRadioactive"],
        type: json["type"],
        column: json["column"],
      );

  Map<String, dynamic> toMap() => {
        "atomicNumber": atomicNumber,
        "atomicSymbol": atomicSymbol,
        "name": name,
        "widget": widget,
        "imageURL": imageUrl,
        "symbolsURL": symbolsUrl == null
            ? null
            : List<dynamic>.from(symbolsUrl.map((x) => x)),
        "descripcion": descripcion,
        "isRange": isRange,
        "isRadioactive": isRadioactive,
        "type": type,
        "column": column,
      };
}
