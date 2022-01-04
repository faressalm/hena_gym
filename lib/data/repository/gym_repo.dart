import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/gym.dart';
import '../services/gym_services.dart';

class GymServicesRepository {
  final GymServices gymServices;

  GymServicesRepository({required this.gymServices});
  Future<List<Gym>?> getAllGyms() async {
    List<dynamic> gymsQuery = await gymServices.getAllGyms();
    return gymsQuery.map(_mapToGym).toList();
  }

  Gym _mapToGym(data) {
    return Gym(
      contactNumber: data["contactNumber"],
      coverPhoto: data["coverPhoto"],
      contactEmail: data["contactEmail"],
      location: GeoPoint(data["location"].latitude, data["location"].longitude),
      gymId: data["gymId"],
      price: data["price"].replaceAll("\\n", "\n"),
      name: data["name"],
      rate: data["rate"],
      appointment: data['appointment'].replaceAll("\\n", "\n"),
      offers: data['offers'].replaceAll("\\n", "\n"),
    );
  }
}
