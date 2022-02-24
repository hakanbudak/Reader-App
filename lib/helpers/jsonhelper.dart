import 'package:netline_cardvisit_reader/models/firm.dart';
import 'package:netline_cardvisit_reader/models/phone.dart';

class JsonHelper {
  static String getFirmJsonString(Firm firm) {
    var dateTime = DateTime.now();

    var firmCode = "CVR." +
        dateTime.year.toString() +
        dateTime.month.toString() +
        dateTime.day.toString() +
        dateTime.hour.toString() +
        dateTime.minute.toString() +
        dateTime.second.toString() +
        dateTime.millisecond.toString();

    var jsonString = '{'
        '"FirmCode": "$firmCode",'
        '"FirmTitle": "${firm.firmTitle}",'
        '"InUse": true,'
        '"IsPersonCompany": false,'
        '"PersonId": null,'
        '"TaxOffice": "",'
        '"TaxNo": "",'
        '"MainSector": {'
        '   "Oid": "${firm.sectorOid}",'
        '   "SectorName": "${firm.scCategory}",'
        '   "IsActive": true,'
        '},'
        '"SubSector": {'
        '   "Oid": "${firm.sectorOid}",'
        '   "SectorName": "${firm.scSubCategory}",'
        '   "IsActive": true,'
        '},'
        '"EmailAddress1": "${firm.eMailAddress1}",'
        '"EmailAddress2": "${firm.eMailAddress2}",'
        '"EmailAddress3": "${firm.eMailAddress3}",'
        '"WebAddress1": "${firm.webAddress1}",'
        '"WebAddress2": "${firm.webAddress2}",'
        '"Latitude": 0,'
        '"Longtitude": 0,'
        '"Notes": null,'
        '"Tags": null,'
        '"NotifyUsers": null,'
        '"PhotoBase64": null,'
        '"DefaultPhone": "",'
        '"IsLoading": false,'
        '"IsDeleted": false,'
        '"Loading": false,'
        '"IsMobile": false,'
        '"IsModified": false,'
        '"IsControllerSaving": false,'
        '"MobileSessionUser": "00000000-0000-0000-0000-000000000000",'
        '"OtherPortfolio": true,'
        // '"CityOfMainAddress": "",'
        '"CountryOfMainAddress": "",'
        '"Phones": "",'
        '"ERPId": "",'
        '"ERPCode": "",'
        '"FirmLogo": "System.Drawing.Bitmap",'
        '"IsRoutineVisit": false,'
        '"VisitFrequency": 0,'
        '"ARPAuthCode": "",'
        '"ARPTradingGroup": "",'
        '"Auxiliary_Code1": "",'
        '"ARPUsesInExports": "1",'
        '"ARPUsesInFinance": "1",'
        '"Auxiliary_Code5": "",'
        '"ARPUsesInImports": "1",'
        '"ARPUsesInPurchase": "1",'
        '"ARPUsesInSales": "1",'
        '"Auxiliary_Code4": "",'
        '"ARPAccountType": "3",'
        '"Auxiliary_Code3": ""';
    // '}';

    if (firm.firmCategory01Oid.isEmpty) {
      jsonString += '}';
    } else {
      jsonString += ',' +
          '"FirmCategory01": {' +
          ' "Oid": "' +
          firm.firmCategory01Oid +
          '"' +
          '}' +
          '}';
    }

    return jsonString;
  }

  static String getContactJsonString(Firm firm) {
    List<String> split = firm.personName.split(' ');

    var firstName = "";
    var lastName = "";

    for (int i = 0; i < split.length; i++) {
      if (i == split.length - 1) {
        lastName = split[i];
      } else {
        firstName = firstName + " " + split[i];
      }
    }

    return '{'
            '    "RelatedFirm": {'
            '        "Oid": "' +
        firm.oid +
        '"'
            '    },'
            '"FirstName": "' +
        firstName +
        '",'
            '"MiddleName": "",'
            '"LastName": "' +
        lastName +
        '",'
            '"Birthday": "1900-01-01T00:00:00",'
            '"FullName": "' +
        firm.personTitle +
        '",'
            '"InUse": true,'
            '"EmailAddress1": "' +
        firm.eMailAddress1 +
        '",'
            '"EmailAddress2": null,'
            '"EmailAddress3": null,'
            '"WebAddress1": null,'
            '"WebAddress2": null,'
            '"Notes": null,'
            '"Tags": null,'
            '"NotifyUsers": null,'
            '"Latitude": 0.0,'
            '"Longtitude": 0.0,'
            '"PhotoBase64": null,'
            '"DefaultPhone": null,'
            '"MainAddress": "' +
        firm.mainAddress +
        '",'
            '"IsLoading": false,'
            '"IsDeleted": false,'
            '"Loading": false,'
            '"IsMobile": false,'
            '"IsModified": false,'
            '"IsControllerSaving": false,'
            '"MobileSessionUser": "00000000-0000-0000-0000-000000000000",'
            '"OtherPortfolio": true,'
            '"CountryOfMainAddress": "",'
            '"Phones": "' +
        firm.phone1 +
        '",'
            '"Addresses": "' +
        firm.mainAddress +
        '",'
            '"ContactPhoto": "System.Drawing.Bitmap",'
            '"CheckOnDelete": true'
            '}';
  }

  static String getPhoneJsonString(Phone phone) {
    var jsonString = '{';

    if (phone.firmOid.isEmpty) {
      jsonString = jsonString + '"RelatedFirm": null,';
    } else {
      jsonString = jsonString +
          '    "RelatedFirm": {'
              '        "Oid": "' +
          phone.firmOid +
          '"'
              '    },';
    }

    if (phone.contactOid.isEmpty) {
      jsonString = jsonString + ' "RelatedContact": null,';
    } else {
      jsonString = jsonString +
          '    "RelatedContact": {'
              '        "Oid": "' +
          phone.contactOid +
          '"'
              '},';
    }

    jsonString = jsonString +
        '    "CountryCode": {'
            '"Oid": "' +
        phone.countryOid +
        '"'
            '},'
            '    "PhoneType": {'
            '        "Oid": "' +
        phone.phoneTypeOid +
        '"'
            '    },'
            '    "IsLoading": false,'
            '    "IsDeleted": false,'
            '    "Loading": false,'
            '    "IsMobile": false,'
            '    "IsModified": true,'
            '    "IsDefaultPhone": false,'
            '    "PhoneNumber": "",'
            '    "AutoAddedFromFirm": false,'
            '    "AreaCode": "' +
        phone.areaCode +
        '",'
            '    "Number": "' +
        phone.number +
        '",'
            '    "Extension": "' +
        phone.extension +
        '"'
            '}';

    return jsonString;
  }

  static String getPhoneJsonForContractString(String contactUid, Phone phone) {
    return '{'
            '    "RelatedFirm": {'
            '    "Oid": null,'
            '    "RelatedContact": {'
            '        "Oid": "' +
        contactUid +
        '"'
            '},'
            '    "CountryCode": null,'
            '    "PhoneType": {'
            '        "Oid": "' +
        "" +
        '"'
            '    },'
            '    "IsLoading": false,'
            '    "IsDeleted": false,'
            '    "Loading": false,'
            '    "IsMobile": false,'
            '    "IsModified": true,'
            '    "IsDefaultPhone": false,'
            '    "PhoneNumber": "",'
            '    "AutoAddedFromFirm": false,'
            '    "AreaCode": "' +
        phone.areaCode +
        '",'
            '    "Number": "' +
        phone.number +
        '",'
            '    "Extension": "' +
        phone.extension +
        '"'
            '}';
  }

  static String getAddressJsonString(Firm firm) {
    return '{'
            '    "AddressType": {'
            '        "Oid": "' +
        // firm.addressTypeOid +
        // '"'
        //     '    },'
        //     '    "City_": {'
        //     '        "Oid": "' +
        // firm.cityOid +
        // '",'
        //     '        "CityName": "' +
        // firm.city +
        // '"'
        //     '    },'
        //     '    "Country": {'
        //     '        "Oid": "' +
        firm.countryOid +
        '",'
            '        "Name": "TÜRKİYE"'
            '    },'
            '    "RelatedFirm": {'
            '        "Oid": "' +
        // firm.oid +
        // '"'
        //     '    },'
        //     '    "Street": "' +
        firm.mainAddress +
        '",'
            '    "Street2": "",'
            '    "StateProvince": "",'
            '    "ZipPostal": ""'
            '}';
  }
}
