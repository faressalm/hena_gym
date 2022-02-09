import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../business-logic/user_calories/calories_calculation.dart';
import '../../../business-logic/user_calories/cubit/user_calculating_calories_cubit.dart';
import '../../../constants/my_gui.dart';
import '../../../constants/strings.dart';
import '../authenticate/validator.dart';
import '../../widgets/head_and_base_line.dart';
import '../../../utils/logger.dart';

class CalculateCaloriesScreen extends StatefulWidget {
  final BuildContext cubitContext;
  const CalculateCaloriesScreen({Key? key, required this.cubitContext})
      : super(key: key);

  @override
  State<CalculateCaloriesScreen> createState() =>
      _CalculateCaloriesScreenState();
}

class _CalculateCaloriesScreenState extends State<CalculateCaloriesScreen> {
  final _formKey = GlobalKey<FormState>();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final ageController = TextEditingController();
  late Map option;
  late Size size;
  final List<Map> options = [
    {"type": "Little to no exercise", "description": "", "factor": 1.2},
    {
      "type": "Light exercise",
      "description": "(1-3 days per week)",
      "factor": 1.375
    },
    {
      "type": "Moderate exercise",
      "description": "(3-5 days per week)",
      "factor": 1.55
    },
    {
      "type": "Heavy exercise",
      "description": "(6-7 days per week)",
      "factor": 1.725
    },
    {
      "type": "Very heavy exercise",
      "description": "(twice per day) ",
      "factor": 1.9
    },
  ];
  @override
  void initState() {
    super.initState();
    option = options[0];
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.white,
      appBar: AppBar(
        title: Text(
          "Calculate you daily Calories",
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: MyColors.darkBlue,
        shadowColor: MyColors.cyan,
        foregroundColor: MyColors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50))),
      ),
      body: Container(
        color: MyColors.white,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: kDefaultPadding, left: kDefaultPadding),
                  child: Text(
                    "Height & Weight",
                    style:
                        GoogleFonts.poppins(color: MyColors.grey, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.3,
                        child: Material(
                          color: Colors.transparent,
                          elevation: 18,
                          shadowColor: MyColors.lightGray,
                          child: TextFormField(
                            validator: (weight) =>
                                Validator.weightValidator(weight),
                            keyboardType: TextInputType.number,
                            controller: weightController,
                            decoration: textInputDecoration.copyWith(
                              labelText: 'Weight in Kg',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: size.width * 0.3,
                        child: Material(
                          color: Colors.transparent,
                          elevation: 18,
                          shadowColor: MyColors.lightGray,
                          child: TextFormField(
                            validator: (height) =>
                                Validator.heightValidator(height),
                            keyboardType: TextInputType.number,
                            controller: heightController,
                            decoration: textInputDecoration.copyWith(
                              labelText: 'Height in CM',
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: kDefaultPadding, left: kDefaultPadding),
                  child: Text(
                    "Age",
                    style:
                        GoogleFonts.poppins(color: MyColors.grey, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: SizedBox(
                    width: size.width * 0.3,
                    child: Material(
                      color: Colors.transparent,
                      elevation: 18,
                      shadowColor: MyColors.lightGray,
                      child: TextFormField(
                        validator: (age) => Validator.agetValidator(age),
                        keyboardType: TextInputType.number,
                        controller: ageController,
                        decoration: textInputDecoration.copyWith(
                          labelText: 'Age in Years',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: kDefaultPadding,
                      left: kDefaultPadding,
                      bottom: kDefaultPadding / 2),
                  child: Text(
                    "What is your level of activity ?",
                    style:
                        GoogleFonts.poppins(color: MyColors.grey, fontSize: 20),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Container(
                    decoration: boxShadow.copyWith(
                        borderRadius: BorderRadius.circular(20)),
                    child: SizedBox(
                      height: size.height * 0.3,
                      child: CupertinoPicker(
                          diameterRatio: 0.8,
                          itemExtent: 66,
                          onSelectedItemChanged: (index) =>
                              {option = options[index]},
                          children: options
                              .map((option) => HeadAndBaseLine(
                                  headline: option["type"],
                                  baseline: option["description"]))
                              .toList()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.pushNamed(context, goalTypeScreen, arguments: {
                "userInfo": {
                  "weight": double.parse(weightController.text),
                  "height": double.parse(heightController.text),
                  "age": double.parse(ageController.text),
                  "factor": option["factor"]
                },
                "cubitContext": widget.cubitContext
              });
            }
          },
          child: const Icon(
            Icons.navigate_next_outlined,
            size: 40,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
    );
  }
}
