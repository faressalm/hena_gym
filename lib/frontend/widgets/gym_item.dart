import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/strings.dart';
import '../../constants/my_gui.dart';
import '../../data/models/gym.dart';

class GymItem extends StatelessWidget {
  final Gym gym;
  const GymItem({Key? key, required this.gym}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.greyBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () =>
            Navigator.pushNamed(context, gymDetailedScreen, arguments: gym),
        child: GridTile(
          child: Hero(
            tag: gym.gymId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: MyColors.white,
                child: gym.coverPhoto.isNotEmpty
                    ? FadeInImage.assetNetwork(
                        width: double.infinity,
                        height: double.infinity,
                        placeholder: 'assets/images/loading.gif',
                        image: gym.coverPhoto,
                        fit: BoxFit.cover,
                      )
                    : Image.asset('assets/images/placeholder.png'),
              ),
            ),
          ),
          footer: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: MyColors.lightWhite,
              alignment: Alignment.bottomCenter,
              child: Text(
                gym.name,
                style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                    height: 0.8,
                    fontSize: 16,
                    color: MyColors.darkBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
