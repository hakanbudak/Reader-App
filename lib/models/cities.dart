// import 'package:json_annotation/json_annotation.dart';

// @JsonSerializable()
// class Cities {
//   int result;
//   String message;

//   List<CityItems> items = new List<CityItems>();

//   Cities(
//     this.result,
//     this.message,
//   );

//   factory Cities.fromJson(Map json) => citiesFromJson(json);
// }

// @JsonSerializable()
// class CityItems {
//   String oid;
//   String cityName;
//   String areaCode;
//   int globalDbId;

//   CityItems(
//     this.oid,
//     this.cityName,
//     this.areaCode,
//     this.globalDbId,
//   );

//   factory CityItems.fromJson(Map json) => itemsFromJson(json);
// }

// Cities citiesFromJson(Map json) {
//   return Cities(
//     json['Result'] as int,
//     json['Message'] as String,
//   )..items = (json['Items'] as List)
//       ?.map((e) => e == null ? null : CityItems.fromJson(e as Map))
//       ?.toList();
// }

// CityItems itemsFromJson(Map json) {
//   return CityItems(
//     json['Oid'] as String,
//     json['CityName'] as String,
//     json['AreaCode'] as String,
//     json['GlobalDBId'] as int,
//   );
// }
