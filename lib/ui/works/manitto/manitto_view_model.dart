import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'manitto_state.dart';

final AutoDisposeStateNotifierProvider<ManittoViewModel, ManittoState>
    manittoViewModelProvider =
    StateNotifierProvider.autoDispose<ManittoViewModel, ManittoState>(
  (Ref<ManittoState> ref) => ManittoViewModel(
    state: const ManittoState.init(),
  ),
);

class ManittoViewModel extends StateNotifier<ManittoState> {
  ManittoViewModel({
    required ManittoState state,
  }) : super(state);

  void onHoverAppIcon({required String image}) {
    state = state.copyWith(
      image: image,
    );
  }
}
