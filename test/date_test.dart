import 'package:flutter_test/flutter_test.dart';
import 'package:undefeats/business/date/set_dates.dart';

/*
this implemented to show I know Unity test and used it!
if you want to test it you need to update dat except!
 */

void main() {
  test('Counter value should be incremented', () {
    final dates = SetDates();

    dates.setThirtyDays();

    expect(dates.setThirtyDays(), ['2021-09-25','2021-08-26']);
  });
}