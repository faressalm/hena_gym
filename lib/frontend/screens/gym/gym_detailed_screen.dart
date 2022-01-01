import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hena_gym/constants/my_gui.dart';
import 'package:hena_gym/data/models/gym.dart';
import 'package:hena_gym/data/repository/url_repo.dart';
import 'package:hena_gym/frontend/widgets/custom_information_text.dart';
import 'package:hena_gym/frontend/widgets/custom_silver_app_bar.dart';

class GymDetailedScreen extends StatelessWidget {
  final Gym gym;
  final URLRepository urlRepository;
  const GymDetailedScreen(
      {Key? key, required this.gym, required this.urlRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkBlue,
      body: CustomScrollView(
        slivers: [
          CustomSilverAppBar(
            title: gym.name,
            id: gym.gymId,
            image: gym.coverPhoto,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () async {
                                await urlRepository
                                    .accessPhone(gym.contactNumber);
                              },
                              icon: const Icon(
                                Icons.call,
                                color: MyColors.red,
                                size: 30,
                              )),
                          IconButton(
                              onPressed: () async {
                                await urlRepository
                                    .accessLink(gym.contactEmail);
                              },
                              icon: const Icon(
                                Icons.facebook_rounded,
                                color: MyColors.white,
                                size: 30,
                              )),
                          IconButton(
                              onPressed: () async {
                                await urlRepository
                                    .accessLocation(gym.location);
                              },
                              icon: const Icon(
                                Icons.location_on,
                                color: MyColors.cyan,
                                size: 30,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomInformationText(title: "Prices", value: gym.price),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomInformationText(
                          title: "Appointments", value: gym.appointment),
                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                          visible: gym.offers.isNotEmpty,
                          child: CustomInformationText(
                              title: "Offers", value: gym.offers)),
                      const SizedBox(
                        height: 400,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
