// import 'package:json_annotation/json_annotation.dart';

// @JsonSerializable()
// class Towns {
//   int result;
//   String message;

//   List<TownItems> items = new List<TownItems>();

//   Towns(
//     this.result,
//     this.message,
//   );

//   factory Towns.fromJson(Map json) => townsFromJson(json);
// }

// @JsonSerializable()
// class TownItems {
//   String oid;
//   String countyName;
//   int globalDbId;

//   CityOid cityOid;

//   TownItems(
//     this.oid,
//     this.countyName,
//     this.globalDbId,
//   );

//   factory TownItems.fromJson(Map json) => itemsFromJson(json);
// }

// class CityOid {
//   String oid;

//   CityOid(this.oid);

//   factory CityOid.fromJson(Map json) => cityOidFromJson(json);
// }

// Towns townsFromJson(Map json) {
//   return Towns(
//     json['Result'] as int,
//     json['Message'] as String,
//   )..items = (json['Items'] as List)
//       ?.map((e) => e == null ? null : TownItems.fromJson(e as Map))
//       ?.toList();
// }

// TownItems itemsFromJson(Map json) {
//   return TownItems(
//     json['Oid'] as String,
//     json['CountyName'] as String,
//     json['GlobalDBId'] as int,
//   )..cityOid = cityOidFromJson(json["CityOid"] ?? new Map<String, dynamic>());
// }

// CityOid cityOidFromJson(Map json) {
//   return CityOid(
//     (json['Oid'] ?? "") as String,
//   );
// }
