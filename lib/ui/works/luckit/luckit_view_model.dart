import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/loading_status.dart';
import '../../common/const/mock/mock_data.dart';
import 'luckit_state.dart';

final AutoDisposeStateNotifierProvider<LuckitViewModel, LuckitState>
    luckitViewModelProvider =
    StateNotifierProvider.autoDispose<LuckitViewModel, LuckitState>(
  (Ref<LuckitState> ref) => LuckitViewModel(
    state: const LuckitState.init(),
  ),
);

class LuckitViewModel extends StateNotifier<LuckitState> {
  LuckitViewModel({
    required LuckitState state,
  }) : super(state);

  void onHoverAppIcon({required String image}) {
    state = state.copyWith(
      image: image,
    );
  }

  Future<void> getFortune() async {
    state = state.copyWith(
      currentMessageIndex: 0,
      loadingStatus: LoadingStatus.loading,
      fortuneScore: 30 + math.Random().nextInt(71), // 30~100 사이의 랜덤 점수
    );
    Future<void>.delayed(
      const Duration(seconds: 14),
      () {
        state = state.copyWith(
          loadingStatus: LoadingStatus.success,
        );
      },
    );
  }

  void changeCurrentMessageIndex() {
    state = state.copyWith(
      currentMessageIndex:
          (state.currentMessageIndex + 1) % MockData.loadingMessages.length,
    );
  }
}
