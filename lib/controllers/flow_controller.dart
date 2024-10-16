import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_progress/controllers/flow_state.dart';

class FlowController extends StateNotifier<FlowState> {
  FlowController() : super(FlowState.initial());

  set birthday(DateTime birthday) {
    state = state.copyWith(birthDay: birthday);
  }

  set expectedAge(int expectedAge) {
    state = state.copyWith(expectedAge: expectedAge);
  }

  get weeksInLife => state.expectedAge * 52;
}
