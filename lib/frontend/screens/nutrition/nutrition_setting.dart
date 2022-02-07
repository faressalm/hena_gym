import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hena_gym/constants/my_gui.dart';
import 'package:hena_gym/constants/strings.dart';
import 'package:hena_gym/frontend/widgets/setting_row.dart';

// ignore: must_be_immutable
class NutritionSetting extends StatelessWidget {
  late BuildContext contextScreen;
  String hasGoalText = "C";
  NutritionSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    contextScreen = context;

    return Scaffold(
      backgroundColor: MyColors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 40,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
        ),
        elevation: 0.0,
        title: Text(
          "Health Home",
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: MyColors.darkBlue, fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: Image.asset("assets/images/health_home1.png"),
              ),
              const SettingRow(
                rowTitle: "My Calories Daily Goal",
                iconPath: "assets/icons/myGoal.png",
                screenName: calculateCaloriesScreen,
              ),
              SettingRow(
                rowTitle: "${hasGoalText}alculate Your Daily Calories",
                iconPath: "assets/icons/calories-calculator.png",
                screenName: calculateCaloriesScreen,
              ),
              const SettingRow(
                rowTitle: "Your Measurements",
                iconPath: "assets/icons/measurement.png",
                screenName: measurementsScreen,
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }

  void navigateToCalculateCaloriesScreen() {
    // Navigator.pushNamed(contextScreen, calculateCaloriesScreen);
  }

  void navigateToMeasurementsScreen() {
    // Navigator.pushNamed(contextScreen, measurementsScreen);
  }
}
