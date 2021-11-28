import 'package:shared_preferences/shared_preferences.dart';

Future<void> clearDataList() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setStringList("listStep1", []);
  prefs.setStringList("listStep2", []);
  prefs.setStringList("listStep3", []);
  prefs.setStringList("listStep4", []);
  prefs.setStringList("listStep5", []);
  prefs.setStringList("listStep6", []);
}
