import 'package:flutter_test/flutter_test.dart';

import 'package:periodic_table/src/models/data_mapping.dart';
import 'package:periodic_table/src/utils/utils.dart';

void main() {
  group('Import Sources', () {
    testWidgets('Import Sources', (tester) async {
      final data = await getJson('assets/source/source.json');
      final elements = DataMapping.fromJson(data);
      expect(4, elements.data.length);      
    });
  });
}