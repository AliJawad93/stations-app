import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:station/core/services/map_services.dart';
import 'package:station/core/utils/app_colors.dart';
import 'package:station/domain/entity/card_entity.dart';
import 'package:station/domain/entity/station_entity.dart';
import 'package:station/presentation/loading/loading.dart';
import 'package:station/presentation/offers/controller/offers_controller.dart';
import 'package:station/presentation/widgets/custom_container.dart';

class OffersStation extends StatelessWidget {
  OffersStation({super.key, required this.cardEntity});
  OffersController controller = Get.put(OffersController());
  CardEntity cardEntity;
  @override
  Widget build(BuildContext context) {
    double distance = MapServices.calculateDistance(
      double.parse(cardEntity.lat),
      double.parse(cardEntity.long),
      double.parse(cardEntity.srcLat),
      double.parse(cardEntity.srcLong),
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text(cardEntity.name),
        ),
        body: GetBuilder<OffersController>(
            init: OffersController(),
            builder: (controller) {
              controller.initOfferById(cardEntity.id.toString());

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: Get.height * 0.4,
                          width: Get.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: NetworkImage(
                                  cardEntity.img,
                                ),
                                fit: BoxFit.cover,
                              ))),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Address ${cardEntity.address}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Distance ${distance.toStringAsFixed(2)}KM",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Offers",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 5,
                      ),
                      ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.getOffers.length,
                          itemBuilder: (con, index) {
                            return CustomContainer(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                borderRadius: 30,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: Get.height * 0.3,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            topRight: Radius.circular(30)),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            cardEntity.img,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child: RichText(
                                        text: TextSpan(
                                          text:
                                              "${controller.getOffers[index].nameOffer}\n",
                                          style: TextStyle(
                                              color: AppColors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: controller
                                                    .getOffers[index].descr,
                                                style: TextStyle(
                                                  color: AppColors.gray,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ));
                          })
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
