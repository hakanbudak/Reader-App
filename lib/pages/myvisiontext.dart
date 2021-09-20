import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mlkit/mlkit.dart';

import 'package:netline_cardvisit_reader/helpers/patternhelper.dart';
import 'package:netline_cardvisit_reader/helpers/resthelper.dart';
import 'package:netline_cardvisit_reader/helpers/stringhelper.dart';

import 'package:netline_cardvisit_reader/helpers/toasthelper.dart';
import 'package:netline_cardvisit_reader/localizations.dart';
import 'package:netline_cardvisit_reader/models/cities.dart';
import 'package:netline_cardvisit_reader/models/crmloginresult.dart';
import 'package:netline_cardvisit_reader/models/firm.dart';
import 'package:netline_cardvisit_reader/models/mygooglesettings.dart';
import 'package:netline_cardvisit_reader/models/phone.dart';
import 'package:netline_cardvisit_reader/models/towns.dart';
import 'package:turkish/turkish.dart';

import '../globals.dart';
import 'settingspage.dart';

class MyVisionText extends StatefulWidget {
  MyVisionText({Key key, this.title, @required this.crmLoginResult})
      : super(key: key);

  final String title;
  CrmLoginResult crmLoginResult;

  @override
  _MyVisionTextState createState() => _MyVisionTextState();
}

class _MyVisionTextState extends State<MyVisionText> {
  var base64 = const Base64Codec();

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (index == 0) {
        transferData();
      } else if (index == 1) {
        to(ImageSource.gallery);
      } else if (index == 2) {
        to(ImageSource.camera);
      } else if (index == 3) {
        goSettingsPage();
      }
    });
  }

  File _file;

  var _patternHelper = new PatternHelper();

  FirebaseVisionTextDetector detector = FirebaseVisionTextDetector.instance;

  TextEditingController _teClientDefinition = new TextEditingController();
  TextEditingController _teAddress = new TextEditingController();
  TextEditingController _tePhone1 = new TextEditingController();
  TextEditingController _tePhone2 = new TextEditingController();
  TextEditingController _teFax = new TextEditingController();
  TextEditingController _teEMail = new TextEditingController();
  TextEditingController _teWebUrl = new TextEditingController();
  TextEditingController _teNeighborhood = new TextEditingController();
  TextEditingController _teMainStreet = new TextEditingController();
  TextEditingController _teStreet = new TextEditingController();
  TextEditingController _teBuildingNumber = new TextEditingController();
  TextEditingController _teDistrict = new TextEditingController();
  TextEditingController _teTown = new TextEditingController();
  TextEditingController _teCity = new TextEditingController();
  TextEditingController _teCountry = new TextEditingController();
  TextEditingController _teContact = new TextEditingController();
  TextEditingController _tePersonTitle = new TextEditingController();
  TextEditingController _tePersonTitle2 = new TextEditingController();

  String _clientDefinition;
  String _address;
  String _phone1;
  String _phone2;
  String _fax;
  String _eMail;
  String _webUrl;

  String _neighborhood;
  String _mainStreet;
  String _street;
  String _buildingNumber;
  String _district;
  String _town;
  String _city;
  String _country;

  String _contact;
  String _title;
  String _title2;

  String _fullText;

  String _sessionId = "";

  CrmLoginResult _crmLoginResult;
  Cities _cities;
  Towns _towns;

  Firm _firm;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _crmLoginResult = widget.crmLoginResult;

    var localization = new DemoLocalizations(Localizations.localeOf(context));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          localization.title,
          style: new TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 0,
        leading: new Image.asset("assets/images/netline.png"),
      ),
      body: SingleChildScrollView(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(6.0),
              child: new TextFormField(
                controller: _teClientDefinition,
                onSaved: (value) {
                  value = value.replaceAll("\n", " ");
                  _clientDefinition = value;
                },
                cursorColor: Globals.AppBaseColor,
                decoration: getPlaceHolder(localization.clientDefinition),
                validator: (value) {
                  value = value.replaceAll("\n", " ");
                  return validateClientDefinition(value);
                },
                maxLines: 4,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(6.0),
              child: new TextFormField(
                controller: _teContact,
                onSaved: (value) {
                  value = value.replaceAll("\n", " ");
                  _contact = value;
                },
                cursorColor: Globals.AppBaseColor,
                decoration: getPlaceHolder(localization.contactName),
                validator: (value) {
                  value = value.replaceAll("\n", " ");
                  return validateClientDefinition(value);
                },
                maxLines: 1,
                keyboardType: TextInputType.text,
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(6.0),
              child: new TextFormField(
                controller: _tePersonTitle,
                onSaved: (value) {
                  value = value.replaceAll("\n", " ");
                  _clientDefinition = value;
                },
                cursorColor: Globals.AppBaseColor,
                decoration: getPlaceHolder(localization.contactTitle),
                validator: (value) {
                  value = value.replaceAll("\n", " ");
                  return validateClientDefinition(value);
                },
                maxLines: 1,
                keyboardType: TextInputType.text,
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(6.0),
              child: new TextFormField(
                controller: _tePersonTitle2,
                onSaved: (value) {
                  value = value.replaceAll("\n", " ");
                  _clientDefinition = value;
                },
                cursorColor: Globals.AppBaseColor,
                decoration: getPlaceHolder(localization.contactTitle2),
                validator: (value) {
                  value = value.replaceAll("\n", " ");
                  return validateClientDefinition(value);
                },
                maxLines: 1,
                keyboardType: TextInputType.text,
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(6.0),
              child: new TextFormField(
                controller: _teAddress,
                onSaved: (value) {
                  value = value.replaceAll("\n", " ");
                  _address = value;
                },
                decoration: getPlaceHolder(localization.address),
                cursorColor: Globals.AppBaseColor,
                maxLines: 4,
                keyboardType: TextInputType.text,
              ),
            ),
            // new Padding(
            //   padding: const EdgeInsets.all(6.0),
            //   child: new TextFormField(
            //     controller: _teDistrict,
            //     onSaved: (value) {
            //       value = value.replaceAll("\n", " ");
            //       _town = value;
            //     },
            //     decoration: getPlaceHolder("Semt"),
            //     cursorColor: Globals.AppBaseColor,
            //     validator: (value) {
            //       value = value.replaceAll("\n", " ");
            //       return validateAddress(value);
            //     },
            //     maxLines: 1,
            //     keyboardType: TextInputType.text,
            //   ),
            // ),
            new Padding(
              padding: const EdgeInsets.all(6.0),
              child: new TextFormField(
                controller: _teTown,
                onSaved: (value) {
                  value = value.replaceAll("\n", " ");
                  _town = value;
                },
                decoration: getPlaceHolder(localization.town),
                cursorColor: Globals.AppBaseColor,
                maxLines: 1,
                keyboardType: TextInputType.text,
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(6.0),
              child: new TextFormField(
                controller: _teCity,
                onSaved: (value) {
                  value = value.replaceAll("\n", " ");
                  _city = value;
                },
                decoration: getPlaceHolder(localization.city),
                cursorColor: Globals.AppBaseColor,
                maxLines: 1,
                keyboardType: TextInputType.text,
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(6.0),
              child: new TextFormField(
                controller: _teCountry,
                onSaved: (value) {
                  value = value.replaceAll("\n", " ");
                  _country = value;
                },
                decoration: getPlaceHolder(localization.country),
                cursorColor: Globals.AppBaseColor,
                maxLines: 1,
                keyboardType: TextInputType.text,
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(6.0),
              child: new TextFormField(
                controller: _tePhone1,
                onSaved: (value) {
                  value = value.replaceAll("\n", " ");
                  _phone1 = value;
                },
                decoration: getPlaceHolder(localization.phone1),
                cursorColor: Globals.AppBaseColor,
                validator: (value) {
                  return validatePhone(value);
                },
                keyboardType: TextInputType.phone,
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(6.0),
              child: new TextFormField(
                controller: _tePhone2,
                onSaved: (value) {
                  value = value.replaceAll("\n", " ");
                  _phone2 = value;
                },
                decoration: getPlaceHolder(localization.phone2),
                cursorColor: Globals.AppBaseColor,
                validator: (value) {
                  value = value.replaceAll("\n", " ");
                  return validatePhone(value);
                },
                keyboardType: TextInputType.phone,
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(6.0),
              child: new TextFormField(
                controller: _teFax,
                onSaved: (value) {
                  value = value.replaceAll("\n", " ");
                  _fax = value;
                },
                decoration: getPlaceHolder(localization.fax),
                cursorColor: Globals.AppBaseColor,
                validator: (value) {
                  value = value.replaceAll("\n", " ");
                  return validatePhone(value);
                },
                keyboardType: TextInputType.phone,
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(6.0),
              child: new TextFormField(
                controller: _teEMail,
                onSaved: (value) {
                  value = value.replaceAll("\n", " ");
                  _eMail = value;
                },
                decoration: getPlaceHolder(localization.eMail),
                cursorColor: Globals.AppBaseColor,
                validator: (value) {
                  value = value.replaceAll("\n", " ");
                  return validatePhone(value);
                },
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(6.0),
              child: new TextFormField(
                controller: _teWebUrl,
                onSaved: (value) {
                  value = value.replaceAll("\n", " ");
                  _webUrl = value;
                },
                decoration: getPlaceHolder(localization.webAddress),
                cursorColor: Globals.AppBaseColor,
                keyboardType: TextInputType.url,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_add,
              color: Globals.AppBaseReverseColor,
            ),
            title: Text(
              "",
              style: TextStyle(
                color: Globals.AppBaseReverseColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.photo,
              color: Globals.AppBaseReverseColor,
            ),
            title: Text(
              "",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Globals.AppBaseReverseColor,
                fontSize: 16,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera,
              color: Globals.AppBaseReverseColor,
            ),
            title: Text(
              "",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Globals.AppBaseReverseColor,
                fontSize: 16,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Globals.AppBaseReverseColor,
            ),
            title: Text(
              "",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Globals.AppBaseReverseColor,
                fontSize: 16,
              ),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Globals.AppBaseReverseColor,
        backgroundColor: Globals.AppBaseColor,
        onTap: _onItemTapped,
      ),
//      floatingActionButton: Padding(
//        padding: const EdgeInsets.all(6.0),
//        child: new Container(
//          width: 192.0,
//          height: 96.0,
//          child: new Row(
//            children: <Widget>[
//              new Column(
//                children: <Widget>[
//                  getIcon(
//                    Icons.add_to_home_screen,
//                    transferData,
//                  ),
//                  getSubString("Aktar"),
//                ],
//                mainAxisAlignment: MainAxisAlignment.center,
//              ),
//              new Column(
//                children: <Widget>[
//                  getIcon(
//                    Icons.photo_camera,
//                    to,
//                  ),
//                  getSubString("Görüntü Al"),
//                ],
//                mainAxisAlignment: MainAxisAlignment.center,
//              ),
//            ],
//          ),
//        ),
//      ),
    );
  }

  RawMaterialButton getIcon(IconData icon, Function func) {
    return new RawMaterialButton(
      shape: new CircleBorder(),
      elevation: 0.0,
      child: new Icon(
        icon,
        color: Globals.AppBaseColor,
        size: 36,
      ),
      onPressed: func,
    );
  }

  Padding getSubString(String text) {
    return new Padding(
      padding: const EdgeInsets.all(6.0),
      child: Center(
        child: new Text(
          text,
          style: new TextStyle(
            color: Globals.AppBaseColor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Firm getFirm() {
    var firm = new Firm();
    firm.firmTitle = _teClientDefinition.text;
    firm.mainAddress = _teAddress.text;
    firm.city = _teCity.text;
    firm.town = _teTown.text;
    firm.country = _teCountry.text;
    firm.phone1 = _tePhone1.text;
    firm.phone2 = _tePhone2.text;
    firm.fax = _teFax.text;
    firm.eMailAddress1 = _teEMail.text;
    firm.eMailAddress2 = "";
    firm.eMailAddress3 = "";
    firm.webAddress1 = _teWebUrl.text;
    firm.webAddress2 = "";
    firm.cityOfMainAddress = "";
    firm.countryOfMainAddress = "";
    firm.isPersonCompany = false;
    firm.inUse = true;
    firm.personTitle = _tePersonTitle.text;
    firm.personName = _teContact.text;

    _firm = firm;

    return firm;
  }

  transferData() async {
    var result = await validateFields().then((onValue) => onValue);

    if (!result) {
      return;
    }

    ToastHelper.showToast("Aktarım Başladı");

    if (_crmLoginResult.sessionId.isEmpty) {
      ToastHelper.showToast("Bağlantı Yapılıyor.");

      _crmLoginResult =
          await RestHelper.loginToRest().then((onValue) => onValue);

      if (_crmLoginResult.result == 0) {
        return;
      }
    }

    var crmPostResultModel =
        await RestHelper.postClient(_firm).then((onValue) => onValue);

    if (crmPostResultModel.result == 0) {
      return;
    }

    _firm.oid = crmPostResultModel.items.first.oid;

    if (_firm.phone1.isNotEmpty) {
      var phone = new Phone();
      phone.number = _firm.phone1;
      phone.areaCode = "";
      phone.extension = "";
      phone.contactOid = "";
      phone.firmOid = _firm.oid;
      phone.countryOid = _firm.countryOid;

      crmPostResultModel =
          await RestHelper.postCellPhone(phone).then((onValue) {
        return onValue;
      });
    }

    if (_firm.phone2.isNotEmpty) {
      var phone = new Phone();
      phone.number = _firm.phone2;
      phone.areaCode = "";
      phone.extension = "";
      phone.contactOid = "";
      phone.firmOid = _firm.oid;
      phone.countryOid = _firm.countryOid;

      crmPostResultModel =
          await RestHelper.postWorkPhone(phone).then((onValue) => onValue);
    }

    if (_firm.fax.isNotEmpty) {
      var phone = new Phone();
      phone.number = _firm.fax;
      phone.areaCode = "";
      phone.extension = "";
      phone.contactOid = "";
      phone.firmOid = _firm.oid;
      phone.countryOid = _firm.countryOid;

      crmPostResultModel =
          await RestHelper.postFaxPhone(phone).then((onValue) => onValue);
    }

    // TOOD: dönüş değeri kontrol edilecek
    crmPostResultModel =
        await RestHelper.postAddress(_firm).then((onValue) => onValue);

    if (_firm.personName.isNotEmpty) {
      crmPostResultModel =
          await RestHelper.postPerson(_firm).then((onValue) => onValue);

      if (crmPostResultModel.result == 1) {
        var phone = new Phone();
        phone.number = _firm.phone1;
        phone.areaCode = "";
        phone.extension = "";
        phone.contactOid = "";
        phone.firmOid = "";
        phone.contactOid = crmPostResultModel.items.first.oid;
        phone.countryOid = _firm.countryOid;

        crmPostResultModel =
            await RestHelper.postCellPhone(phone).then((onValue) => onValue);
      }
    }

    ToastHelper.showToast("Aktarım İşlemleri Tamamlandı.");
  }

  // Kullanılmayacak
  loginToRest() async {
    var loginResult = await RestHelper.loginToRest().then((value) {
      debugPrint("value: $value");

      return value;
    });

    if (loginResult == null) {
      debugPrint("loginResult is null");
      return;
    }

    if (loginResult.result == 0) {
      _sessionId = "";

      return;
    }

    _crmLoginResult = loginResult;
    _sessionId = loginResult.sessionId;

    if (_sessionId != "") {
      var firm = new Firm();
      firm.firmTitle = _teClientDefinition.text;
      firm.mainAddress = _teAddress.text;
      firm.city = _teCity.text;
      firm.town = _teTown.text;
      firm.phone1 = _tePhone1.text;
      firm.phone2 = _tePhone2.text;
      firm.fax = _teFax.text;
      firm.eMailAddress1 = _teEMail.text;
      firm.eMailAddress2 = "";
      firm.eMailAddress3 = "";
      firm.webAddress1 = _teWebUrl.text;
      firm.webAddress2 = "";
      firm.cityOfMainAddress = "";
      firm.countryOfMainAddress = "";
      firm.isPersonCompany = false;
      firm.inUse = true;
      firm.personTitle = _tePersonTitle.text;
      firm.personName = _teContact.text;

      await RestHelper.postFirm(_sessionId, firm);

      ToastHelper.showToast(
          "Firma Aktarımı Tamamlandı", Toast.LENGTH_SHORT, false);
    }
  }

  void clearFields() {
    _teClientDefinition.text = "";
    _teContact.text = "";
    _tePersonTitle.text = "";
    _tePersonTitle2.text = "";
    _teAddress.text = "";
    _teTown.text = "";
    _teCity.text = "";
    _teCountry.text = "";
    _tePhone1.text = "";
    _tePhone2.text = "";
    _teFax.text = "";
    _teEMail.text = "";
    _teWebUrl.text = "";
  }

  parseData(String text) {
    clearFields();

    print("Full Text: $text");

    var personelTitle = _patternHelper.getTitle(text);

    if (personelTitle.isNotEmpty) {
      text = StringHelper.replaceAll(text, personelTitle);
    }

    _tePersonTitle.text = personelTitle;

    print("personelTitle1: $personelTitle");

    var personelTitle2 = _patternHelper.getTitle(text);

    if (personelTitle2.isNotEmpty) {
      text = StringHelper.replaceAll(text, personelTitle2);
    }

    if (_tePersonTitle2.text.isNotEmpty) {
      _tePersonTitle2.text = personelTitle2;
    } else {
      _tePersonTitle2.text = personelTitle2;
    }

    print("personelTitle2: $personelTitle");

    var personelTitle3 = _patternHelper.getTitle(text);

    if (personelTitle3.isNotEmpty) {
      text = StringHelper.replaceAll(text, personelTitle3);
    }

    var personelTitle4 = _patternHelper.getTitle(text);

    if (personelTitle4.isNotEmpty) {
      text = StringHelper.replaceAll(text, personelTitle4);
    }

    var eMail = _patternHelper.getEMailAddress(text);

    if (eMail.isNotEmpty) {
      text = StringHelper.replaceAll(text, eMail);
    }

    var socialMediaAccount1 = _patternHelper.getSocialMediaAccount(text);

    if (socialMediaAccount1.isNotEmpty) {
      text = StringHelper.replaceAll(text, socialMediaAccount1);
    }

    print("socialMediaAccount1: $socialMediaAccount1");

    var socialMediaAccount2 = _patternHelper.getSocialMediaAccount(text);

    if (socialMediaAccount2.isNotEmpty) {
      text = StringHelper.replaceAll(text, socialMediaAccount2);
    }

    print("socialMediaAccount2: $socialMediaAccount2");

    var socialMediaAccount3 = _patternHelper.getSocialMediaAccount(text);

    if (socialMediaAccount3.isNotEmpty) {
      text = StringHelper.replaceAll(text, socialMediaAccount3);
    }

    print("socialMediaAccount3: $socialMediaAccount3");

    print("eMail: $eMail");

    var eMail2 = _patternHelper.getEMailAddress(text);

    if (eMail2.isNotEmpty) {
      text = StringHelper.replaceAll(text, eMail2);
    }

    print("eMail2: $eMail2");

    var webUrl = _patternHelper.getWebUrl(text);

    if (webUrl.isNotEmpty) {
      text = StringHelper.replaceAll(text, webUrl);
    }

    text = StringHelper.replaceAll(text, webUrl);

    webUrl = StringHelper.clearSpaces(webUrl)
        .toLowerCase()
        .replaceAll("http://", "")
        .replaceAll("https://", "")
        .replaceAll("w:", "")
        .replaceAll(":", "");

    print("webUrl: $webUrl");

    var webUrl2 = _patternHelper.getWebUrl(text);

    if (webUrl2.isNotEmpty) {
      text = StringHelper.replaceAll(text, webUrl2);
    }

    var fax = _patternHelper.getFaxNumber(text);

    if (fax.isNotEmpty) {
      text = StringHelper.replaceAll(text, fax);
    }

    print("fax: $fax");

    var phoneNumber1 = _patternHelper.getPhoneNumber(text);

    if (phoneNumber1.isNotEmpty) {
      text = StringHelper.replaceAll(text, phoneNumber1);
    }

    print("phoneNumber1: $phoneNumber1");

    var phoneNumber2 = _patternHelper.getPhoneNumber(text);

    if (phoneNumber2.isNotEmpty) {
      text = StringHelper.replaceAll(text, phoneNumber2);
    }

    print("phoneNumber2: $phoneNumber2");

    var country = _patternHelper.getCountry(text);

    if (country.isNotEmpty) {
      text = StringHelper.replaceAll(text, country);
      _teCountry.text = country;
    }

    print("country: $country");

    var industirialArea = _patternHelper.getIndustirialArea(text);

    if (industirialArea.isNotEmpty) {
      text = StringHelper.replaceAll(text, industirialArea);
    }
    var neighborhood = _patternHelper.getNeighborhood(text);

    if (neighborhood.isNotEmpty) {
      text = StringHelper.replaceAll(text, neighborhood);
    }

    print("neighborhood: $neighborhood");

    var neighborhood2 = _patternHelper.getNeighborhood2(text);

    if (neighborhood2.isNotEmpty) {
      text = StringHelper.replaceAll(text, neighborhood2);
    }

    print("neighborhood2: $neighborhood2");

    var mainStreet = _patternHelper.getMainStreet(text);

    if (mainStreet.isNotEmpty) {
      text = StringHelper.replaceAll(text, mainStreet);
    }

    print("mainStreet: $mainStreet");

    var mainStreet2 = _patternHelper.getMainStreet(text);

    if (mainStreet2.isNotEmpty) {
      text = StringHelper.replaceAll(text, mainStreet2);
    }

    print("mainStreet2: $mainStreet2");

    var street = _patternHelper.getStreet(text);

    if (street.isNotEmpty) {
      text = StringHelper.replaceAll(text, street);
    }

    print("street: $street");

    var buildingNumber = _patternHelper.getBuildingNumber(text);

    if (buildingNumber.isNotEmpty) {
      text = StringHelper.replaceAll(text, buildingNumber);
    }

    print("buildingNumber: $buildingNumber");

    var buildingNumber2 = _patternHelper.getBuildingNumber(text);

    if (buildingNumber2.isNotEmpty) {
      text = StringHelper.replaceAll(text, buildingNumber2);
    }

    print("buildingNumber2: $buildingNumber2");

    var apartmentName = _patternHelper.getApartmentName(text);

    if (apartmentName.isNotEmpty) {
      text = StringHelper.replaceAll(text, apartmentName);
    }

    print("apartmentName: $apartmentName");

    var apartmentNumber = _patternHelper.getApartmentNumber(text);

    if (apartmentNumber.isNotEmpty) {
      text = StringHelper.replaceAll(text, apartmentNumber);
    }

    print("apartmentNumber: $apartmentNumber");

    var floor = _patternHelper.getFloor(text);

    if (floor.isNotEmpty) {
      text = StringHelper.replaceAll(text, floor);
    }

    print("floor: $floor");

    var town = _patternHelper.getTown(text);

    if (town.isNotEmpty) {
      text = StringHelper.replaceAll(text, town);
    }

    var forDirection = _patternHelper.getForDirections(text);

    if (forDirection.isNotEmpty) {
      text = StringHelper.replaceAll(text, forDirection);
    }

    print("forDirection: $forDirection");

    var district = _patternHelper.getDistrict(text);

    if (district.isNotEmpty) {
      text = StringHelper.replaceAll(text, district);
    }

    print("district: $district");

    var city = _patternHelper.getCity(text);

    if (city.isNotEmpty) {
      text = StringHelper.replaceAll(text, city);
    }

    print("city: $city");

    var name = _patternHelper.getNames(text, " ").replaceAll(" ", "");

    if (name.isNotEmpty) {
      text = StringHelper.replaceAll(text, name);
      _teContact.text = name.replaceAll("#", "");
    }

    print("name1: $name");

    name = _patternHelper.getNames(text, name);

    if (name.isNotEmpty) {
      text = StringHelper.replaceAll(text, name);
      _teContact.text = _teContact.text + " " + name.replaceAll("#", "");
    }

    _teContact.text = _teContact.text.replaceAll("  ", " ");

    print("name2: $name");

    var addressText = "";

    if (industirialArea.isNotEmpty) {
      addressText += industirialArea + " ";
    }
    if (neighborhood.isNotEmpty) {
      addressText += neighborhood + " ";
    }
    if (neighborhood2.isNotEmpty) {
      addressText += neighborhood2 + " ";
    }
    if (mainStreet2.isNotEmpty) {
      addressText += mainStreet2 + " ";
    }
    if (mainStreet.isNotEmpty) {
      addressText += mainStreet + " ";
    }
    if (street.isNotEmpty) {
      addressText += street + " ";
    }
    if (apartmentName.isNotEmpty) {
      addressText += apartmentName + " ";
    }
    if (buildingNumber.isNotEmpty) {
      addressText += buildingNumber + " ";
    }
    if (buildingNumber2.isNotEmpty) {
      addressText += buildingNumber2 + " ";
    }
    if (floor.isNotEmpty) {
      addressText += floor + " ";
    }
    if (apartmentNumber.isNotEmpty) {
      addressText += apartmentNumber + " ";
    }
    if (forDirection.isNotEmpty) {
      addressText += forDirection + " ";
    }

    if (district.isNotEmpty) {
      addressText += district + " ";
    }
    if (town.isNotEmpty) {
      addressText += town + " ";
    }
    if (city.isNotEmpty) {
      addressText += city + " ";
    }

    for (int i = 0; i < 5; i++) {
      var address = _patternHelper.getAddress(text);

      if (address.isNotEmpty) {
        addressText = addressText + address + " ";

        text = StringHelper.replaceAll(text, address).replaceAll("#", "");
      }
    }

    print("addressText: $addressText");

    eMail = eMail.replaceAll(" ", "");
    eMail = eMail
        .replaceAll("#", "")
        .replaceAll("E:", "")
        .replaceAll("E-posta", "")
        .replaceAll("e-mail", "");

    eMail = eMail.replaceAll(":", "");

    _teEMail.text = StringHelper.clearSpaces(eMail).toLowerCase();

    _teWebUrl.text = webUrl;
    _teFax.text = StringHelper.clearSpaces(fax)
        .toUpperCase()
        .replaceAll("#", "")
        .replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll(":", "")
        .replaceAll("S", "")
        .replaceAll("A", "")
        .replaceAll("F", "")
        .replaceAll("A", "")
        .replaceAll("K", "")
        .replaceAll("S", "")
        .replaceAll("X", "");
    _tePhone1.text = StringHelper.clearSpaces(phoneNumber1)
        .toUpperCase()
        .replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll("Gsm", "")
        .replaceAll("Tel", "")
        .replaceAll("#", "")
        .replaceAll(":", "")
        .replaceAll("-", "")
        .replaceAll("L", "")
        .replaceAll("E", "")
        .replaceAll("E", "")
        .replaceAll("M", "")
        .replaceAll("G", "")
        .replaceAll("S", "")
        .replaceAll("T", "");
    _tePhone2.text = StringHelper.clearSpaces(phoneNumber2)
        .toUpperCase()
        .replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll("Gsm", "")
        .replaceAll("Tel", "")
        .replaceAll("#", "")
        .replaceAll(":", "")
        .replaceAll("-", "")
        .replaceAll("L", "")
        .replaceAll("E", "")
        .replaceAll("E", "")
        .replaceAll("M", "")
        .replaceAll("G", "")
        .replaceAll("S", "")
        .replaceAll("T", "");

    _teNeighborhood.text = neighborhood;
    _teMainStreet.text = mainStreet;
    _teStreet.text = street;
    _teBuildingNumber.text = buildingNumber;
    _teAddress.text =
        addressText.trimLeft().trimRight().trim().replaceAll("  ", " ");
    _teDistrict.text = district.replaceAll("/", "");
    _teTown.text = town.replaceAll(",", "").replaceAll("/", "");
    _teCity.text = city;
    _teCountry.text = country;

    print("Before Replace: $text");

    text = text
        .replaceAll("#", " ")
        .replaceAll("DIRECT:", "")
        .replaceAll("Direct:", "")
        .replaceAll("Web:", "")
        .replaceAll(" WEB ", "")
        .replaceAll("EMAIL:", "")
        .replaceAll("Address:", "")
        .replaceAll("Address", "")
        .replaceAll("ADDRESS", "")
        .replaceAll("PO.Box", "")
        .replaceAll("(pbx)", "")
        .replaceAll(" @: ", "")
        .replaceAll(" int. ", "")
        .replaceAll("Ext.", "")
        .replaceAll("Email", "")
        .replaceAll(" gsm ", "")
        .replaceAll(" (gsm) ", "")
        .replaceAll(" (fax) ", "")
        .replaceAll("eEMail", "")
        .replaceAll(" M ", "")
        .replaceAll(" M. ", "")
        .replaceAll(" M: ", "")
        .replaceAll(" T ", "")
        .replaceAll(" T: ", "")
        .replaceAll(" T. ", "")
        .replaceAll(" web", "")
        .replaceAll(" fax ", "")
        .replaceAll("Fax.", "")
        .replaceAll("Mob.", "")
        .replaceAll(" MOB ", "")
        .replaceAll("phone", "")
        .replaceAll("mobile", "")
        .replaceAll("Tel.", "")
        .replaceAll("Telefon", "")
        .replaceAll("Faks", "")
        .replaceAll("Skype", "")
        .replaceAll(" Tel ", "")
        .replaceAll(" Tel. ", "")
        .replaceAll("Mobil", "")
        .replaceAll("Office", "")
        .replaceAll(" e-Posta ", "")
        .replaceAll(" ePosta ", "")
        .replaceAll(" ePostal ", "")
        .replaceAll(" GSM ", "")
        .replaceAll(" GSM. ", "")
        .replaceAll(" F ", "")
        .replaceAll(" F: ", "")
        .replaceAll("-", "")
        .replaceAll("+", "")
        .replaceAll("/", "")
        .replaceAll(":", "")
        .replaceAll(",", "")
        .replaceAll("&", "")
        .replaceAll("0", "")
        .replaceAll("1", "")
        .replaceAll("2", "")
        .replaceAll("3", "")
        .replaceAll("4", "")
        .replaceAll("5", "")
        .replaceAll("6", "")
        .replaceAll("7", "")
        .replaceAll("8", "")
        .replaceAll("9", "");

    if (text.length > 0) {
      _teClientDefinition.text = text.replaceAll("  ", " ");
    }

    print(text);
  }

  String titleCase(str) {
    var splitStr = str.toLowerCase().split(" ");
    for (var i = 0; i < splitStr.length; i++) {
      try {
        splitStr[i] = splitStr[i].subString(0, 1).toUpperCase() +
            splitStr[i].substring(1);
      } catch (e) {}
    }

    var text = splitStr.join(" ");

    return splitStr.join(" ");
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  to(ImageSource imageSource) async {
    var fullText = "";

    try {
      //var file = await ImagePicker.pickImage(source: ImageSource.camera);

      // var cameraDescription = new CameraDescription(
      //     name: "", lensDirection: CameraLensDirection.back);

      // CameraController cameraController =
      //     new CameraController(cameraDescription, ResolutionPreset.high);

      // await cameraController.takePicture("");

      // return;

      var file =
          await ImagePicker.pickImage(source: imageSource, imageQuality: 100);

      if (file != null) {
        setState(() {
          _file = file;
        });
        try {
          var currentLabels = await detector.detectFromPath(_file?.path);

          setState(() {
            var originalText = "";

            // TODO: Eğer iki veya üç kelimelik satır geliyorsa isim olarak değerlendirilecek
            for (var visionText in currentLabels) {
              originalText +=
                  visionText.text.replaceAll("\r", " ").replaceAll("\n", " ");
            }

            debugPrint("originalText: $originalText");

            var count = 1;

            for (VisionTextBlock visionText in currentLabels) {
              var count2 = 1;

              for (VisionTextLine line in visionText.lines) {
                print("$count.inci Satırın $count2. Satırı" + line.text);
                count2++;
              }

              fullText +=
                  (visionText.text.replaceAll("\r", " ").replaceAll("\n", "#")
//                      .replaceAll("Ğ", "G")
//                      .replaceAll("ğ", "g")
//                      .replaceAll("Ü", "U")
//                      .replaceAll("ü", "u")
//                      .replaceAll("Ş", "s")
//                      .replaceAll("ş", "s")
//                      .replaceAll("Ç", "C")
//                      .replaceAll("ç", "c")
//                      .replaceAll("Ö", "O")
//                      .replaceAll("ö", "o")
//                      .replaceAll("ı", "i")
//                      .replaceAll("İ", "I")
                          +
                          " ") +
                      "#";

              count++;
            }
          });
        } catch (e) {
          print("Hata1: " + e.toString());
        }
      }
    } catch (e) {
      print("Hata2: " + e.toString());
    }

    parseData(fullText);
  }

  InputDecoration getPlaceHolder(String placeHolder) {
    return new InputDecoration(
      labelText: placeHolder,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
          style: BorderStyle.solid,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Globals.AppBaseColor,
        ),
      ),
      labelStyle: new TextStyle(
        color: Globals.AppBaseColor,
      ),
    );
  }

  String validateClientDefinition(String value) {
    if (value.isEmpty) {
      return "Cari Unvan Belirtilmelidir.";
    }

    if (value.length > 100) {
      return "Cari Unvan 100 Karakteri Geçmemeli.";
    }

    return "";
  }

  Future<String> validateAddress() async {
    var countryName = turkish.toUpperCase(_teCountry.text);
    var cityName = turkish.toUpperCase(_teCity.text);
    var townName = turkish.toUpperCase(_teTown.text);

    if (countryName.isEmpty) {
      return "Ülke Belirtilmelidir.";
    }

    var counrtyOid =
        await RestHelper.getCountryOid(countryName).then((onValue) => onValue);

    if (counrtyOid.isEmpty) {
      return "Ülke Bulunamadı.";
    }

    _firm.countryOid = counrtyOid;

    if (cityName.isEmpty || townName.isEmpty) {
      return "İl-İlçe Belirtilmelidir.";
    }

    _cities =
        await RestHelper.getCities(countryName).then((onValue) => onValue);

    var crmCityList = _cities.items.where((i) => i.cityName == cityName);

    var crmCity = new CityItems("", "", "", 0);

    if (crmCityList.any((i) => i.cityName == cityName)) {
      crmCity = _cities.items.firstWhere((i) => i.cityName == cityName);
    }

    if (crmCity.oid.isEmpty) {
      return "CRM'de Belirtilen İl Bulunamadı";
    }

    _firm.cityOid = crmCity.oid;

    _towns = await RestHelper.getTowns(crmCity.oid).then((onValue) => onValue);

    var crmTownList = _towns.items.where((i) => i.countyName == townName);

    var crmTown = new TownItems("", "", 0);

    if (crmTownList.any((i) => i.countyName == townName)) {
      crmTown = crmTownList.firstWhere((i) => i.countyName == townName);
    }

    if (crmTown.oid.isEmpty) {
      return "CRM'de Belirtilen İlin " + townName + " İlçesi Bulunamadı.";
    }

    _firm.townOid = crmTown.oid;

    if (_teAddress.text.isEmpty) {
      return "Adres Bilgisi Girilmelidir.";
    }

    return "";
  }

  validateEMail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return "";
  }

  validatePhone(String value) {
    value = value.replaceAll(" ", "");

    Pattern pattern = r"^(?:[+0]9)?[0-9]{10}$";

    RegExp regex = new RegExp(pattern);

    if (regex.hasMatch(value)) {
      return "";
    }

    pattern = r"^([0-9]{7})";

    regex = new RegExp(pattern);

    if (regex.hasMatch(value)) {
      return "";
    }

    return 'Geçerli Bir Telefon Numarası Giriniz.';
  }

  Future<bool> validateFields() async {
    _firm = getFirm();

    var result = validateClientDefinition(_teClientDefinition.text);

    if (result.isNotEmpty) {
      showError(result);
      return false;
    }

    result = await validateAddress().then((onValue) => onValue);

    if (result.isNotEmpty) {
      showError(result);
      return false;
    }

    return true;
  }

  showError(String message) {
    ToastHelper.showToast(message, Toast.LENGTH_LONG, true);
  }

  void goSettingsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsPage()),
    );
  }
}
