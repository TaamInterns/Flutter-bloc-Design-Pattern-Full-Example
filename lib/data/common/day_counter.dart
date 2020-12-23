/// this class use for convert days to time passed string such 2 روز پیش
class DayCounter {
  int day = 0;

  DayCounter({this.day});

  String calculate() {

    if(day == 0){
      return "امروز";
    } else if (day < 30) {
      return day.toString() + " روز پیش";
    } else if (day >= 30 && day < 365) {
      int months = (day / 30).toInt();
      int days = day % 30;

      if (days == 0) {
        return months.toString() + " ماه پیش";
      } else {
        return months.toString() + " ماه و " + days.toString() + " روز پیش";
      }
    } else if (day >= 365) {
      int years = (day / 365).toInt();
      int daysOfYear = day % 365;

      if (daysOfYear == 0) {
        return years.toString() + " سال پیش";
      } else if (daysOfYear < 30) {
        return years.toString() +
            " سال و " +
            daysOfYear.toString() +
            " روز پیش";
      } else if (daysOfYear >= 30 && daysOfYear < 365) {
        int months = (daysOfYear / 30).toInt();
        int days = daysOfYear % 30;

        if (days == 0) {
          return years.toString() + " سال و " + months.toString() + " ماه پیش";
        } else {
          return years.toString() +
              " سال و " +
              months.toString() +
              " ماه و " +
              days.toString() +
              " روز پیش";
        }
      }
    }
  }
}
