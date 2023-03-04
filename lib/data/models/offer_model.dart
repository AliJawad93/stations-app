import 'package:station/domain/entity/offers.dart';

class OfferModel extends OfferEntity {
  OfferModel(
      {required super.idOffer, required super.nameOffer, required super.descr});
  factory OfferModel.fromMap(Map<String, dynamic> map) {
    return OfferModel(
      idOffer: map['id_offer'] ?? 0,
      nameOffer: map['name_offer'] ?? '',
      descr: map['descr'] ?? '',
    );
  }
}
