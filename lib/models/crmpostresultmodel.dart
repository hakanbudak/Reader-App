import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CrmPostResultModel {
  int result;
  String message;

  List<Items> items;

  CrmPostResultModel(
    this.result,
    this.message,
  );

  factory CrmPostResultModel.fromJson(Map json) =>
      crmPostResultModelFromJson(json);
}

@JsonSerializable()
class Items {
  String oid;
  String firmCode;

  Items(this.oid, this.firmCode);

  factory Items.fromJson(Map json) => itemsFromJson(json);
}

CrmPostResultModel crmPostResultModelFromJson(Map json) {
  return CrmPostResultModel(
    json['Result'] as int,
    json['Message'] as String,
  )..items = (json['Items'] as List)
      ?.map((e) => e == null ? null : Items.fromJson(e as Map))
      ?.toList();
}

Items itemsFromJson(Map json) {
  return Items(
    json['Oid'] as String,
    json['FirmCode'] as String,
  );
}
