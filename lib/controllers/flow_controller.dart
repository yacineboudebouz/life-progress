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

  get weeksInLife => state.expectedAge * 52;
}
