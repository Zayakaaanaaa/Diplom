import 'package:shared_preferences/shared_preferences.dart';

class EmployeePreferences {
  static late SharedPreferences _preferences;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setEmployee(String userId) async {
    await _preferences.setString('userId', userId);
  }

  static String? getEmployee() {
    return _preferences.getString('userId');
  }

  static Future setEmployeeStore(String storeName) async {
    await _preferences.setString('storeName', storeName);
  }

  static String? getEmployeeStore() {
    return _preferences.getString('storeName');
  }

  static Future clearEmployee() async {
    await _preferences.remove('userId');
  }
}
