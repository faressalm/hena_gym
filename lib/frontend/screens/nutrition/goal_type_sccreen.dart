import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hena_gym/business-logic/user_calories/cubit/user_calculating_calories_cubit.dart';
import 'package:hena_gym/constants/my_gui.dart';
import 'package:hena_gym/constants/strings.dart';
import 'package:hena_gym/data/models/user_calories.dart';
import 'package:hena_gym/frontend/screens/nutrition/calculate_calories.dart';
import 'package:hena_gym/frontend/widgets/image_with_subtitle.dart';
import 'package:hena_gym/frontend/widgets/loading_indicator.dart';

// ignore: must_be_immutable
class GoalTypeScreen extends StatelessWidget {
  final Map userInfo;
  final BuildContext cubitContext;
  GoalTypeScreen({Key? key, required this.userInfo, required this.cubitContext})
      : super(key: key);
  late Size size;
  Widget _goalType(context, goalType, imagePath) {
    return BlocProvider(
      create: (_) => UserCalculatingCaloriesCubit.get(cubitContext),
      child: BlocConsumer<UserCalculatingCaloriesCubit,
          UserCalculatingCaloriesState>(builder: (context, state) {
        var cubit = UserCalculatingCaloriesCubit.get(cubitContext);
        return InkWell(
          onTap: () async {
            cubit.updateUserCalories(userInfo, goalType);
            await showDialog(
              context: context,
              builder: (BuildContext context) {
                return const LoadingIndicator();
              },
            );
          },
          child: ImageWithSuptitle(
            size: size,
            imagepath: imagePath,
            subtitle: goalType,
          ),
        );
      }, listener: (context, state) {
        if (state is CaloriesSetSucessfuly) {
          Navigator.pushReplacementNamed(context, goalScreen,
              arguments: state.userCalories);
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Your Goal",
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: MyColors.darkBlue,
        shadowColor: MyColors.cyan,
        foregroundColor: MyColors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50))),
      ),
      backgroundColor: MyColors.white,
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Container(
            width: size.width - kDefaultPadding * 2,
            height: size.height - kDefaultPadding * 2,
            decoration: boxShadow.copyWith(
                color: MyColors.greyBlue,
                borderRadius: BorderRadius.circular(20)),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _goalType(
                      context, lossWeight, "assets/images/lose_weight3(1).jpg"),
                  _goalType(context, maintainWeight,
                      "assets/images/maintain_weight.jpg"),
                  _goalType(
                      context, gainWeight, "assets/images/gainWeight.jpg"),
                ],
              ),
            )),
      ),
    );
  }
}
