import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:periodic_table/src/theme/style.dart';

Future<String> getJson(String url) {
  return rootBundle.loadString(url);
}

Color fromName(String type) {
  switch (type) {
    case "Noble Gases":
      return nobleGases;
    case "Alkali Metals":
      return alkaliMetals;
    case "Alkali Earth Metals":
      return alkaliEarthMetals;
    case "Nonmetals":
      return noMetals;
    case "Halogens":
      return halogens;
    default:
      return hidrogen;
  }
}
