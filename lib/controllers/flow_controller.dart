import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_progress/controllers/flow_state.dart';

final flowControllerProvider =
    StateNotifierProvider<FlowController, FlowState>((ref) {
  return FlowController();
});

class FlowController extends StateNotifier<FlowState> {
  FlowController() : super(FlowState.initial());

  void setBirthday(DateTime birthday) {
    state = state.copyWith(birthDay: birthday);
  }

  void setAge(int expectedAge) {
    state = state.copyWith(expectedAge: expectedAge);
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
