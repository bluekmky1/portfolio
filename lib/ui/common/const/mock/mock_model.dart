import 'package:equatable/equatable.dart';

class AppIconModel extends Equatable {
  final String id;
  final String title;
  final String explain;
  final String image;
  final String route;

  const AppIconModel({
    required this.id,
    required this.title,
    required this.explain,
    required this.image,
    required this.route,
  });

  @override
  List<Object> get props => <Object>[
        id,
        title,
        explain,
        image,
        route,
      ];
}

class ResumeTileModel extends Equatable {
  final String title;
  final String value;
  final String? subValue;

  const ResumeTileModel({
    required this.title,
    required this.value,
    this.subValue,
  });

  @override
  List<Object> get props => <Object>[
        title,
        value,
        subValue ?? '',
      ];
}

class SearchExplainModel extends Equatable {
  final String title;
  final String explain;

  const SearchExplainModel({
    required this.title,
    required this.explain,
  });

  @override
  List<Object> get props => <Object>[
        title,
        explain,
      ];
}

class LuckitExplainModel extends Equatable {
  final String title;
  final String explain;

  const LuckitExplainModel({
    required this.title,
    required this.explain,
  });

  @override
  List<Object> get props => <Object>[
        title,
        explain,
      ];
}

class GyeonExplainModel extends Equatable {
  final String title;
  final String explain;

  const GyeonExplainModel({
    required this.title,
    required this.explain,
  });

  @override
  List<Object> get props => <Object>[
        title,
        explain,
      ];
}

class GyeonSectionExplainModel extends Equatable {
  final String id;
  final String tag;
  final String title;
  final String subTitle;
  final List<String> explains;

  const GyeonSectionExplainModel({
    required this.id,
    required this.tag,
    required this.title,
    required this.subTitle,
    required this.explains,
  });

  @override
  List<Object> get props => <Object>[
        id,
        tag,
        title,
        subTitle,
        explains,
      ];
}
