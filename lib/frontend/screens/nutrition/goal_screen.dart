import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoalScreen extends StatelessWidget {
  const GoalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Text("Measurements"),
      ),
    );
  }
}
