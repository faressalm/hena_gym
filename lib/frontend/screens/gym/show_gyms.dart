import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/strings.dart';
import '../../../data/services/auth_services.dart';
import '../../widgets/no_internet_widget.dart';
import '../../widgets/search_field.dart';
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

  late List<Gym> searchedForGyms;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  void addSearchedForItemsToSearchedList(String searchedGyms) {
    searchedForGyms = allGyms
        .where((gym) => gym.name.toLowerCase().contains(searchedGyms))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.clear, color: MyColors.darkBlue),
        ),
      ];
    } else {
      return [
        TextButton.icon(
          icon: const Icon(
            Icons.logout_rounded,
            color: MyColors.darkRed,
          ),
          label: const Text(
            '',
            style: TextStyle(
              color: MyColors.darkRed,
            ),
          ),
          onPressed: () async {
            AuthServices auth = AuthServices();
            await auth.signOut();
            Navigator.pushReplacementNamed(context, loginScreen);
          },
        ),
        IconButton(
          onPressed: _startSearch,
          icon: const Icon(
            Icons.search,
            color: MyColors.darkBlue,
          ),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }

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
        color: MyColors.white,
        child: Column(
          children: [
            buildGymsList(),
            const SizedBox(
              height: 65,
            )
          ],
        ),
      ),
    );
  }

  Widget buildGymsList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.5 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 3,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: _searchTextController.text.isEmpty
          ? allGyms.length
          : searchedForGyms.length,
      itemBuilder: (ctx, index) {
        return GymItem(
          gym: _searchTextController.text.isEmpty
              ? allGyms[index]
              : searchedForGyms[index],
        );
      },
    );
  }

  Widget _buildAppBarTitle() {
    return Text(
      'Gyms',
      style: GoogleFonts.poppins(
          textStyle: const TextStyle(
              color: MyColors.darkBlue, fontWeight: FontWeight.w600)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        leading: _isSearching
            ? const BackButton(
                color: MyColors.darkBlue,
              )
            : const SizedBox.shrink(),
        centerTitle: true,
        title: _isSearching
            ? SearchFiled(
                searchTextController: _searchTextController,
                searchFunction: addSearchedForItemsToSearchedList,
                hintText: 'Find a Gym...',
              )
            : _buildAppBarTitle(),
        actions: _buildAppBarActions(),
      ),
      body: buildBlocWidget(),
    );
  }
}
