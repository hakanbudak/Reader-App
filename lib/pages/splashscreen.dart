import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:netline_cardvisit_reader/helpers/resthelper.dart';
import 'package:netline_cardvisit_reader/helpers/toasthelper.dart';
import 'package:netline_cardvisit_reader/models/crmloginresult.dart';
import 'package:netline_cardvisit_reader/pages/myvisiontext.dart';

import '../globals.dart';
import '../localizations.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  CrmLoginResult _crmLoginResult;

  @override
  void initState() {
    super.initState();

    /// Initialize data, then navigator to Home screen.
    initData().then((value) {
      navigateToHomeScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    var localization = new DemoLocalizations(Localizations.localeOf(context));

    return Scaffold(
      backgroundColor: Globals.AppBaseReverseColor,
      body: Center(
        child: new Column(
          children: <Widget>[
            new Image.asset(
              "assets/images/netline.png",
              width: 240,
            ),
            new Text(
              "Netline Bilgi İşlem",
              style: new TextStyle(color: Globals.AppBaseColor, fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 96),
              child: new Text(
                localization.pleaseWaitWhileReadingCrmData,
                style: new TextStyle(color: Globals.AppBaseColor),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// NEW CODE.
  /// We can do long run task here.
  /// In this example, we just simply delay 3 seconds, nothing complicated.
  Future initData() async {
    _crmLoginResult = await RestHelper.loginToRest();

    if (_crmLoginResult.sessionId.isEmpty) {
      ToastHelper.showToast(
          "Bağlantı Kurulamadı. Lütfen Ayarlarınızı Kontrol Ediniz..",
          Toast.LENGTH_LONG,
          true);
    } else {
      ToastHelper.showToast(
          "CRM Bağlantısı Kuruldu.",
          Toast.LENGTH_SHORT,
          false);
    }

    await Future.delayed(Duration(seconds: 2));
  }

  /// NEW CODE.
  /// Navigate to Home screen.
  void navigateToHomeScreen() {
    /// Push home screen and replace (close/exit) splash screen.
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                new MyVisionText(crmLoginResult: _crmLoginResult)));
  }
}
