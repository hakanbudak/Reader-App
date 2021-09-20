import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:netline_cardvisit_reader/helpers/sharedPreferencesHelper.dart';
import 'package:netline_cardvisit_reader/helpers/toasthelper.dart';
import 'package:netline_cardvisit_reader/models/mygooglesettings.dart';

class FirestoreHelper {
  static Firestore _firestore = Firestore.instance;

  static Future<MyGoogleSettings> getSettings() async {
    var settings = new MyGoogleSettings();
    settings.password = "";
    settings.username = "";
    settings.url = "";
    settings.cellPhoneTypeName = "";
    settings.workPhoneTypeName = "";
    settings.faxPhoneTypeName = "";
    settings.addressTypeName = "";

    var localSettings = await SharedPreferencesHelper.getSettings();

    await _firestore
        .collection("settings")
        .document(localSettings.licenceKey)
        .get()
        .then((doc) {
      if (doc.exists) {
        settings.url = doc["url"];
        settings.username = doc["username"];
        settings.password = doc["password"];
        settings.phoneTypeName = doc["phoneTypeName"];
        settings.addressTypeName = doc["addressTypeName"];
        settings.cellPhoneTypeName = doc["cellPhoneTypeName"];
        settings.workPhoneTypeName = doc["workPhoneTypeName"];
        settings.faxPhoneTypeName = doc["faxPhoneTypeName"];
      }
    });

    return settings;
  }

  static saveSettings(
    String userName,
    String userPassword,
    String url,
    String cellPhoneTypeName,
    String workPhoneTypeName,
    String faxPhoneTypeName,
    String addressTypeName,
    String licenceKey,
  ) async {
    await _firestore
        .collection("settings")
        .document(licenceKey)
        .get()
        .then((doc) {
      if (!doc.exists) {
        ToastHelper.showToast(
          "Geçersiz Lisans Anahtarı\nInvalid Licence Key",
          Toast.LENGTH_LONG,
          true,
        );

        return;
      } else {
        Map<String, dynamic> setSettings = Map();

        setSettings["username"] = userName;
        setSettings["password"] = userPassword;
        setSettings["url"] = url;
        setSettings["cellPhoneTypeName"] = cellPhoneTypeName;
        setSettings["workPhoneTypeName"] = workPhoneTypeName;
        setSettings["faxPhoneTypeName"] = faxPhoneTypeName;
        setSettings["addressTypeName"] = addressTypeName;

        _firestore
            .collection("settings")
            .document(licenceKey)
            .setData(setSettings)
            .then((v) {
          ToastHelper.showToast(
            "Ayarlar Güncellendi",
          );
        }).catchError((error) {
          ToastHelper.showToast(
            "Ayarlar Kayıt Edilemedi. " + error.toString(),
            Toast.LENGTH_LONG,
            true,
          );
        });
      }
    });
  }
}
