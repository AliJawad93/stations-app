import 'package:station/core/utils/app_api.dart';
import 'package:station/domain/entity/station_entity.dart';

class StationModel extends StationEntity {
  StationModel(
      {required super.id,
      required super.name,
      required super.address,
      required super.lat,
      required super.long,
      required super.img});
  factory StationModel.fromMap(Map<String, dynamic> map) {
    return StationModel(
      id: map['id_sta']?.toInt() ?? 0,
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      lat: map['lat'] ?? '',
      long: map['lang'] ?? '',
      img: AppApi.imageUrl + map['img'],
    );
  }
}
