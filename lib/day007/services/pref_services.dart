import 'package:shared_preferences/shared_preferences.dart';

abstract class PrefServices {
  static SharedPreferences? pref;

  static Future<void> init() async {
    try {
      pref = await SharedPreferences.getInstance();
      print("successful shared preferences");
    } catch (e) {
      print("Failed to initialize shared preferences: $e");
    }
  }

  static bool get isOnBoardingSeen =>
      pref!.getBool("isOnBoardingSeen") ?? false;

  static set isOnBoardingSeen(bool value) =>
      pref!.setBool("isOnBoardingSeen", value);
}
