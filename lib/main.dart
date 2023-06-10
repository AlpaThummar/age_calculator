import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'age_logic.dart';

void main() {
  runApp(MaterialApp(
    home: ChangeNotifierProvider(
      create: (context) => age_controller(), child: age(),),
  ));
}

class age extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    age_controller m = Provider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text("Age Calculator")),
      body: Column(children: [
        ElevatedButton(onPressed: () =>m.age_selcted(context),  child: Text("Select Date Birth Date")),
        Text("Birth Date:${m.selectedDate}"),
        Text("Today Date:${DateTime.now()}"),
        Text("Day: ${m.age_day}"),
        Text("Year:${m.year}"),
        Text("Month:${m.month}"),
        Text("Hours:${m.hr}"),
        Text("Min:${m.min}"),
        Text("Second: ${m.secon}"),

      ]),
    );
  }
}
