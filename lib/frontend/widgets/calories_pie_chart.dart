import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/my_gui.dart';

// ignore: must_be_immutable
class CaloriesPieChart extends StatelessWidget {
  CaloriesPieChart({Key? key}) : super(key: key);
  late List<charts.Series<Task, String>> _seriesPieData;

  var piedata = [
    Task('Carb', 50, Colors.amber.shade100),
    Task('Fats', 30, MyColors.red),
    Task('Protein', 20, MyColors.kPrimaryColor)
  ];

  @override
  Widget build(BuildContext context) {
    _seriesPieData = [];
    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Calories',
        data: piedata,
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          const Text(
            'Daily nutritional Goal',
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: MyColors.grey),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Stack(children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.47,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-33 / 360),
                child: charts.PieChart(
                  _seriesPieData,
                  animate: true,
                  animationDuration: const Duration(seconds: 2),
                ),
              ),
            ),
            Positioned(
              left: 15,
              bottom: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailsRow(piedata: piedata[0]),
                  const SizedBox(height: 4),
                  DetailsRow(piedata: piedata[1]),
                  const SizedBox(height: 4),
                  DetailsRow(piedata: piedata[2])
                ],
              ),
            )
          ]),
        ],
      ),
    );
  }
}

class DetailsRow extends StatelessWidget {
  const DetailsRow({
    Key? key,
    required this.piedata,
  }) : super(key: key);

  final Task piedata;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: piedata.colorval,
        ),
        const SizedBox(width: 10),
        Text(
          piedata.task,
          style: const TextStyle(
              color: MyColors.darkBlue, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}
