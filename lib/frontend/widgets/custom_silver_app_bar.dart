import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/my_gui.dart';

class CustomSilverAppBar extends StatelessWidget {
  final String title;
  final String id;
  final String image;
  const CustomSilverAppBar(
      {Key? key, required this.title, required this.id, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.7,
      pinned: false,
      stretch: false,
      automaticallyImplyLeading: true,
      backgroundColor: MyColors.darkBlue,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(color: MyColors.white),
        ),
        background: Hero(
          tag: id,
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
