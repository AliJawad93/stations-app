class StationEntity {
  int id;
  String name;
  String address;
  String lat;
  String long;
  String img;
  StationEntity({
    required this.id,
    required this.name,
    required this.address,
    required this.lat,
    required this.long,
    required this.img,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StationEntity &&
        other.id == id &&
        other.name == name &&
        other.address == address &&
        other.lat == lat &&
        other.long == long &&
        other.img == img;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        address.hashCode ^
        lat.hashCode ^
        long.hashCode ^
        img.hashCode;
  }
}
