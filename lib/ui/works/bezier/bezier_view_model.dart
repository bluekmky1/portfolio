import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'bezier_state.dart';

final AutoDisposeStateNotifierProvider<BezierViewModel, BezierState>
    bezierViewModelProvider =
    StateNotifierProvider.autoDispose<BezierViewModel, BezierState>(
  (Ref<BezierState> ref) => BezierViewModel(
    state: const BezierState.init(),
  ),
);

class BezierViewModel extends StateNotifier<BezierState> {
  BezierViewModel({
    required BezierState state,
  }) : super(state);
}
