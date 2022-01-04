import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hena_gym/data/services/url_services.dart';

class URLRepository {
  final URLServices urlServices;

  URLRepository({required this.urlServices});
  Future<void> accessPhone(phoneNumber) async {
    await urlServices.accessPhone(phoneNumber);
  }

  Future<void> accessLink(link) async {
    await urlServices.accessLink(link);
  }

  Future<void> accessLocation(geoPoint) async {
    await urlServices.acessLocation(geoPoint);
  }
}
