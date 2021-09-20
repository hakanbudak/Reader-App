import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CrmLoginResult {
  int result;
  String message;
  String sessionId;
  String firmNumber;
  bool isUserAdmin;
  String restApiVersion;

  NavigationMenuNames navigationMenuNames;

  CrmLoginResult(
    this.result,
    this.message,
    this.sessionId,
    this.firmNumber,
    this.isUserAdmin,
    this.restApiVersion,
  );

  factory CrmLoginResult.fromJson(Map json) => crmLoginResultFromJson(json);

  Map<String, dynamic> toJson() => crmLoginResultToJson(this);
}

@JsonSerializable()
class NavigationMenuNames {
  String mtFirm;
  String mtContact;
  String mtTask;

  NavigationMenuNames(this.mtFirm, this.mtContact, this.mtTask);

  factory NavigationMenuNames.fromJson(Map json) =>
      navigationMenuNamesFromJson(json);

  Map<String, dynamic> toJson() => navigationMenuNamesToJson(this);
}

CrmLoginResult crmLoginResultFromJson(Map json) {
  return CrmLoginResult(
      json['Result'] as int,
      json['Message'] as String,
      json['SessionId'] as String,
      json['Integration_FirmNumber'] as String,
      json['IsUserAdmin'] as bool,
      json['RESTApiVersion'] as String);
  // return CrmLoginResult(
  //     json['Result'] as int,
  //     json['Message'] as String,
  //     json['SessionId'] as String,
  //     json['Integration_FirmNumber'] as String,
  //     json['IsUserAdmin'] as bool,
  //     json['RESTApiVersion'] as String)
  //   ..navigationMenuNames =
  //       (navigationMenuNamesFromJson(json['NavigationMenuNames']));
}

Map<String, dynamic> crmLoginResultToJson(CrmLoginResult instance) =>
    <String, dynamic>{
      'Result': instance.result,
      'NavigationMenuNames': instance.navigationMenuNames
    };

NavigationMenuNames navigationMenuNamesFromJson(Map json) {
  return NavigationMenuNames(
    json['MT_Firm'] as String,
    json['MT_Contact'] as String,
    json['MT_Task'] as String,
  );
}

Map<String, dynamic> navigationMenuNamesToJson(NavigationMenuNames instance) =>
    <String, dynamic>{
      'MT_Contact': instance.mtContact,
    };
