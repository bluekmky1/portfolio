import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/loading_status.dart';
import '../../../common/const/gyeon/menu_list.dart';
import '../../../common/const/mock/mock_data.dart';
import '../../../common/const/mock/mock_model.dart';
import 'detail_state.dart';
import 'widgets/detail_page_list.dart';

final AutoDisposeStateNotifierProvider<GyeonDetailViewModel, GyeonDetailState>
    gyeonDetailViewModelProvider =
    StateNotifierProvider.autoDispose<GyeonDetailViewModel, GyeonDetailState>(
  (Ref<GyeonDetailState> ref) => GyeonDetailViewModel(
    state: GyeonDetailState.init(),
  ),
);

class GyeonDetailViewModel extends StateNotifier<GyeonDetailState> {
  GyeonDetailViewModel({
    required GyeonDetailState state,
  }) : super(state);

  void onInit({required String id}) {
    final GyeonSectionExplainModel model = MockData.gyeonSectionExplainModels
        .firstWhere((GyeonSectionExplainModel element) => element.id == id);

    final bool isLast = int.parse(id) >= pageList.length;
    state = state.copyWith(
      title: model.title,
      explains: model.explains,
      explainWidgetList:
          isLast ? const SizedBox.shrink() : pageList[int.parse(id)],
    );
  }

  Future<void> selectTodayMenu() async {
    if (state.selectingMenuLoadingStatus == LoadingStatus.loading) {
      return;
    }

    state = state.copyWith(
      selectingMenuLoadingStatus: LoadingStatus.loading,
    );

    // 초기 빠른 회전 (더 빠르게)
    for (int i = 0; i < 20; i++) {
      state = state.copyWith(
        selectedMenuTitle: foodMenuList[Random().nextInt(foodMenuList.length)],
      );
      await Future<void>.delayed(const Duration(milliseconds: 40));
    }

    // 점점 느려지는 회전
    for (int i = 0; i < 5; i++) {
      state = state.copyWith(
        selectedMenuTitle: foodMenuList[Random().nextInt(foodMenuList.length)],
      );
      await Future<void>.delayed(Duration(milliseconds: 120 + (i * 40)));
    }
    // 잠시 대기 후 최종 선택
    await Future<void>.delayed(const Duration(milliseconds: 100));

    // 마지막 선택
    final String finalMenu =
        foodMenuList[Random().nextInt(foodMenuList.length)];

    state = state.copyWith(
      selectedMenuTitle: finalMenu,
      selectingMenuLoadingStatus: LoadingStatus.success,
      isfirstSelect: false,
    );

    await Future<void>.delayed(const Duration(milliseconds: 900));

    state = state.copyWith(
      selectingMenuLoadingStatus: LoadingStatus.none,
    );
  }
}
