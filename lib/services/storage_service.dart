import 'package:life_progress/providers/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'storage_service.g.dart';

enum StorageKeys { age, lifeExpectation, birthDay, theme, completeWelcome }

// final storageServiceProvider = Provider<StorageService>((ref) {
//   return StorageService(ref.watch(sharedPreferencesProvider).requireValue);
// });

@Riverpod(keepAlive: true)
StorageService storageService(StorageServiceRef ref) {
  final prefs = ref.watch(sharedPreferencesProvider).requireValue;
  return StorageService(prefs);
}

class StorageService {
  final SharedPreferences _prefs;

  StorageService(this._prefs);

  int getAge() {
    return _prefs.getInt(StorageKeys.age.name) ?? 18;
  }

  int getLifeExpectation() {
    return _prefs.getInt(StorageKeys.lifeExpectation.name) ?? 0;
  }

  DateTime getBirthDay() {
    final birthDay = _prefs.getString(StorageKeys.birthDay.name) ??
        DateTime.now().toString();
    return DateTime.parse(birthDay);
  }

  bool getTheme() {
    return _prefs.getBool(StorageKeys.theme.name) ?? false;
  }

  bool getCompleteWelcome() {
    return _prefs.getBool(StorageKeys.completeWelcome.name) ?? false;
  }

  Future<void> setTheme(bool isDark) async {
    await _prefs.setBool(StorageKeys.theme.name, isDark);
  }

  Future<void> setAge(int age) async {
    await _prefs.setInt(StorageKeys.age.name, age);
  }

  Future<void> setLifeExpectation(int lifeExpectation) async {
    await _prefs.setInt(StorageKeys.lifeExpectation.name, lifeExpectation);
  }

  Future<void> setBirthDay(DateTime birthDay) async {
    _prefs.setString(StorageKeys.birthDay.name, birthDay.toString());
  }

  Future<void> setCompleteWelcome(bool completeWelcome) async {
    await _prefs.setBool(StorageKeys.completeWelcome.name, completeWelcome);
  }
}
