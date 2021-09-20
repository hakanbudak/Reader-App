import 'package:netline_cardvisit_reader/models/myLocalSettings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static void saveSettings(String licenceKey) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString("licenceKey", licenceKey);
  }

  static Future<MyLocalSettings> getSettings() async {
    final preferences = await SharedPreferences.getInstance();

    var localSettings = new MyLocalSettings();
    localSettings.licenceKey = preferences.getString("licenceKey") ?? "";

    return localSettings;
  }
}
