import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'shared_preferences_provider.g.dart';
// final sharedPreferencesProvider =
//     FutureProvider<SharedPreferences>((ref) async {
//   return await SharedPreferences.getInstance();
// });

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferences(SharedPreferencesRef ref) {
  return SharedPreferences.getInstance();
}
