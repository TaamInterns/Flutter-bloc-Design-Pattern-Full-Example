import 'package:jalali_date/jalali_date.dart';
import 'package:shamsi_date/shamsi_date.dart';

class DateTimeConverter{

  static String getToJalTimeDate(String dateTime){
    PersianDate date = PersianDate.fromDateTime(DateTime.parse(dateTime));
    DateTime time = DateTime.parse(dateTime);

    String dateStr = date.year.toString()+"/"+date.month.toString()+"/"+date.day.toString();
    String timeStr = time.hour.toString()+":"+time.second.toString();

    return dateStr+" "+timeStr;
  }

  static String getGreDate(String date){

    if(date != "null" && date.isNotEmpty){

      List<String> sp = date.split("/");

      int year = int.parse(sp[0]);
      int month = int.parse(sp[1]);
      int day = int.parse(sp[2]);

      final Jalali j1 = Jalali(year,month,day);

      String yearStr = j1.toGregorian().year.toString();
      String monthStr = j1.toGregorian().month.toString();
      String dayStr = j1.toGregorian().day.toString();

      return yearStr+"-"+monthStr+"-"+dayStr;
    }

    return "";
  }

  static String getTime(String dateTime){
    DateTime time = DateTime.parse(dateTime);
    String timeStr = time.hour.toString()+":"+time.second.toString();

    return timeStr;
  }

  static String getToJalDate(String dateTime){
    PersianDate date = PersianDate.fromDateTime(DateTime.parse(dateTime));
    String dateStr = date.year.toString()+"/"+date.month.toString()+"/"+date.day.toString();

    return dateStr;
  }

  static String getToJalDateTime(String dateTime){
    PersianDate date = PersianDate.fromDateTime(DateTime.parse(dateTime));
    DateTime time = DateTime.parse(dateTime);
    String timeSty = time.hour.toString()+":"+time.minute.toString();
    String dateStr = date.year.toString()+"/"+date.month.toString()+"/"+date.day.toString();

    return dateStr+" | "+timeSty;
  }

  static String getToJalBetweenTimeDate(String firsTime, String secondTime){
    PersianDate date = PersianDate.fromDateTime(DateTime.parse(firsTime));
    DateTime time1 = DateTime.parse(firsTime);
    DateTime time2 = DateTime.parse(secondTime);

    String dateStr = date.year.toString()+"/"+date.month.toString()+"/"+date.day.toString();
    String time1Str = time1.hour.toString()+":"+time1.minute.toString();
    String time2Str = time2.hour.toString()+":"+time2.minute.toString();

    return dateStr+" "+time1Str +" الی "+ time2Str;
  }

}