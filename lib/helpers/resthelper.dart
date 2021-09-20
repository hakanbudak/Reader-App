import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:netline_cardvisit_reader/helpers/toasthelper.dart';
import 'package:netline_cardvisit_reader/models/address.dart';
import 'package:netline_cardvisit_reader/models/cities.dart';
import 'package:netline_cardvisit_reader/models/crmloginresult.dart';
import 'package:netline_cardvisit_reader/models/crmpostresultmodel.dart';
import 'package:netline_cardvisit_reader/models/firm.dart';
import 'package:netline_cardvisit_reader/models/mygooglesettings.dart';
import 'package:netline_cardvisit_reader/models/phone.dart';
import 'package:netline_cardvisit_reader/models/postresultmodel.dart';
import 'package:netline_cardvisit_reader/models/sector.dart';
import 'package:netline_cardvisit_reader/models/towns.dart';

import 'firestoreHelper.dart';
import 'jsonhelper.dart';

class RestHelper {
  static MyGoogleSettings _settings;
  static CrmLoginResult _crmLoginResult;
  static String _phoneTypeGuid; //
  static String _addressTypeOid = "";
  static String _countryOid;
  static String _sectorOid;
  static String _firmCategory01 = "";

  static Map<String, String> _header = {"Content-type": "application/json"};

// CRM Login
  static Future<CrmLoginResult> loginToRest() async {
    ToastHelper.showToast("CRM Girişi Yapılıyor");

    return await FirestoreHelper.getSettings().then((settings) async {
      _settings = settings;

      var encodedText =
          utf8.encode(settings.username + ":" + settings.password);
      var authorizationBase64String = base64.encode(encodedText);

      var url = _settings.url +
          '/api/v1.0/login?authorization=' +
          authorizationBase64String;

      var response = await post(url);

      _crmLoginResult = CrmLoginResult.fromJson(jsonDecode(response.body));

      print(url);
      print(_crmLoginResult);

      if (_crmLoginResult.result == 1) {
        ToastHelper.showToast(
          "Giriş Başarılı.",
          Toast.LENGTH_SHORT,
          false,
        );
      } else {
        print("Giriş Başarısız. " + _crmLoginResult.message);
        ToastHelper.showToast(
          "Giriş Başarısız. " + _crmLoginResult.message,
          Toast.LENGTH_LONG,
          true,
        );
      }

      return _crmLoginResult;
    });
  }

  static Future<CrmPostResultModel> postClient(Firm firm) async {
    _settings = await FirestoreHelper.getSettings().then((onValue) async {
      return onValue;
    });

    var url = _settings.url +
        "/api/v1.0/firms?SessionId=" +
        _crmLoginResult.sessionId;

    var jsonString = JsonHelper.getFirmJsonString(firm);

    var response = await post(
      url,
      headers: _header,
      body: jsonString,
    );

    var crmPostResult = CrmPostResultModel.fromJson(jsonDecode(response.body));
    print(url);
    print(response.body);
    if (crmPostResult.result == 0) {
      ToastHelper.showToast(
          "Firma Aktarımı Başarısız Oldu. " + crmPostResult.message,
          Toast.LENGTH_LONG,
          true);

      if (crmPostResult.message.contains("-221")) {
        _crmLoginResult.sessionId = "";
        await loginToRest();
        postClient(firm);
      }
    }

    return crmPostResult;
  }

  static Future<CrmPostResultModel> getFirmByWebDomain(String domain) async {
    var url = _settings.url +
        "/api/v1.0/firms?SessionId=" +
        _crmLoginResult.sessionId +
        "&q=WebAddress1 like '%" +
        domain +
        "'";

    var response = await get(url);

    var crmPostResult = CrmPostResultModel.fromJson(jsonDecode(response.body));
    print(url);
    print(response.body);
    if (crmPostResult.result != 1) {
      ToastHelper.showToast(
          "Mail adresine ait cari çağırılamadı" + crmPostResult.message,
          Toast.LENGTH_LONG,
          true);

      if (crmPostResult.message.contains("-221")) {
        _crmLoginResult.sessionId = "";
        await loginToRest();
        getFirmByMailDomain(domain);
      }
    }

    return crmPostResult;
  }

  static Future<CrmPostResultModel> getAddress(
      String firmOid, String mainAddress) async {
    var url = _settings.url +
        "/api/v1.0/addresses?SessionId=" +
        _crmLoginResult.sessionId +
        "&q=RelatedFirm='" +
        firmOid +
        "' AND Street='" +
        mainAddress +
        "'";

    var response = await get(url);

    var crmPostResult = CrmPostResultModel.fromJson(jsonDecode(response.body));
    print(url);
    print(response.body);

    if (crmPostResult.result != 1) {
      ToastHelper.showToast(
          "Firmaya ait adres numarası kontrol edilemedi\n" +
              crmPostResult.message,
          Toast.LENGTH_LONG,
          true);

      if (crmPostResult.message.contains("-221")) {
        _crmLoginResult.sessionId = "";
        await loginToRest();
        getAddress(firmOid, mainAddress);
      }
    }

    return crmPostResult;
  }

  static Future<CrmPostResultModel> getPhoneByRelatedFirm(
      String phone, String firmOid) async {
    var url = _settings.url +
        "/api/v1.0/phoneNumbers?SessionId=" +
        _crmLoginResult.sessionId +
        "&q=RelatedFirm = '" +
        firmOid +
        "'";

    var response = await get(url);

    var crmPostResult = CrmPostResultModel.fromJson(jsonDecode(response.body));
    print(url);
    print(response.body);

    if (crmPostResult.result != 1) {
      ToastHelper.showToast(
          "Firmaya ait telefon numarası kontrol edilemedi\n" +
              crmPostResult.message,
          Toast.LENGTH_LONG,
          true);

      if (crmPostResult.message.contains("-221")) {
        _crmLoginResult.sessionId = "";
        await loginToRest();
        getPhoneByRelatedFirm(phone, firmOid);
      }
    }

    return crmPostResult;
  }

  static Future<CrmPostResultModel> getFirmByMailDomain(String domain) async {
    var url = _settings.url +
        "/api/v1.0/firms?SessionId=" +
        _crmLoginResult.sessionId +
        "&q=EmailAddress1 like '%" +
        domain +
        "'";

    var response = await get(url);

    var crmPostResult = CrmPostResultModel.fromJson(jsonDecode(response.body));
    print(url);
    print(response.body);

    if (crmPostResult.result != 1) {
      ToastHelper.showToast(
          "Mail adresine ait cari çağırılamadı" + crmPostResult.message,
          Toast.LENGTH_LONG,
          true);

      if (crmPostResult.message.contains("-221")) {
        _crmLoginResult.sessionId = "";
        await loginToRest();
        getFirmByMailDomain(domain);
      }
    }

    return crmPostResult;
  }

  static Future<CrmPostResultModel> postWorkPhone(Phone phone) async {
    _phoneTypeGuid =
        await getPhoneTypeOid(_settings.workPhoneTypeName).then((onValue) {
      return onValue;
    });

    if (_phoneTypeGuid.isEmpty) {
      return CrmPostResultModel(
        0,
        "İş Telefon Tipi Öğrenilemediği İçin Aktarım Yapılmayacak.",
      );
    }

    var url = _settings.url +
        "/api/v1.0/phoneNumbers?SessionId=" +
        _crmLoginResult.sessionId;

    phone.phoneTypeOid = _phoneTypeGuid;

    var phoneJson = JsonHelper.getPhoneJsonString(phone);

    var response = await post(
      url,
      headers: _header,
      body: phoneJson,
    );

    var crmPostResult = CrmPostResultModel.fromJson(jsonDecode(response.body));
    print(url);
    print(response.body);

    if (crmPostResult.result != 1) {
      ToastHelper.showToast(
          "İş Telefonu Aktarımı Başarısız Oldu. " + crmPostResult.message,
          Toast.LENGTH_LONG,
          true);

      if (crmPostResult.message.contains("-221")) {
        _crmLoginResult.sessionId = "";
        await loginToRest();
        postWorkPhone(phone);
      }
    }

    return crmPostResult;
  }

  static Future<CrmPostResultModel> postCellPhone(Phone phone) async {
    _phoneTypeGuid =
        await getPhoneTypeOid(_settings.cellPhoneTypeName).then((onValue) {
      return onValue;
    });

    if (_phoneTypeGuid.isEmpty) {
      return CrmPostResultModel(
        0,
        "Cep Telefon Tipi Öğrenilemediği İçin Aktarım Yapılmayacak.",
      );
    }

    var url = _settings.url +
        "/api/v1.0/phoneNumbers?SessionId=" +
        _crmLoginResult.sessionId;

    phone.phoneTypeOid = _phoneTypeGuid;

    var phoneJson = JsonHelper.getPhoneJsonString(phone);

    var response = await post(
      url,
      headers: _header,
      body: phoneJson,
    );

    var crmPostResult = CrmPostResultModel.fromJson(jsonDecode(response.body));
    print(url);
    print(response.body);

    if (crmPostResult.result != 1) {
      ToastHelper.showToast(
          "Cep Telefonu Aktarımı Başarısız Oldu. " + crmPostResult.message,
          Toast.LENGTH_LONG,
          true);

      if (crmPostResult.message.contains("-221")) {
        _crmLoginResult.sessionId = "";
        await loginToRest();
        postCellPhone(phone);
      }
    }

    return crmPostResult;
  }

  static Future<CrmPostResultModel> postFaxPhone(Phone phone) async {
    _phoneTypeGuid =
        await getPhoneTypeOid(_settings.faxPhoneTypeName).then((onValue) {
      return onValue;
    });

    if (_phoneTypeGuid.isEmpty) {
      return CrmPostResultModel(
        0,
        "Faks Telefon Tipi Öğrenilemediği İçin Telefonlar Aktarılmayacak.",
      );
    }

    var url = _settings.url +
        "/api/v1.0/phoneNumbers?SessionId=" +
        _crmLoginResult.sessionId;

    phone.phoneTypeOid = _phoneTypeGuid;

    var phoneJson = JsonHelper.getPhoneJsonString(phone);

    var response = await post(
      url,
      headers: _header,
      body: phoneJson,
    );

    var crmPostResult = CrmPostResultModel.fromJson(jsonDecode(response.body));
    print(url);
    print(response.body);

    if (crmPostResult.result != 1) {
      ToastHelper.showToast(
          "Faks Telefonu Aktarımı Başarısız Oldu. " + crmPostResult.message,
          Toast.LENGTH_LONG,
          true);

      if (crmPostResult.message.contains("-221")) {
        _crmLoginResult.sessionId = "";
        await loginToRest();
        postFaxPhone(phone);
      }
    }

    return crmPostResult;
  }

  static Future<CrmPostResultModel> postFax(Phone phone) async {
    _phoneTypeGuid = await getPhoneTypeOid("fax").then((onValue) {
      return onValue;
    });

    if (_phoneTypeGuid.isEmpty) {
      return CrmPostResultModel(
        0,
        "Fax Tipi Öğrenilemediği İçin Fax Aktarılmayacak.",
      );
    }

    var url = _settings.url +
        "/api/v1.0/phoneNumbers?SessionId=" +
        _crmLoginResult.sessionId;

    phone.phoneTypeOid = _phoneTypeGuid;

    var phoneJson = JsonHelper.getPhoneJsonString(phone);

    var response = await post(
      url,
      headers: _header,
      body: phoneJson,
    );

    var crmPostResult = CrmPostResultModel.fromJson(jsonDecode(response.body));
    print(url);
    print(response.body);

    if (crmPostResult.result != 1) {
      ToastHelper.showToast(
          "Telefon Aktarımı Başarısız Oldu. " + crmPostResult.message,
          Toast.LENGTH_LONG,
          true);

      if (crmPostResult.message.contains("-221")) {
        _crmLoginResult.sessionId = "";
        await loginToRest();
        postFax(phone);
      }
    }

    return crmPostResult;
  }

  static Future<CrmPostResultModel> postAddress(Firm firm) async {
    var addressInfo =
        await getAddress(firm.oid, firm.mainAddress).then((onValue) {
      return onValue;
    });

    if (addressInfo.items.length > 0) {
      print("Adres mevcut. Tekrar aktarılmayacak.");
      return new CrmPostResultModel(1, "Adres mevcut");
    }

    if (_addressTypeOid.isEmpty) {
      _addressTypeOid = await getAddressTypeOid().then((value) {
        return value;
      });
    }

    var url = _settings.url +
        "/api/v1.0/addresses?SessionId=" +
        _crmLoginResult.sessionId;

    firm.addressTypeOid = _addressTypeOid;

    var addressJson = JsonHelper.getAddressJsonString(firm);

    var response = await post(
      url,
      headers: _header,
      body: addressJson,
    );

    var crmPostResult = CrmPostResultModel.fromJson(jsonDecode(response.body));
    print(url);
    print(response.body);

    if (crmPostResult.result != 1) {
      ToastHelper.showToast(
          "Adres Aktarımı Başarısız Oldu. " + crmPostResult.message,
          Toast.LENGTH_LONG,
          true);

      if (crmPostResult.message.contains("-221")) {
        _crmLoginResult.sessionId = "";
        await loginToRest();
        postAddress(firm);
      }
    }

    return crmPostResult;
  }

  static Future<CrmPostResultModel> postPerson(Firm firm) async {
    if (_addressTypeOid.isEmpty) {
      _addressTypeOid = await getAddressTypeOid().then((value) {
        return value;
      });
    }

    var url = _settings.url +
        "/api/v1.0/contacts?SessionId=" +
        _crmLoginResult.sessionId;

    firm.addressTypeOid = _addressTypeOid;

    var contactJson = JsonHelper.getContactJsonString(firm);

    var response = await post(
      url,
      headers: _header,
      body: contactJson,
    );

    var crmPostResult = CrmPostResultModel.fromJson(jsonDecode(response.body));
    print(url);
    print(response.body);

    if (crmPostResult.result != 1) {
      ToastHelper.showToast(
          "Kişi Aktarımı Başarısız Oldu. " + crmPostResult.message,
          Toast.LENGTH_LONG,
          true);

      if (crmPostResult.message.contains("-221")) {
        _crmLoginResult.sessionId = "";
        await loginToRest();
        postPerson(firm);
      }
    }

    return crmPostResult;
  }

  static Future<String> getAddressTypeOid() async {
    var url = _settings.url +
        "/api/v1.0/firms?SessionId=" +
        _crmLoginResult.sessionId +
        "&EmailAddress1 like '%@bilkur.com.tr'";

    var response = await get(url);

    var crmPostResult = CrmPostResultModel.fromJson(jsonDecode(response.body));
    print(url);
    print(response.body);

    if (crmPostResult.result != 1) {
      ToastHelper.showToast(
          "Telefon Tipi " +
              _settings.phoneTypeName +
              " İçin Bulunamadı. Lütfen CRM'de ki İfadeyi Kontrol Ediniz. " +
              crmPostResult.message,
          Toast.LENGTH_LONG,
          true);

      if (crmPostResult.message.contains("-221")) {
        _crmLoginResult.sessionId = "";
        await loginToRest();
        getAddressTypeOid();
      }

      _addressTypeOid = "";
      return "";
    }

    _addressTypeOid = crmPostResult.items.first.oid;

    return crmPostResult.items.first.oid;
  }

  static Future<String> getPhoneTypeOid(String phoneTypeName) async {
    var url = _settings.url +
        "/api/v1.0/phoneTypes?SessionId=" +
        _crmLoginResult.sessionId +
        "&q=TypeName='" +
        phoneTypeName +
        "'&fields=Oid,TypeName";

    var response = await get(url);

    var crmPostResult = CrmPostResultModel.fromJson(jsonDecode(response.body));
    print(url);
    print(response.body);

    if (crmPostResult.result != 1) {
      ToastHelper.showToast(
          "Telefon Tipi " +
              _settings.phoneTypeName +
              " İçin Bulunamadı. Lütfen CRM'de ki İfadeyi Kontrol Ediniz. " +
              crmPostResult.message,
          Toast.LENGTH_LONG,
          true);

      if (crmPostResult.message.contains("-221")) {
        _crmLoginResult.sessionId = "";
        await loginToRest();
        getPhoneTypeOid(phoneTypeName);
      }

      _phoneTypeGuid = "";
      return "";
    }

    _phoneTypeGuid = crmPostResult.items.first.oid;

    return crmPostResult.items.first.oid;
  }

  static Future<String> getCountryOid(String countryName) async {
    var url = _settings.url +
        "/api/v1.0/countries?SessionId=" +
        _crmLoginResult.sessionId +
        "&q=Name='" +
        countryName +
        "' AND GlobalDBId>0&fields=Oid,Name,TripleCode,GlobalDBId";

    var response = await get(url);

    var crmPostResult = CrmPostResultModel.fromJson(jsonDecode(response.body));
    print(url);
    print(response.body);

    if (crmPostResult.result != 1) {
      ToastHelper.showToast(
          "Ülke Referansı Bulunamadı. " + crmPostResult.message,
          Toast.LENGTH_LONG,
          true);

      if (crmPostResult.message.contains("-221")) {
        _crmLoginResult.sessionId = "";
        await loginToRest();
        getCountryOid(countryName);
      }

      _countryOid = "";
      return "";
    }

    if (crmPostResult.items.length > 0) {
      _countryOid = crmPostResult.items.first.oid;
      return crmPostResult.items.first.oid;
    } else {
      _countryOid = "";
      return "";
    }
  }

  static Future<Cities> getCities(String countryName) async {
    _countryOid = await getCountryOid(countryName).then((onValue) {
      return _countryOid;
    });

    if (_countryOid.isEmpty) {
      return new Cities(
        0,
        "Ülke Referansına Erişilemediği İçin İller Listesi Çekilemedi.",
      );
    }

    var url = _settings.url +
        "/api/v1.0/cities?SessionId=" +
        _crmLoginResult.sessionId +
        "&fieldName=Oid,CityName,AreaCode,GlobalDBId&q=CountryOid='" +
        _countryOid +
        "' AND GlobalDBId>0&limit=1000";

    var response = await get(url);

    var cities = Cities.fromJson(jsonDecode(response.body));

    if (cities.result != 1) {
      ToastHelper.showToast("İller Listesi Çekilemedi. " + cities.message,
          Toast.LENGTH_LONG, true);

      var resCities = new Cities(0, "İller Listesi Çekilemedi");
      return resCities;
    }

    return cities;
  }

  static Future<Towns> getTowns(String cityOid) async {
    var url = _settings.url +
        "/api/v1.0/counties?SessionId=" +
        _crmLoginResult.sessionId +
        "&fields=Oid,CountyName,GlobalDBId,CityOid"
            "&q=CityOid='" +
        cityOid +
        "' AND GlobalDBId>0&limit=10000";

    var response = await get(url);

    var towns = Towns.fromJson(jsonDecode(response.body));

    if (towns.result != 1) {
      ToastHelper.showToast("İlçeler Listesi Çekilemedi. " + towns.message,
          Toast.LENGTH_LONG, true);
    }

    return towns;
  }

  static Future<Sectors> getSectors() async {
    var url = "${_settings.url}/api/v1.0/sectors?" +
        "SessionId=${_crmLoginResult.sessionId}" +
        "&q=IsActive=true";

    var response = await get(url);

    var sectors = Sectors.fromJson(jsonDecode(response.body));

    if (sectors.result != 1) {
      ToastHelper.showToast(
          "Sektörler Çekilemedi. " + sectors.message, Toast.LENGTH_LONG, true);
    }

    return sectors;
  }

  static Future<String> getSectorOid(String sectorName) async {
    var url =
        "${_settings.url}/api/v1.0/sectors?SessionId=${_crmLoginResult.sessionId}&q=SectorName='$sectorName'";

    var response = await get(url);

    var crmPostResult = CrmPostResultModel.fromJson(jsonDecode(response.body));
    print(url);
    print(response.body);

    if (crmPostResult.result != 1) {
      ToastHelper.showToast("Sektör Bulunamadı. " + crmPostResult.message,
          Toast.LENGTH_LONG, true);

      if (crmPostResult.message.contains("-221")) {
        _crmLoginResult.sessionId = "";
        await loginToRest();
        getSectorOid(sectorName);
      }

      _sectorOid = "";
      return "";
    }

    if (crmPostResult.items.length > 0) {
      _sectorOid = crmPostResult.items.first.oid;
      return crmPostResult.items.first.oid;
    } else {
      _sectorOid = "";
      return "";
    }
  }

  static void postFirm(String sessionId, Firm firm) async {
    debugPrint("PostFirm");

    await FirestoreHelper.getSettings().then((onValue) async {
      _settings = onValue;
    });

    var url = _settings.url + "/api/v1.0/firms?SessionId=" + sessionId;

    Map<String, String> headers = {"Content-type": "application/json"};

    var jsonString = JsonHelper.getFirmJsonString(firm);

    Response response = await post(url, headers: headers, body: jsonString);

    String body = response.body;

    var parsedJson = json.decode(body);

    var firmOid = parsedJson['Items'][0]['Oid'];

    var postResult = new PostResultModel();

    postResult.message = parsedJson['Message'];
    postResult.result = parsedJson['Result'];

    debugPrint("Aktarım Sonrası Sonuç:\nResponseBody: " + response.body);

    if (postResult.result == 0) {
      ToastHelper.showToast(
          "Aktarım Sırasında Hata Oluştu.\n" + postResult.message,
          Toast.LENGTH_LONG,
          true);
    } else {
      ToastHelper.showToast(
          "Telefon Bilgisi Aktarılıyor.", Toast.LENGTH_SHORT, false);
    }

    url = _settings.url + "/api/v1.0/phoneNumbers?SessionId=" + sessionId;

    if (firm.phone1.isNotEmpty) {
      var phone = new Phone();
      phone.number = firm.phone1;
      phone.areaCode = "";
      phone.extension = "";

      var phone1Json = JsonHelper.getPhoneJsonString(phone);

      response = await post(url, headers: headers, body: phone1Json);

      body = response.body;

      parsedJson = json.decode(body);

      postResult = new PostResultModel();

      postResult.message = parsedJson['Message'];
      postResult.result = parsedJson['Result'];

      debugPrint(
          "Telefon 1 Aktarım Sonrası Sonuç:\nResponseBody: " + response.body);

      if (postResult.result == 0) {
        ToastHelper.showToast(
            "Aktarım Sırasında Hata Oluştu.\n" + postResult.message,
            Toast.LENGTH_LONG,
            true);
      } else {
        ToastHelper.showToast(
            "Telefon Bilgisi 2 Aktarılıyor.", Toast.LENGTH_SHORT, false);
      }
    }

    if (firm.phone2.isNotEmpty) {
      var phone = new Phone();
      phone.number = firm.phone2;
      phone.areaCode = "";
      phone.extension = "";

      var phone2Json = JsonHelper.getPhoneJsonString(phone);

      response = await post(url, headers: headers, body: phone2Json);

      body = response.body;

      parsedJson = json.decode(body);

      postResult = new PostResultModel();

      postResult.message = parsedJson['Message'];
      postResult.result = parsedJson['Result'];

      debugPrint(
          "Telefon 2 Aktarım Sonrası Sonuç:\nResponseBody: " + response.body);

      if (postResult.result == 0) {
        ToastHelper.showToast(
            "Aktarım Sırasında Hata Oluştu.\n" + postResult.message,
            Toast.LENGTH_LONG,
            true);
      } else {
        ToastHelper.showToast("Adres Aktarılıyor.", Toast.LENGTH_SHORT, false);
      }
    }

    url = _settings.url + "/api/v1.0/addresses?SessionId=" + sessionId;

    if (firm.mainAddress.isNotEmpty) {
      var address = new Address();
      address.city = firm.city;
      address.county = firm.town;
      address.street = firm.mainAddress;

      // var addressJson = JsonHelper.getAddressJsonString(firmOid, address);
      var addressJson = JsonHelper.getAddressJsonString(firm);

      response = await post(url, headers: headers, body: addressJson);

      body = response.body;

      parsedJson = json.decode(body);

      postResult = new PostResultModel();

      postResult.message = parsedJson['Message'];
      postResult.result = parsedJson['Result'];

      debugPrint(
          "Adres Aktarım Sonrası Sonuç:\nResponseBody: " + response.body);

      if (postResult.result == 0) {
        ToastHelper.showToast(
            "Adres Aktarımı Sırasında Hata Oluştu.\n" + postResult.message,
            Toast.LENGTH_LONG,
            true);
      } else {
        ToastHelper.showToast(
            "Yetkili Bilgisi Aktarılacak.\n" + postResult.message,
            Toast.LENGTH_SHORT,
            false);
      }
    }

    url = _settings.url + "/api/v1.0/contacts?SessionId=" + sessionId;

    var name = firm.personTitle ?? "";

    debugPrint("PersonTitle: $name");

    if (name.isNotEmpty) {
      var contactJson = JsonHelper.getContactJsonString(firm);

      debugPrint("ContactJson:\n" + contactJson);

      response = await post(url, headers: headers, body: contactJson);

      body = response.body;

      parsedJson = json.decode(body);

      postResult = new PostResultModel();

      postResult.message = parsedJson['Message'];
      postResult.result = parsedJson['Result'];

      debugPrint(
          "Yetkili Aktarımı Sonrası Sonuç:\nResponseBody: " + response.body);

      if (postResult.result == 0) {
        ToastHelper.showToast(
            "Yetkili Aktarımı Sırasında Hata Oluştu.\n" + postResult.message,
            Toast.LENGTH_LONG,
            true);
      } else {
        ToastHelper.showToast(
            "Yetkili İçin Telefon Bilgisi Aktarılacak.\n" + postResult.message,
            Toast.LENGTH_SHORT,
            false);
        var personUid = parsedJson['Items'][0]['Oid'];
      }
    }
  }

  static Future<String> getFirmCategory01Oid(String categoryName) async {
    var url = _settings.url +
        "/api/v1.0/firmCategories01?SessionId=" +
        _crmLoginResult.sessionId +
        "&q=CategoryDescription='" +
        categoryName +
        "'&fields=Oid";

    var response = await get(url);

    var crmPostResult = CrmPostResultModel.fromJson(jsonDecode(response.body));
    print(url);
    print(response.body);

    if (crmPostResult.result != 1) {
      ToastHelper.showToast(
          "Firma Kategorisi Bulunamadı. " + crmPostResult.message,
          Toast.LENGTH_LONG,
          true);

      if (crmPostResult.message.contains("-221")) {
        _crmLoginResult.sessionId = "";
        await loginToRest();
        getFirmCategory01Oid(categoryName);
      }

      _firmCategory01 = "";
      return "";
    }

    if (crmPostResult.items.length > 0) {
      _firmCategory01 = crmPostResult.items.first.oid;
      return crmPostResult.items.first.oid;
    } else {
      _firmCategory01 = "";
      return "";
    }
  }
}
