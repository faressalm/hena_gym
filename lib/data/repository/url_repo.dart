import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hena_gym/data/services/url_services.dart';

class URLRepository {
  final URLServices urlServices;

  URLRepository({required this.urlServices});
  Future<bool> accessPhone(phoneNumber) async {
    return await urlServices.accessPhone(phoneNumber);
  }

  Future<bool> accessLink(link) async {
    return await urlServices.accessLink(link);
  }

  Future<bool> accessLocation(geoPoint) async {
    return await urlServices.acessLocation(geoPoint);
  }
}
