import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{

  static Future<String> getLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("language")?? "en";
  }

  static Future<void> setLang(String lang) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("language", lang);
  }
}




