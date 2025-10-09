import 'package:equatable/equatable.dart';

class GyeonState extends Equatable {
  final String image;

  const GyeonState({
    required this.image,
  });

  const GyeonState.init() : image = '';

  GyeonState copyWith({
    String? image,
  }) =>
      GyeonState(
        image: image ?? this.image,
      );

  @override
  List<Object> get props => <Object>[
        image,
      ];
}
