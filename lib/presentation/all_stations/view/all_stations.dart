import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:station/core/utils/app_colors.dart';
import 'package:station/presentation/search/view/search.dart';
import 'package:station/presentation/map/controller/map_controller.dart';
import 'package:station/presentation/map/widgets/custom_card_station.dart';

class AllStations extends StatelessWidget {
  AllStations({super.key});
  MapPageController controller = Get.put(MapPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("The Stations"),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => SearchPage());
                },
                icon: Icon(Icons.search))
          ],
        ),
        backgroundColor: AppColors.white,
        body: ListView(
          children: controller.getCardEntities
              .map(
                (e) => Padding(
                  padding: EdgeInsets.all(5),
                  child: CustomCardStation(
                    cardEntity: e,
                  ),
                ),
              )
              .toList(),
        ));
  }
}
