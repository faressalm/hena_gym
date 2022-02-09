import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../business-logic/user_calories/calories_calculation.dart';
import '../../../constants/my_gui.dart';
import '../../../data/models/user_calories.dart';
import '../../../utils/shared_functionalities.dart';
import '../../widgets/advice.dart';
import '../../widgets/calories_pie_chart.dart';
import '../../widgets/head_and_base_line.dart';

// ignore: must_be_immutable
class GoalScreen extends StatelessWidget {
  final UserCalories? userCalories;
  final CaloriesCalcuation caloriesCalcuation = CaloriesCalcuation();

  GoalScreen({Key? key, required this.userCalories}) : super(key: key);
  final List<String> _advices = [
    "Tracky your food.",
    "Follow your daily calorie goal.",
    "Balance your intake of carbs, protien,fat and dietary fibers.",
    "Stay hydrated and track water intake daily.",
    "Log your progress by  logging your weight or body measurements."
  ];
  @override
  Widget build(BuildContext context) {
    Map goal =
        caloriesCalcuation.getProteinFatsCarbCalories(userCalories!.calories);
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.darkBlue,
        shadowColor: MyColors.cyan,
        foregroundColor: MyColors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50))),
      ),
      body: Container(
        color: MyColors.white,
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CaloriesPieChart(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding * 2),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HeadAndBaseLine(
                          headline: "Energy",
                          baseline: userCalories!.calories.toString() + "K"),
                      HeadAndBaseLine(
                          headline: "Protein",
                          baseline: goal["protein"].toString() + "g"),
                      HeadAndBaseLine(
                          headline: "Carbs",
                          baseline: goal["carb"].toString() + "g"),
                      HeadAndBaseLine(
                          headline: "Fats",
                          baseline: goal["fats"].toString() + "g"),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: kDefaultPadding, top: 5),
                child: Text(
                  "What you need to do",
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: MyColors.greyBlue),
                  ),
                ),
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _advices.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Advice(advice: _advices[index]);
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: IconButton(
        splashColor: MyColors.cyan,
        iconSize: 30,
        color: MyColors.darkBlue,
        icon: const Icon(Icons.home),
        onPressed: () {
          popAllUntilfirstScreen(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
