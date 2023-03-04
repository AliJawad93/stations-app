import 'dart:convert';

class OfferEntity {
  int idOffer;
  String nameOffer;
  String descr;
  OfferEntity({
    required this.idOffer,
    required this.nameOffer,
    required this.descr,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OfferEntity &&
        other.idOffer == idOffer &&
        other.nameOffer == nameOffer &&
        other.descr == descr;
  }

  @override
  int get hashCode => idOffer.hashCode ^ nameOffer.hashCode ^ descr.hashCode;
}
