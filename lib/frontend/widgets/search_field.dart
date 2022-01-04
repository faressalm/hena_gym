import 'package:flutter/material.dart';
import 'package:hena_gym/constants/my_gui.dart';

class SearchFiled extends StatelessWidget {
  final TextEditingController searchTextController;
  final Function searchFunction;
  final String hintText;

  const SearchFiled(
      {Key? key,
      required this.searchTextController,
      required this.searchFunction,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchTextController,
      cursorColor: MyColors.darkBlue,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        hintStyle: const TextStyle(color: MyColors.darkBlue, fontSize: 18),
      ),
      style: const TextStyle(color: MyColors.darkBlue, fontSize: 18),
      onChanged: (searchedGyms) {
        searchFunction(searchedGyms);
      },
    );
  }
}
