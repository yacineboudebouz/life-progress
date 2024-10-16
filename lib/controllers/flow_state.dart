// ignore_for_file: public_member_api_docs, sort_constructors_first
class FlowState {
  final DateTime birthDay;
  final int expectedAge;
  FlowState({
    required this.birthDay,
    required this.expectedAge,
  });

  FlowState copyWith({
    DateTime? birthDay,
    int? expectedAge,
  }) {
    return FlowState(
      birthDay: birthDay ?? this.birthDay,
      expectedAge: expectedAge ?? this.expectedAge,
    );
  }

  factory FlowState.initial() {
    return FlowState(
      birthDay: DateTime.now(),
      expectedAge: 0,
    );
  }
}