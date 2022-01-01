import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hena_gym/utils/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class URLServices {
  Future<void> accessPhone(phoneNumber) async {
    final url = 'tel:$phoneNumber';
    await lancher(url, false);
  }

  Future<void> accessLink(link) async {
    await lancher(link, true);
  }

  Future<void> acessLocation(GeoPoint geoPoint) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=${geoPoint.latitude},${geoPoint.longitude}';
    await lancher(googleUrl, false);
  }

  Future<void> lancher(url, inApp) async {
    if (await canLaunch(url)) {
      await launch(url,
          forceWebView: inApp, forceSafariVC: inApp, enableJavaScript: inApp);
    } else {
      ApplicationLogger.getLogger("<lancher>").v("<Filed>");
    }
  }
}
