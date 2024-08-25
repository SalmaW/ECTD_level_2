import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesService {
  static SharedPreferences? prefs;

  static Future<void> init() async {
    try {
      prefs = await SharedPreferences.getInstance();
      print("initialize preferences is Successfully");
    } catch (e) {
      print("Failed to initialize preferences: $e");
    }
  }

  static bool get isOnboardingSeen =>
      prefs!.getBool('isOnboardingSeen') ?? false;

  static set isOnboardingSeen(bool value) =>
      prefs!.setBool('isOnboardingSeen', value);
}
