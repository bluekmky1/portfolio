import 'package:equatable/equatable.dart';

import '../common/const/mock/mock_data.dart';

class ResumeState extends Equatable {
  final int selectedIndex;
  final List<Map<String, dynamic>> resumeSections;

  const ResumeState({
    required this.selectedIndex,
    required this.resumeSections,
  });

  const ResumeState.init()
      : selectedIndex = 0,
        resumeSections = MockData.resumeSections;

  ResumeState copyWith({
    int? selectedIndex,
    List<Map<String, dynamic>>? resumeSections,
  }) =>
      ResumeState(
        selectedIndex: selectedIndex ?? this.selectedIndex,
        resumeSections: resumeSections ?? this.resumeSections,
      );

  @override
  List<Object> get props => <Object>[
        selectedIndex,
        resumeSections,
      ];
}
