import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:station/core/services/map_services.dart';
import 'package:station/core/utils/app_image_path.dart';
import 'package:station/data/data_source/api_data_source.dart';

import 'package:station/domain/entity/card_entity.dart';
import 'package:station/domain/entity/station_entity.dart';

class MapPageController extends GetxController {
  Set<Marker> _markers = {};
  List<StationEntity> _stationsInfos = [];
  List<CardEntity> _cardEntities = [];
  CardEntity? _cardEntity;
  bool _isLoading = true;
  bool _showCard = false;
  BitmapDescriptor _markerIcon = BitmapDescriptor.defaultMarker;
  Position? _position;

  List<Polyline> _polyline = [];

  @override
  void onInit() {
    _isLoading = true;
    _initStationsInfo().then((value) async {
      _position = await MapServices.getCurrentPostion();
      _initMarkers();
      _initCardStations();
    });

    super.onInit();
  }

  Future<void> _initStationsInfo() async {
    _stationsInfos = await ApiDataSource.getStationsInfo();
  }

  _initMarkers() async {
    _markerIcon = await MapServices.customMarker();
    _markers = _stationsInfos.map((stationInfo) {
      return Marker(
          markerId: MarkerId("${stationInfo.id}"),
          position: LatLng(
              double.parse(stationInfo.lat), double.parse(stationInfo.long)),
          icon: _markerIcon,
          onTap: () {
            _onMarkerTapped(stationInfo.id);
          });
    }).toSet();
    _isLoading = false;
    update();
  }

  _onMarkerTapped(int id) {
    _showCard = false;
    StationEntity stationInfo =
        _stationsInfos.where((element) => element.id == id).first;
    createPolyline(
      double.parse(stationInfo.lat),
      double.parse(stationInfo.long),
    );
    _cardEntity = CardEntity(
      id: stationInfo.id,
      name: stationInfo.name,
      img: stationInfo.img,
      lat: stationInfo.lat,
      long: stationInfo.long,
      srcLat: _position!.latitude.toString(),
      srcLong: _position!.longitude.toString(),
      address: stationInfo.address,
    );
    _showCard = true;
    update();
  }

  _initCardStations() {
    _cardEntities = _stationsInfos.map((stationInfo) {
      return CardEntity(
        id: stationInfo.id,
        name: stationInfo.name,
        img: stationInfo.img,
        lat: stationInfo.lat,
        long: stationInfo.long,
        srcLat: _position!.latitude.toString(),
        srcLong: _position!.longitude.toString(),
        address: stationInfo.address,
      );
    }).toList();

    update();
  }

  createPolyline(double latitude, double longitude) {
    _polyline = [];
    _polyline.add(
      Polyline(
          polylineId: PolylineId("1"),
          color: Colors.red,
          width: 2,
          points: [
            LatLng(_position!.latitude, _position!.longitude),
            LatLng(latitude, longitude)
          ]),
    );

    update();
  }

  Set<Marker> get getMarkers => _markers;
  List<StationEntity> get getStationsInfo => _stationsInfos;
  CardEntity? get getCardEntity => _cardEntity;
  List<CardEntity> get getCardEntities => _cardEntities;
  bool get isLoading => _isLoading;
  bool get isShowCard => _showCard;
  Position? get getPosition => _position;
  List<Polyline> get getPolyline => _polyline;
}
