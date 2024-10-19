import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_progress/routes/routes_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'storage_service.dart';
part 'app_flow_state.g.dart';

@Riverpod(keepAlive: true)
class AppFlowState extends _$AppFlowState {
  @override
  RouteStates build() {
    final isCompleteWelcome =
        ref.watch(storageServiceProvider).getCompleteWelcome();
    if (isCompleteWelcome) {
      return RouteStates.home;
    } else {
      return RouteStates.setup;
    }
  }

  Future<void> completeWelcome(DateTime birthDay, int expectedAge) async {
    final storageService = ref.read(storageServiceProvider);
    await storageService.setBirthDay(birthDay);
    await storageService.setAge(expectedAge);
    await storageService.setCompleteWelcome(true);

    /// invalidate this provider to get the new value of the complete state.
    ref.invalidateSelf();
  }
}
