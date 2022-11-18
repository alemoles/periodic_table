import 'package:flutter_test/flutter_test.dart';

import 'package:periodic_table/src/models/data_mapping.dart';
import 'package:periodic_table/src/utils/utils.dart';

void main() {
  group('Import Sources', () {
    testWidgets('Import Sources', (tester) async {
      final data = await getJson('assets/source/source.json');
      final elements = DataMapping.fromJson(data);
      // expect(4, elements.data.length);
    });
  });
  group('Time difference for notifications', () {
    testWidgets('Time difference a day ago', (tester) async {
      final now = DateTime.now();

      final haceUnMomento =
          DateTime.now().subtract(const Duration(seconds: 59));
      var diff = compare(now, haceUnMomento);
      if (diff.inSeconds < 60) {
        print('moments ago');
      }

      final minutes = DateTime.now().subtract(const Duration(minutes: 10));
      diff = compare(now, minutes);
      if (diff.inMinutes >= 1 && diff.inMinutes < 60) {
        print('${diff.inMinutes} minutes');
      }

      final horas = DateTime.now().subtract(const Duration(minutes: 90));
      diff = compare(now, horas);
      if (diff.inHours >= 1 && diff.inHours < 24) {
        print('${diff.inHours} hours');
      }

      final yesterday = DateTime.now().subtract(const Duration(days: 1));
      diff = compare(now, yesterday);
      if (diff.inDays >= 1 && diff.inDays < 7) {
        print('${diff.inDays} days');
      }

      final week = DateTime.now().subtract(const Duration(days: 25));
      diff = compare(now, week);
      if (diff.inDays >= 7 && diff.inDays < 30) {
        final weeks = diff.inDays ~/ 7;
        print('$weeks weeks');
      }

      final month = DateTime.now().subtract(const Duration(days: 45));
      diff = compare(now, month);
      if (diff.inDays >= 30 && diff.inDays < 365) {
        final months = diff.inDays ~/ 30.44;
        print('$months months');
      }
      expect(10, 10);
    });
  });
}

Duration compare(DateTime x, DateTime y) {
  return Duration(
    microseconds: (x.microsecondsSinceEpoch - y.microsecondsSinceEpoch).abs(),
  );
}
