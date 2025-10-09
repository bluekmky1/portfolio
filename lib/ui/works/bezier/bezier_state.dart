import 'package:equatable/equatable.dart';

class BezierState extends Equatable {
  final String example;

  const BezierState({
    required this.example,
  });

  const BezierState.init() : example = '';

  BezierState copyWith({
    String? example,
  }) =>
      BezierState(
        example: example ?? this.example,
      );

  @override
  List<Object> get props => <Object>[
        example,
      ];
}
