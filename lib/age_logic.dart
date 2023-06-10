import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';


class age_controller extends ChangeNotifier {
  DateTime ? selectedDate ;//birthday

  DateTime today_date=DateTime.now();

  int age_day=0;
  int hr=0;
  int min=0;
  int secon=0;
  double year=0;
  double month=0;

  Future<void> age_selcted(BuildContext context) async {
    DateTime ?picked_date = await showDatePicker(context: context,
        initialDate: DateTime.now() ,
        firstDate: DateTime(1990),
        lastDate: DateTime(2030));
    if(picked_date!=null&&picked_date!=selectedDate){
      selectedDate=picked_date;
      print(selectedDate);
    }
    age_day=today_date.difference(selectedDate!).inDays;
    hr=today_date.difference(selectedDate!).inHours;
    min=today_date.difference(selectedDate!).inMinutes;
    secon=today_date.difference(selectedDate!).inSeconds;
    year=today_date.year-selectedDate!.year as double;
    month=(today_date.month - selectedDate!.month)+year*12;

    if(age_day!%30==0){
      month=(today_date.month - selectedDate!.month)+year*12;
    }else{
      //month=(age_day/365).toStringAsFixed(2) as double ;
      month=double.parse((age_day/30).toStringAsFixed(2));
    }


    if(month %12== 0){

      year=today_date.year-selectedDate!.year as double;
    }else{
      //year=(month/12).toStringAsFixed(2) as double;
      year= double.parse((month/12).toStringAsFixed(2));
    }


    print(year);
    notifyListeners();
  }


}
