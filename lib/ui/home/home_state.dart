import 'package:equatable/equatable.dart';

import '../common/const/mock/mock_data.dart';
import '../common/const/mock/mock_model.dart';

class HomeState extends Equatable {
  final List<AppIconModel> appIcons;
  final int selectedAppIndex;
  final String currentTitle;
  final String currentExplain;
  final double opacity;

  const HomeState({
    required this.selectedAppIndex,
    required this.appIcons,
    required this.currentTitle,
    required this.currentExplain,
    required this.opacity,
  });

  HomeState.init()
      : appIcons = MockData.appIcons,
        selectedAppIndex = 0,
        currentTitle = MockData.appIcons.first.title,
        currentExplain = MockData.appIcons.first.explain,
        opacity = 1.0;

  HomeState copyWith({
    int? selectedAppIndex,
    List<AppIconModel>? appIcons,
    String? currentTitle,
    String? currentExplain,
    double? opacity,
  }) =>
      HomeState(
        selectedAppIndex: selectedAppIndex ?? this.selectedAppIndex,
        appIcons: appIcons ?? this.appIcons,
        currentTitle: currentTitle ?? this.currentTitle,
        currentExplain: currentExplain ?? this.currentExplain,
        opacity: opacity ?? this.opacity,
      );

  @override
  List<Object> get props => <Object>[
        selectedAppIndex,
        appIcons,
        currentTitle,
        currentExplain,
        opacity,
      ];

  AppIconModel get selectedAppIcon => appIcons[selectedAppIndex];
}
