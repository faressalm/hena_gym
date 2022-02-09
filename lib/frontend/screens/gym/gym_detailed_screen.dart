import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hena_gym/constants/my_gui.dart';
import 'package:hena_gym/constants/strings.dart';
import 'package:hena_gym/data/models/gym.dart';
import 'package:hena_gym/data/repository/url_repo.dart';
import 'package:hena_gym/frontend/screens/authenticate/validator.dart';
import 'package:hena_gym/frontend/widgets/custom_information_text.dart';
import 'package:hena_gym/utils/components.dart';
import 'package:hena_gym/frontend/widgets/icon_button_card.dart';

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
        ? showToast(text: "Opens The $title", state: ToastStates.SUCCESS)
        : showToast(
            text: "Couldn't Access This $title", state: ToastStates.ERROR);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: MyColors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SizedBox(
                  height: size.height * 0.8,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding * 3),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                  iconSize: 30,
                                  color: MyColors.lightGray,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: kDefaultPadding),
                                  icon: const Icon(Icons.arrow_back),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                IconButtonCard(
                                  size: size,
                                  child: IconButton(
                                      onPressed: () async {
                                        await builURLActions(phoneNumberURL);
                                      },
                                      icon: const Icon(
                                        Icons.call,
                                        color: MyColors.red,
                                        size: 30,
                                      )),
                                ),
                                IconButtonCard(
                                  size: size,
                                  child: IconButton(
                                      onPressed: () async {
                                        await builURLActions(linkURL);
                                      },
                                      icon: const Icon(
                                        Icons.facebook_rounded,
                                        color: MyColors.darkBlue,
                                        size: 35,
                                      )),
                                ),
                                IconButtonCard(
                                  size: size,
                                  child: IconButton(
                                      onPressed: () async {
                                        await builURLActions(locationURL);
                                      },
                                      icon: const Icon(
                                        Icons.location_on,
                                        color: MyColors.cyan,
                                        size: 30,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Hero(
                        tag: gym.gymId,
                        child: Container(
                          height: size.height * 0.8,
                          width: size.width * 0.75,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 10),
                                blurRadius: 30,
                                color: MyColors.cyan.withOpacity(0.29),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(63),
                              bottomLeft: Radius.circular(63),
                            ),
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
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        gym.name,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: MyColors.darkBlue,
                            fontWeight: FontWeight.bold),
                        maxLines: 5,
                      ),
                    ),
                    Text(
                      "★${gym.rate}",
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: MyColors.darkRed),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    CustomInformationText(
                        title: "Prices", value: gym.price, size: size),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomInformationText(
                        title: "Appointments",
                        value: gym.appointment,
                        size: size),
                    const SizedBox(
                      height: 10,
                    ),
                    Visibility(
                        visible: gym.offers.isNotEmpty,
                        child: CustomInformationText(
                            title: "Offers", value: gym.offers, size: size)),
                    const SizedBox(
                      height: 200,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
