import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../business-logic/gym/show_gym_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/my_gui.dart';
import '../../../data/models/gym.dart';
import '../../widgets/gym_item.dart';
import '../../widgets/loading_indicator.dart';

class ShowGym extends StatefulWidget {
  const ShowGym({Key? key}) : super(key: key);

  @override
  _ShowGymState createState() => _ShowGymState();
}

class _ShowGymState extends State<ShowGym> {
  late List<Gym> allGyms;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ShowGymCubit>(context).getAllGyms();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<ShowGymCubit, ShowGymState>(
      builder: (context, state) {
        if (state is GymsLoaded) {
          allGyms = (state).allGyms;
          return buildLoadedListWidgets();
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        height: allGyms.length / 2 * 350,
        color: MyColors.white,
        child: Column(
          children: [
            buildGymsList(),
          ],
        ),
      ),
    );
  }

  Widget buildGymsList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allGyms.length,
      itemBuilder: (ctx, index) {
        return GymItem(gym: allGyms[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildBlocWidget();
  }
}
