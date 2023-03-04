import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:station/domain/entity/card_entity.dart';
import 'package:station/presentation/map/controller/map_controller.dart';

class SearchController extends GetxController {
  MapPageController controller = Get.find();
  List<CardEntity> _cardEntities = [];
  searchByName(String name) {
    if (name.isEmpty) {
      _cardEntities = [];
      update();
      return;
    }

    _cardEntities = controller.getCardEntities
        .where((element) => element.name.startsWith(name))
        .toList();
    update();
  }

  List<CardEntity> get getCardEntities => _cardEntities;
}
