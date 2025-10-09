import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'gyeon_state.dart';

final AutoDisposeStateNotifierProvider<GyeonViewModel, GyeonState>
    gyeonViewModelProvider =
    StateNotifierProvider.autoDispose<GyeonViewModel, GyeonState>(
  (Ref<GyeonState> ref) => GyeonViewModel(
    state: const GyeonState.init(),
  ),
);

class GyeonViewModel extends StateNotifier<GyeonState> {
  GyeonViewModel({
    required GyeonState state,
  }) : super(state);

  void onHoverAppIcon({required String image}) {
    state = state.copyWith(
      image: image,
    );
  }
}
