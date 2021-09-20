import 'package:flutter/material.dart';
import 'package:netline_cardvisit_reader/pages/optionalpage.dart';

import 'package:netline_cardvisit_reader/pages/myvisiontext.dart';
import 'package:netline_cardvisit_reader/pages/settingspage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Map<int, Color> color = {
    50: Color.fromRGBO(13, 145, 108, .1),
    100: Color.fromRGBO(13, 145, 108, .2),
    200: Color.fromRGBO(13, 145, 108, .3),
    300: Color.fromRGBO(13, 145, 108, .4),
    400: Color.fromRGBO(13, 145, 108, .5),
    500: Color.fromRGBO(13, 145, 108, .6),
    600: Color.fromRGBO(13, 145, 108, .7),
    700: Color.fromRGBO(13, 145, 108, .8),
    800: Color.fromRGBO(13, 145, 108, .9),
    900: Color.fromRGBO(13, 145, 108, 1),
  };

  @override
  Widget build(BuildContext context) {
    // Locale myLocale = Localizations.localeOf(context);

    // var langCode = myLocale.languageCode;
    // var countryCode = myLocale.countryCode;

    return MaterialApp(
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('tr'),
      ],
      title: 'Netline Kartvizit Okuyucu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF0d916c, color),
        primaryColor: MaterialColor(0xFF0d916c, color),
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => new OptionalPage(),
        '/visiontext': (context) => MyVisionText(crmLoginResult: null),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}
