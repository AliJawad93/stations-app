import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:station/core/services/keys.dart';
import 'package:station/main.dart';
import 'package:station/presentation/auth/login/view/login.dart';
import 'package:station/presentation/map/controller/map_controller.dart';
import 'package:station/presentation/map/widgets/custom_card_station.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  bool show = false;

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.310826, 44.435028),
    zoom: 7.4746,
  );

  MapPageController controller = Get.put(MapPageController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
        actions: [
          IconButton(
              onPressed: () {
                prefs.setBool(KeysSharePref.isLogin, false);
                Get.offAll(() => Login());
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: GetBuilder<MapPageController>(builder: (controller) {
        return controller.getPosition == null
            ? Center(
                child: Text("LOADING"),
              )
            : Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(controller.getPosition!.latitude,
                          controller.getPosition!.longitude),
                      zoom: 7.4746,
                    ),
                    zoomControlsEnabled: false,
                    myLocationEnabled: true,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    markers: controller.getMarkers,
                    polylines: controller.getPolyline.toSet(),
                  ),
                  controller.isShowCard
                      ? Container(
                          margin: EdgeInsets.only(bottom: Get.height * 0.03),
                          child: CustomCardStation(
                            cardEntity: controller.getCardEntity!,
                          ))
                      : SizedBox(),
                ],
              );
      }),
    );
  }
}
