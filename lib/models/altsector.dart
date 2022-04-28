import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Sectors1 {
  int result;
  String message;

  List<Sectors1> items = new List<Sectors1>();

  Sectors1(
    this.result,
    this.message,
  );

  factory Sectors1.fromJson(Map json) => sectorsFromJson(json);
}

@JsonSerializable()
class Sector2 {
  String oid;
  String SubSectorName;

  Sector2(
    this.oid,
    this.SubSectorName,
  );

  factory Sector2.fromJson(Map json) => sectorFromJson(json);
}

Sectors1 sectorsFromJson(Map json) {
  return Sectors1(
    json['Result'] as int,
    json['Message'] as String,
  )..items = (json['Items'] as List)
      ?.map((e) => e == null ? null : Sectors1.fromJson(e as Map))
      ?.toList();
}

Sector2 sectorFromJson(Map json) {
  return Sector2(
    json['Oid'] as String,
    json['SubSectorName'] as String,
  );
}
