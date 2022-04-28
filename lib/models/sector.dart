import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Sectors {
  int result;
  String message;

  List<Sector> items = new List<Sector>();

  Sectors(
    this.result,
    this.message,
  );

  factory Sectors.fromJson(Map json) => sectorsFromJson(json);
}

@JsonSerializable()
class Sector {
  String oid;
  String sectorName;

  Sector(
    this.oid,
    this.sectorName,
  );

  factory Sector.fromJson(Map json) => sectorFromJson(json);
}

Sectors sectorsFromJson(Map json) {
  return Sectors(
    json['Result'] as int,
    json['Message'] as String,
  )..items = (json['Items'] as List)
      ?.map((e) => e == null ? null : Sector.fromJson(e as Map))
      ?.toList();
}

Sector sectorFromJson(Map json) {
  return Sector(
    json['Oid'] as String,
    json['sectorName'] as String,
  );
}
