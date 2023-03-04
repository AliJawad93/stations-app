import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:station/presentation/all_stations/view/all_stations.dart';
import 'package:station/presentation/map/view/map.dart';

class MainPageController extends GetxController {
  int _currentIndex = 0;

  setCurrentIndex(int index) {
    _currentIndex = index;
    update();
  }

  Widget getPages() {
    return Stack(
        children: [MapPage(), AllStations()]
            .asMap()
            .map((index, screen) {
              return MapEntry(
                index,
                Offstage(
                  offstage: getCurrentIndex != index,
                  child: screen,
                ),
              );
            })
            .values
            .toList());
  }

  int get getCurrentIndex => _currentIndex;
}
