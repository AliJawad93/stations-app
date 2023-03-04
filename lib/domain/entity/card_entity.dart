import 'package:station/domain/entity/station_entity.dart';

class CardEntity extends StationEntity {
  String srcLat;
  String srcLong;
  CardEntity(
      {required super.id,
      required super.name,
      required super.address,
      required super.lat,
      required super.long,
      required super.img,
      required this.srcLat,
      required this.srcLong});
}
