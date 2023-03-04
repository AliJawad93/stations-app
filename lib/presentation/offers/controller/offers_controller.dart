import 'package:get/get.dart';
import 'package:station/data/data_source/api_data_source.dart';

import 'package:station/domain/entity/offers.dart';

class OffersController extends GetxController {
  List<OfferEntity> _offers = [];
  bool _isLoading = true;

  initOfferById(String id) async {
    _offers = await ApiDataSource.getOfferStationById(id);
    _isLoading = false;
    update();
  }

  List<OfferEntity> get getOffers => _offers;
  bool get isLoading => _isLoading;
}
