import 'package:cloud_firestore/cloud_firestore.dart';

class Gym {
  final String gymId;
  final String coverPhoto;
  final String name;
  final String contactNumber;
  final String contactEmail;
  final GeoPoint location;
  final dynamic rate;
  final String price;
  final String appointment;
  final String offers;
  Gym({
    required this.coverPhoto,
    required this.gymId,
    required this.name,
    required this.contactNumber,
    required this.contactEmail,
    required this.location,
    required this.price,
    required this.rate,
    required this.appointment,
    required this.offers,
  });
}
