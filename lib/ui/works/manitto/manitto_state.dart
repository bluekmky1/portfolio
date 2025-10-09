import 'package:equatable/equatable.dart';

class ManittoState extends Equatable {
  final String image;

  const ManittoState({
    required this.image,
  });

  const ManittoState.init() : image = '';

  ManittoState copyWith({
    String? image,
  }) =>
      ManittoState(
        image: image ?? this.image,
      );

  @override
  List<Object> get props => <Object>[
        image,
      ];
}
