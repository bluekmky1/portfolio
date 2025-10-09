import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_state.dart';

final AutoDisposeStateNotifierProvider<HomeViewModel, HomeState>
    homeViewModelProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, HomeState>(
  (Ref<HomeState> ref) => HomeViewModel(
    state: HomeState.init(),
  ),
);

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel({
    required HomeState state,
  }) : super(state);

  void onHoverAppIcon({required int index}) {
    state = state.copyWith(
      selectedAppIndex: index,
    );
  }

  void setOpacity({required double opacity}) {
    state = state.copyWith(
      opacity: opacity,
    );
  }

  void setCurrentTitle({required String title}) {
    state = state.copyWith(
      currentTitle: title,
    );
  }

  void setCurrentExplain({required String explain}) {
    state = state.copyWith(
      currentExplain: explain,
    );
  }
}
