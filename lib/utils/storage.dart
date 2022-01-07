import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static final Storage _singleton = Storage._internal();

  Storage._internal();

  factory Storage() {
    return _singleton;
  }

  SharedPreferences? _preferences;

  Future _setPreferences() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  Future<String?> getElement(String key) async {
    await _setPreferences();
    var res = _preferences!.getString(key);
    return res;
  }

  Future setElement(String key, String value) async {
    await _setPreferences();
    await _preferences!.setString(key, value);
  }

  Future clearElement(String key) async {
    await _setPreferences();
    await _preferences!.remove(key);
  }
}
