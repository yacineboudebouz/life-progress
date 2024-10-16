import 'package:life_progress/providers/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum StorageKeys { age, lifeExpectation, birthDay }

final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageService(ref.watch(sharedPreferencesProvider).requireValue);
});

class StorageService {
  final SharedPreferences _prefs;

  StorageService(this._prefs);

  int getAge() {
    return _prefs.getInt(StorageKeys.age.name) ?? 0;
  }

  int getLifeExpectation() {
    return _prefs.getInt(StorageKeys.lifeExpectation.name) ?? 0;
  }

  DateTime getBirthDay() {
    final birthDay = _prefs.getString(StorageKeys.birthDay.name) ??
        DateTime.now().toString();
    return DateTime.parse(birthDay);
  }

  Future<void> setAge(int age) async {
    await _prefs.setInt(StorageKeys.age.name, age);
  }

  Future<void> setLifeExpectation(int lifeExpectation) async {
    await _prefs.setInt(StorageKeys.lifeExpectation.name, lifeExpectation);
  }

  Future<void> setBirthDay(DateTime birthDay) async {
    await _prefs.setString(StorageKeys.birthDay.name, birthDay.toString());
  }
}
