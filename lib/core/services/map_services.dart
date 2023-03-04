import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:station/core/utils/app_image_path.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MapServices {
  static double calculateDistance(
      double lat1, double lon1, double lat2, double lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  static Future<BitmapDescriptor> customMarker() async {
    return await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), AppImagePath.markerIcon);
  }

  static Future<Position?> getCurrentPostion() async {
    try {
      await _requestPermission();
      return await Geolocator.getLastKnownPosition().whenComplete(() {});
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<void> showPathOnGoogleMapApp(
    String srcLat,
    String srcLong,
    String disLat,
    String disLong,
  ) async {
    String cameraPositionLat = srcLat;
    String cameraPositionLong = srcLong;
    String url =
        "https://www.google.com/maps/dir/$srcLat,$srcLong/$disLat,$disLong/@$cameraPositionLat,$cameraPositionLong,12z";
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not open the map.';
    }
  }
//   // pravite functions

  static Future<Position> _requestPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
