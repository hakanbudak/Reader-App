import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:netline_cardvisit_reader/helpers/firestoreHelper.dart';
import 'package:netline_cardvisit_reader/helpers/sharedPreferencesHelper.dart';
import 'package:netline_cardvisit_reader/helpers/toasthelper.dart';

import '../globals.dart';
import '../localizations.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    getSettings();

    return new _SettingsPageState();
  }
}

TextEditingController _teCrmUrl = new TextEditingController();
TextEditingController _teCrmUserName = new TextEditingController();
TextEditingController _teCrmUserPassword = new TextEditingController();
TextEditingController _teCellPhoneTypeName = new TextEditingController();
TextEditingController _teWorkPhoneTypeName = new TextEditingController();
TextEditingController _teFaxPhoneTypeName = new TextEditingController();
TextEditingController _teAddressType = new TextEditingController();
TextEditingController _teLicenceKey = new TextEditingController();

DemoLocalizations localization;

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    localization = new DemoLocalizations(Localizations.localeOf(context));

    return new Scaffold(
      appBar: new AppBar(
        title: Text(
          localization.title,
          style: new TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 0,
        leading: new Image.asset(
          "assets/images/netline.png",
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.cancel,
              color: Globals.AppBaseReverseColor,
            ),
            title: Text(
              "",
              style: TextStyle(
                color: Globals.AppBaseReverseColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.save,
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
        currentIndex: 0,
        selectedItemColor: Globals.AppBaseReverseColor,
        backgroundColor: Globals.AppBaseColor,
        onTap: _onItemTapped,
      ),
      body: SingleChildScrollView(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            getField(
              _teCrmUrl,
              localization.crmUrl,
              validateCrmUrl,
              false,
            ),
            getField(
              _teCrmUserName,
              localization.crmUserName,
              validateCrmUrl,
              false,
            ),
            getField(
              _teCellPhoneTypeName,
              localization.cellPhoneTypeName,
              validateCellPhoneTypeName,
              false,
            ),
            getField(
              _teWorkPhoneTypeName,
              localization.workPhoneTypeName,
              validateWorkPhoneTypeName,
              false,
            ),
            getField(
              _teFaxPhoneTypeName,
              localization.faxPhoneTypeName,
              validateFaxPhoneTypeName,
              false,
            ),
            getField(
              _teAddressType,
              localization.crmAddressType,
              validateAddressTypeName,
              false,
            ),
            getField(
              _teCrmUserPassword,
              localization.crmUserPassword,
              validateCrmUserPassword,
              true,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: new TextFormField(
                      controller: _teLicenceKey,
                      cursorColor: Globals.AppBaseColor,
                      decoration: getPlaceHolder(localization.licenceKey),
                      validator: (value) {
                        return "";
                      },
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: FlatButton(
                        color: Globals.AppBaseColor,
                        focusColor: Globals.AppBaseReverseColor,
                        splashColor: Globals.AppBaseThirdColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.vpn_key,
                              color: Globals.AppBaseReverseColor,
                            ),
                            Text(
                              " ${localization.licence}",
                              style: TextStyle(
                                color: Globals.AppBaseReverseColor,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () async {
                          await SharedPreferencesHelper.saveSettings(
                              _teLicenceKey.text);
                          getSettings();
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) async {
    setState(() {
      if (index == 0) {
        Navigator.pop(context);
      } else if (index == 1) {
        var validateResult = controlInputs();

        if (validateResult == "") {
          FirestoreHelper.saveSettings(
            _teCrmUserName.text,
            _teCrmUserPassword.text,
            _teCrmUrl.text,
            _teCellPhoneTypeName.text,
            _teWorkPhoneTypeName.text,
            _teFaxPhoneTypeName.text,
            _teAddressType.text,
            _teLicenceKey.text,
          ).then((onValue) {
            Navigator.pop(context);
          }).catchError((onError) {
            Navigator.pop(context);
          });

          SharedPreferencesHelper.saveSettings(
            _teLicenceKey.text,
          );
        } else {
          ToastHelper.showToast(
            validateResult,
            Toast.LENGTH_LONG,
            true,
          );
        }
      }
    });
  }

  String validateCrmUrl(String value) {
    if (value.isEmpty) {
      return localization.urlMustBeEntered;
    }
    return "";
  }

  String validatePhoneTypeName(String value) {
    if (value.isEmpty) {
      return localization.phoneTypeMustBeEntered;
    }

    return "";
  }

  String validateCellPhoneTypeName(String value) {
    if (value.isEmpty) {
      return localization.cellPhoneTypeMustBeEntered;
    }

    return "";
  }

  String validateWorkPhoneTypeName(String value) {
    if (value.isEmpty) {
      return localization.workPhoneTypeMustBeEntered;
    }

    return "";
  }

  String validateFaxPhoneTypeName(String value) {
    if (value.isEmpty) {
      return localization.faxPhoneTypeMustBeEntered;
    }

    return "";
  }

  String validateCrmUserName(String value) {
    if (value.isEmpty) {
      return localization.usernameMustBeEntered;
    }

    return "";
  }

  String validateCrmUserPassword(String value) {
    if (value.isEmpty) {
      return localization.passwordMustBeEntered;
    }

    return "";
  }

  String validateAddressTypeName(String value) {
    if (value.isEmpty) {
      return localization.addressTypeMustBeEntered;
    }

    return "";
  }

  String validateLicenceKey(String value) {
    if (value.isEmpty) {
      return localization.licenceKeyMustBeEntered;
    }

    return "";
  }

  String controlInputs() {
    return "";

    var validateCrmUrlResult = validateCrmUrl(
      _teCrmUrl.text,
    );
    var validateCrmUserNameResult = validateCrmUserName(
      _teCrmUserName.text,
    );
    var validateCrmUserPasswordResult = validateCrmUserPassword(
      _teCrmUserPassword.text,
    );

    var validateAddressTypeResult =
        validateAddressTypeName(_teAddressType.text);

    var validateLicenceKeyResult = validateLicenceKey(_teLicenceKey.text);

    var validateCellPhoneType =
        validateCellPhoneTypeName(_teCellPhoneTypeName.text);

    var validateWorkPhoneType =
        validateWorkPhoneTypeName(_teWorkPhoneTypeName.text);

    var validateFaxPhoneType =
        validateFaxPhoneTypeName(_teFaxPhoneTypeName.text);

    if (validateCrmUrlResult != "") {
      return validateCrmUrlResult;
    }
    if (validateCrmUserNameResult != "") {
      return validateCrmUserNameResult;
    }
    if (validateCrmUserPasswordResult != "") {
      return validateCrmUserPasswordResult;
    }
    if (validateCellPhoneType != "") {
      return validateCellPhoneType;
    }
    if (validateWorkPhoneType != "") {
      return validateWorkPhoneType;
    }
    if (validateFaxPhoneType != "") {
      return validateFaxPhoneType;
    }
    if (validateAddressTypeResult != "") {
      return validateAddressTypeResult;
    }
    if (validateLicenceKeyResult != "") {
      return validateLicenceKeyResult;
    }

    return "";
  }
}

Padding getField(TextEditingController controller, String placeHolder,
    Function function, bool isPassword) {
  return new Padding(
    padding: const EdgeInsets.all(8.0),
    child: new TextFormField(
      controller: controller,
      cursorColor: Globals.AppBaseColor,
      decoration: getPlaceHolder(placeHolder),
      validator: (value) {
        return function(value);
      },
      maxLines: 1,
      keyboardType: TextInputType.text,
      obscureText: isPassword,
    ),
  );
}

getSettings() async {
  var googleSettings = await FirestoreHelper.getSettings();

  _teCrmUrl.text = googleSettings.url;
  _teCrmUserName.text = googleSettings.username;
  _teCrmUserPassword.text = googleSettings.password;
  _teCellPhoneTypeName.text = googleSettings.cellPhoneTypeName;
  _teWorkPhoneTypeName.text = googleSettings.workPhoneTypeName;
  _teFaxPhoneTypeName.text = googleSettings.faxPhoneTypeName;
  _teAddressType.text = googleSettings.addressTypeName;

  var localSettings = await SharedPreferencesHelper.getSettings();
  _teLicenceKey.text = localSettings.licenceKey;
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
