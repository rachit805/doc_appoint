import 'package:get/get.dart';

class AboutDoctorController extends GetxController {
  final RxInt selectedIndex = RxInt(-1);
  final RxString selectedDay = RxString('');
  final RxInt selectedDate = RxInt(DateTime.now().day);
  final RxString selectedMonth = RxString('');
  var fav = false.obs;

  @override
  void onInit() {
    super.onInit();
    updateSelected(0, getFullDayOfWeek(DateTime.now().weekday),
        selectedDate.value, getMonthOfYear(DateTime.now().month));
  }

  void updateSelected(int index, String day, int date, String month) {
    selectedIndex.value = index;
    selectedDay.value = day;
    selectedDate.value = date;
    selectedMonth.value = month;
  }

  String getDayOfWeek(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'Mon';
      case DateTime.tuesday:
        return 'Tue';
      case DateTime.wednesday:
        return 'Wed';
      case DateTime.thursday:
        return 'Thu';
      case DateTime.friday:
        return 'Fri';
      case DateTime.saturday:
        return 'Sat';
      case DateTime.sunday:
        return 'Sun';
      default:
        return '';
    }
  }

  String getMonthOfYear(int month) {
    switch (month) {
      case DateTime.january:
        return 'Jan';
      case DateTime.february:
        return 'Feb';
      case DateTime.march:
        return 'Mar';
      case DateTime.april:
        return 'Apr';
      case DateTime.may:
        return 'May';
      case DateTime.june:
        return 'Jun';
      case DateTime.july:
        return 'Jul';
      case DateTime.august:
        return 'Aug';
      case DateTime.september:
        return 'Sep';
      case DateTime.october:
        return 'Oct';
      case DateTime.november:
        return 'Nov';
      case DateTime.december:
        return 'Dec';
      default:
        return '';
    }
  }

  String getFullDayOfWeek(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'Monday';
      case DateTime.tuesday:
        return 'Tuesday';
      case DateTime.wednesday:
        return 'Wednesday';
      case DateTime.thursday:
        return 'Thursday';
      case DateTime.friday:
        return 'Friday';
      case DateTime.saturday:
        return 'Saturday';
      case DateTime.sunday:
        return 'Sunday';
      default:
        return '';
    }
  }
}
