import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hena_gym/business-logic/user_calories/cubit/user_calculating_calories_cubit.dart';
import 'package:hena_gym/constants/my_gui.dart';
import 'package:hena_gym/constants/strings.dart';
import 'package:hena_gym/data/models/user_calories.dart';
import 'package:hena_gym/frontend/widgets/loading_indicator.dart';
import 'package:hena_gym/frontend/widgets/setting_row.dart';
import 'package:hena_gym/utils/logger.dart';

// ignore: must_be_immutable
class NutritionSetting extends StatefulWidget {
  NutritionSetting({Key? key}) : super(key: key);

  @override
  State<NutritionSetting> createState() => _NutritionSettingState();
}

class _NutritionSettingState extends State<NutritionSetting> {
  String hasGoalText = "C";
  UserCalories? userCalories;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserCalculatingCaloriesCubit>(context).getUserCalories();
  }

  Widget _buildBlockWidget() {
    return BlocBuilder<UserCalculatingCaloriesCubit,
        UserCalculatingCaloriesState>(
      builder: (context, state) {
        if (state is HasCaloriesSet) {
          userCalories = (state).userCalories;
          ApplicationLogger.getLogger("<_buildBlockWidget>")
              .v(userCalories!.calories);
          hasGoalText = "Rec";
          return _buildBody();
        } else if (state is NoCaloriesSet) {
          userCalories = null;
          hasGoalText = "C";
          return _buildBody();
        } else {
          return const LoadingIndicator();
        }
      },
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
              Visibility(
                visible: hasGoalText != "C",
                child: SettingRow(
                  rowTitle: "My Calories Daily Goal",
                  iconPath: "assets/icons/myGoal.png",
                  screenName: goalScreen,
                  arguments: userCalories,
                ),
              ),
              SettingRow(
                rowTitle: "${hasGoalText}alculate Your Daily Calories",
                iconPath: "assets/icons/calories-calculator.png",
                screenName: calculateCaloriesScreen,
                arguments: context,
              ),
              Visibility(
                visible: false,
                child: SettingRow(
                  rowTitle: "Your Measurements",
                  iconPath: "assets/icons/measurement.png",
                  screenName: measurementsScreen,
                ),
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

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserCalculatingCaloriesCubit>(context).getUserCalories();
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
      body: _buildBlockWidget(),
    );
  }
}
