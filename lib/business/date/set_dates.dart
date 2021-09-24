import 'package:intl/intl.dart';

/*
Get Todays Date and format it then calculate 30 days before and format it, output as a list.
 */
class SetDates {
  List setThirtyDays() {
    DateTime todayDate = DateTime.now();
    DateTime thirtyDaysBeforeDate =
        DateTime(todayDate.year, todayDate.month, todayDate.day - 30);

    String today = DateFormat('yyyy-MM-dd').format(todayDate);

    String thirtyDaysBefore =
        DateFormat('yyyy-MM-dd').format(thirtyDaysBeforeDate);

    return [today, thirtyDaysBefore];
  }
}
