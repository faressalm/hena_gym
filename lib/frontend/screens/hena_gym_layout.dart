import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business-logic/hena_gym_cubit.dart';
import '../../constants/icon.dart';
import '../../constants/my_gui.dart';
import 'package:google_fonts/google_fonts.dart';

class HenaGymLayout extends StatefulWidget {
  const HenaGymLayout({Key? key}) : super(key: key);

  @override
  _HenaGymLayoutState createState() => _HenaGymLayoutState();
}

class _HenaGymLayoutState extends State<HenaGymLayout> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => HenaGymCubit(),
        child: BlocConsumer<HenaGymCubit, HenaGymState>(
            builder: (context, state) {
              var cubit = HenaGymCubit.get(context);
              return Scaffold(
                appBar: AppBar(
                  toolbarHeight: 40,
                  flexibleSpace: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                  ),
                  elevation: 0.0,
                  backgroundColor: Colors.transparent,
                  centerTitle: true,
                  title: Text(
                    cubit.titles[cubit.currentIndex],
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: MyColors.darkBlue,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
                body: cubit.screens[cubit.currentIndex],
                extendBody: true,
                bottomNavigationBar: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                  child: SizedBox(
                    height: 50,
                    child: BottomNavigationBar(
                      fixedColor: MyColors.cyan,
                      iconSize: 20,
                      selectedFontSize: 12,
                      unselectedFontSize: 12,
                      unselectedItemColor: MyColors.white,
                      backgroundColor: MyColors.darkBlue,
                      currentIndex: cubit.currentIndex,
                      onTap: (index) {
                        cubit.changeBottomNav(index);
                      },
                      items: const [
                        BottomNavigationBarItem(
                            icon: Icon(CustomIcon.dumbbell), label: "Gym Home"),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.store), label: "Market"),
                        BottomNavigationBarItem(
                            icon: Icon(CustomIcon.salad),
                            label: "Nutrition Plan"),
                      ],
                    ),
                  ),
                ),
              );
            },
            listener: (context, state) {}));
  }
}
