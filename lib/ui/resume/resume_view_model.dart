import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'resume_state.dart';

final AutoDisposeStateNotifierProvider<ResumeViewModel, ResumeState>
    resumeViewModelProvider =
    StateNotifierProvider.autoDispose<ResumeViewModel, ResumeState>(
  (Ref<ResumeState> ref) => ResumeViewModel(
    state: const ResumeState.init(),
  ),
);

class ResumeViewModel extends StateNotifier<ResumeState> {
  ResumeViewModel({
    required ResumeState state,
  }) : super(state);

  void onSelectIndex({required int index}) {
    state = state.copyWith(
      selectedIndex: index,
    );
  }
}
