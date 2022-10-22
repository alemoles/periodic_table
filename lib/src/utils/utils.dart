import 'package:flutter/services.dart' show rootBundle;

Future<String> getJson(String url) {
  return rootBundle.loadString(url);
}