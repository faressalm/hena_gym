import '../models/gym.dart';
import '../services/gym_services.dart';

class GymServicesRepository {
  final GymSevices gymSevices;

  GymServicesRepository({required this.gymSevices});
  Future<List<Gym>?> getAllGyms() async {
    List<dynamic> gymsQuery = await gymSevices.getAllGyms();
    return gymsQuery.map(_mapToGym).toList();
  }

  Gym _mapToGym(data) {
    return Gym(
        contactNumber: data["contactNumber"],
        coverPhoto: data["coverPhoto"],
        contactEmail: data["contactEmail"],
        locationAddress: data["locationAddress"],
        gymId: data["gymId"],
        price: data["price"],
        name: data["name"],
        rate: data["rate"]);
  }
}
