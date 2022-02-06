import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:hena_gym/constants/strings.dart';
import 'package:hena_gym/data/services/auth_services.dart';
import 'package:hena_gym/frontend/widgets/loading_indicator.dart';
import 'package:hena_gym/frontend/widgets/no_internet_widget.dart';
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
                resizeToAvoidBottomInset: false,
                body: OfflineBuilder(
                  connectivityBuilder: (
                    BuildContext context,
                    ConnectivityResult connectivity,
                    Widget child,
                  ) {
                    final bool connected =
                        connectivity != ConnectivityResult.none;
                    return connected
                        ? cubit.screens[cubit.currentIndex]
                        : const NoInternetWidget();
                  },
                  child: const LoadingIndicator(),
                ),
                extendBody: true,
                bottomNavigationBar: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                  child: BottomNavigationBar(
                    fixedColor: MyColors.cyan,
                    unselectedItemColor: MyColors.white,
                    backgroundColor: MyColors.darkBlue,
                    currentIndex: cubit.currentIndex,
                    onTap: (index) {
                      cubit.changeBottomNav(index);
                    },
                    items: const [
                      BottomNavigationBarItem(
                          backgroundColor: MyColors.darkBlue,
                          icon: Icon(CustomIcon.dumbbell),
                          label: "Gym Home"),
                      BottomNavigationBarItem(
                          backgroundColor: MyColors.darkBlue,
                          icon: Icon(Icons.store),
                          label: "Market"),
                      BottomNavigationBarItem(
                          backgroundColor: MyColors.darkBlue,
                          icon: Icon(CustomIcon.salad),
                          label: "Nutrition Plan"),
                      BottomNavigationBarItem(
                          backgroundColor: MyColors.darkBlue,
                          icon: Icon(Icons.manage_accounts_rounded),
                          label: "Profile"),
                    ],
                  ),
                ),
              );
            },
            listener: (context, state) {}));
  }
}
