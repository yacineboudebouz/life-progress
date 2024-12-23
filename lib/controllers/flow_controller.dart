import 'package:life_progress/controllers/flow_state.dart';
import 'package:life_progress/services/app_flow_state.dart';
import 'package:life_progress/services/storage_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'flow_controller.g.dart';

@Riverpod(keepAlive: true)
class FlowController extends _$FlowController {
  @override
  FlowState build() {
    final storageService = ref.watch(storageServiceProvider);
    return FlowState(
      birthDay: storageService.getBirthDay(),
      expectedAge: storageService.getAge(),
    );
  }

  void setBirthday(DateTime birthday) {
    state = state.copyWith(birthDay: birthday);
    final storage = ref.read(storageServiceProvider);
    storage.setBirthDay(birthday);
  }

  void setAge(int expectedAge) {
    state = state.copyWith(expectedAge: expectedAge);
    final storage = ref.read(storageServiceProvider);
    storage.setAge(expectedAge);
  }

  void completeWelcome() {
    final appFlowState = ref.read(appFlowStateProvider.notifier);
    appFlowState.completeWelcome(state.birthDay, state.expectedAge);
  }

  int get weeksInLife => state.expectedAge * 52;
  int get weeksLived =>
      (DateTime.now().difference(state.birthDay).inDays / 7).round();
  int get remainingWeeks => weeksInLife - weeksLived;

  // get two numbers after the decimal point
  double get percentageLivedWeeks =>
      double.parse((weeksLived / weeksInLife * 100).toStringAsFixed(2));

  // get weeks lived from last birthday
  int get weeksLivedFromLastBirthday =>
      (DateTime.now().difference(state.birthDay).inDays % 365 / 7).round();

  // weeks remaining until next birthday
  int get weeksTilBirthday => 52 - weeksLivedFromLastBirthday;

  // get two numbers after the decimal point of weeks lived from last birthday
  double get percentageLivedWeeksFromLastBirthday =>
      double.parse((weeksLivedFromLastBirthday / 52 * 100).toStringAsFixed(2));
}
