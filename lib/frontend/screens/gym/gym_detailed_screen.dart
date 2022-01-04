import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hena_gym/constants/my_gui.dart';
import 'package:hena_gym/constants/strings.dart';
import 'package:hena_gym/data/models/gym.dart';
import 'package:hena_gym/data/repository/url_repo.dart';
import 'package:hena_gym/frontend/screens/authenticate/validator.dart';
import 'package:hena_gym/frontend/widgets/custom_information_text.dart';
import 'package:hena_gym/frontend/widgets/custom_silver_app_bar.dart';
import 'package:hena_gym/utils/components.dart';

class GymDetailedScreen extends StatelessWidget {
  final Gym gym;
  final URLRepository urlRepository;
  const GymDetailedScreen(
      {Key? key, required this.gym, required this.urlRepository})
      : super(key: key);

  Future<void> builURLActions(title) async {
    bool isSuccess;
    switch (title) {
      case linkURL:
        isSuccess = await urlRepository.accessLink(gym.contactEmail);
        break;
      case phoneNumberURL:
        isSuccess = Validator.isValidPhoneNumber(gym.contactNumber)
            ? await urlRepository.accessPhone(gym.contactNumber)
            : false;
        break;
      case locationURL:
        isSuccess = await urlRepository.accessLocation(gym.location);
        break;
      default:
        isSuccess = false;
    }

    isSuccess
        ? showToast(text: "Opens the $title", state: ToastStates.SUCCESS)
        : showToast(
            text: "Couldn't access this $title", state: ToastStates.ERROR);
  }

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
                                await builURLActions(phoneNumberURL);
                              },
                              icon: const Icon(
                                Icons.call,
                                color: MyColors.red,
                                size: 30,
                              )),
                          IconButton(
                              onPressed: () async {
                                await builURLActions(linkURL);
                              },
                              icon: const Icon(
                                Icons.facebook_rounded,
                                color: MyColors.white,
                                size: 30,
                              )),
                          IconButton(
                              onPressed: () async {
                                await builURLActions(locationURL);
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
