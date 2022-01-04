import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hena_gym/utils/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class URLServices {
  Future<bool> accessPhone(phoneNumber) async {
    final url = 'tel:$phoneNumber';
    return await lancher(url, false);
  }

  Future<bool> accessLink(link) async {
    return await lancher(link, true);
  }

  Future<bool> acessLocation(GeoPoint geoPoint) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=${geoPoint.latitude},${geoPoint.longitude}';
    return await lancher(googleUrl, false);
  }

  Future<bool> lancher(url, inApp) async {
    if (await canLaunch(url)) {
      await launch(url,
          forceWebView: inApp, forceSafariVC: inApp, enableJavaScript: inApp);
      return true;
    } else {
      ApplicationLogger.getLogger("<lancher>").v("<Filed>");
      return false;
    }
  }
}
