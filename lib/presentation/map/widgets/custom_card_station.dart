import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:station/core/services/map_services.dart';

import 'package:station/core/utils/app_colors.dart';
import 'package:station/domain/entity/card_entity.dart';
import 'package:station/presentation/map/controller/map_controller.dart';
import 'package:station/presentation/offers/view/offers.dart';

class CustomCardStation extends StatelessWidget {
  CardEntity cardEntity;
  CustomCardStation({
    Key? key,
    required this.cardEntity,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double distance = MapServices.calculateDistance(
      double.parse(cardEntity.lat),
      double.parse(cardEntity.long),
      double.parse(cardEntity.srcLat),
      double.parse(cardEntity.srcLong),
    );
    return Container(
      height: Get.height * 0.13,
      width: Get.width * 0.8,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [BoxShadow(color: AppColors.shadow, blurRadius: 10)]),
      child: Row(children: [
        CachedNetworkImage(
          imageUrl: cardEntity.img,
          imageBuilder: (context, imageProvider) {
            return Container(
              width: Get.width * 0.2,
              decoration: BoxDecoration(
                color: AppColors.shadow,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
            );
          },
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              Container(
            width: Get.width * 0.2,
            child: Center(
                child: CircularProgressIndicator(
                    value: downloadProgress.progress)),
          ),
          errorWidget: (context, url, error) => Container(
            width: Get.width * 0.2,
            child: Center(child: Icon(Icons.error)),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name: ${cardEntity.name} ",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "Distance: ${distance.toStringAsFixed(2)} KM",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            MapServices.showPathOnGoogleMapApp(cardEntity.srcLat,
                cardEntity.srcLong, cardEntity.lat, cardEntity.long);
          },
          child: SizedBox(
            height: Get.height,
            width: Get.width * 0.1,
            child: Icon(
              Icons.directions,
              color: AppColors.primary,
              size: 25,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Get.to(() => OffersStation(cardEntity: cardEntity));
          },
          child: SizedBox(
            height: Get.height,
            width: Get.width * 0.1,
            child: Icon(
              Icons.arrow_forward_ios,
              color: AppColors.shadow,
              size: 25,
            ),
          ),
        ),
      ]),
    );
  }
}
