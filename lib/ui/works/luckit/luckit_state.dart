import 'package:equatable/equatable.dart';

import '../../../core/loading_status.dart';

class LuckitState extends Equatable {
  final LoadingStatus loadingStatus;
  final int currentMessageIndex;
  final int fortuneScore;

  final String image;

  const LuckitState({
    required this.loadingStatus,
    required this.currentMessageIndex,
    required this.fortuneScore,
    required this.image,
  });

  const LuckitState.init()
      : loadingStatus = LoadingStatus.none,
        currentMessageIndex = 0,
        fortuneScore = 0,
        image = '';

  LuckitState copyWith({
    LoadingStatus? loadingStatus,
    int? currentMessageIndex,
    int? fortuneScore,
    String? image,
  }) =>
      LuckitState(
        loadingStatus: loadingStatus ?? this.loadingStatus,
        currentMessageIndex: currentMessageIndex ?? this.currentMessageIndex,
        fortuneScore: fortuneScore ?? this.fortuneScore,
        image: image ?? this.image,
      );

  @override
  List<Object> get props => <Object>[
        loadingStatus,
        currentMessageIndex,
        image,
        fortuneScore,
      ];
}
