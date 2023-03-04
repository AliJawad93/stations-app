import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:station/presentation/search/controller/search_controller.dart';
import 'package:station/presentation/map/controller/map_controller.dart';
import 'package:station/presentation/map/widgets/custom_card_station.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  SearchController controller = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Container(
              width: Get.width * 0.9,
              padding: EdgeInsets.all(5),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                onChanged: (name) {
                  controller.searchByName(name);
                },
                decoration: InputDecoration(
                  hintText: "Search station",
                  contentPadding: EdgeInsets.all(10),
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Color(0xfff5fbf2),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.5),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.5),
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: GetBuilder<SearchController>(builder: (controller) {
          return ListView.builder(
            itemCount: controller.getCardEntities.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(5),
                child: CustomCardStation(
                  cardEntity: controller.getCardEntities[index],
                ),
              );
            },
          );
        }));
  }
}
