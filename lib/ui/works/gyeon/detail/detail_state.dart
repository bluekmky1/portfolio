import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/loading_status.dart';

class GyeonDetailState extends Equatable {
  // 메뉴 뽑기용 상태
  final LoadingStatus selectingMenuLoadingStatus;
  final String selectedMenuTitle;
  final bool isfirstSelect;

  // 설명 상태
  final Widget explainWidgetList;
  final String title;
  final List<String> explains;

  const GyeonDetailState({
    required this.selectingMenuLoadingStatus,
    required this.selectedMenuTitle,
    required this.explainWidgetList,
    required this.title,
    required this.explains,
    required this.isfirstSelect,
  });

  GyeonDetailState.init()
      : selectingMenuLoadingStatus = LoadingStatus.none,
        selectedMenuTitle = '',
        explainWidgetList = const SizedBox.shrink(),
        title = '',
        explains = <String>[],
        isfirstSelect = true;

  GyeonDetailState copyWith({
    LoadingStatus? selectingMenuLoadingStatus,
    String? selectedMenuTitle,
    Widget? explainWidgetList,
    String? title,
    List<String>? explains,
    bool? isfirstSelect,
  }) =>
      GyeonDetailState(
        selectingMenuLoadingStatus:
            selectingMenuLoadingStatus ?? this.selectingMenuLoadingStatus,
        selectedMenuTitle: selectedMenuTitle ?? this.selectedMenuTitle,
        explainWidgetList: explainWidgetList ?? this.explainWidgetList,
        title: title ?? this.title,
        explains: explains ?? this.explains,
        isfirstSelect: isfirstSelect ?? this.isfirstSelect,
      );

  @override
  List<Object> get props => <Object>[
        selectingMenuLoadingStatus,
        selectedMenuTitle,
        explainWidgetList,
        title,
        explains,
        isfirstSelect,
      ];

  bool get isSelectingMenuLoading =>
      selectingMenuLoadingStatus == LoadingStatus.loading;

  bool get isSelectingMenuLoadingSuccess =>
      selectingMenuLoadingStatus == LoadingStatus.success;

  String get selectingMenuLoadingStatusText =>
      selectingMenuLoadingStatus == LoadingStatus.loading
          ? '뽑는 중...'
          : isfirstSelect
              ? '눌러보세요!'
              : '다시 뽑기';
}
