import 'dart:math';

import 'package:flutter/material.dart';

class IrregularRectClipper extends CustomClipper<Path> {
  final double arcRoundness;

  /// 꼭짓점이 랜덤하게 이동하는 정도의 역수 (1~무제한)
  /// 값이 작을수록 꼭짓점 이동 폭이 커져 더 불규칙한 모양이 생성되고,
  /// 값이 클수록 이동 폭이 줄어 원래 사각형에 가까운 안정적인 모양이 됨
  final double anomaly;
  final bool isLeftTopSideStick;
  final bool isRightTopSideStick;
  final bool isLeftBottomSideStick;
  final bool isRightBottomSideStick;

  IrregularRectClipper({
    required this.arcRoundness,
    required this.anomaly,
    this.isLeftTopSideStick = false,
    this.isRightTopSideStick = false,
    this.isLeftBottomSideStick = false,
    this.isRightBottomSideStick = false,
  });

  double offsetsDistance(Offset o1, Offset o2) => sqrt(
        pow(o1.dx - o2.dx, 2) + pow(o1.dy - o2.dy, 2),
      );

  Offset getInternalConflictOffset({
    required Offset short,
    required Offset long,
    required double distance,
  }) =>
      Offset(
        (arcRoundness * long.dx + (distance - arcRoundness) * short.dx) /
            distance,
        (arcRoundness * long.dy + (distance - arcRoundness) * short.dy) /
            distance,
      );

  @override
  Path getClip(Size size) {
    if (anomaly < 1) {
      throw Error();
    }

    // 꼭짓점
    Offset topLeft = Offset.zero;
    Offset topRight = Offset(size.width, 0);
    Offset bottomLeft = Offset(0, size.height);
    Offset bottomRight = Offset(size.width, size.height);

    if (isLeftTopSideStick) {
      bottomRight = Offset(
        bottomRight.dx - Random().nextDouble() * (size.width / anomaly),
        bottomRight.dy - Random().nextDouble() * (size.height / anomaly),
      );

      topRight = Offset(
        topRight.dx - Random().nextDouble() * (size.width / anomaly),
        topRight.dy,
      );
    }

    if (isLeftBottomSideStick) {
      topRight = Offset(
        topRight.dx - Random().nextDouble() * (size.width / anomaly),
        topRight.dy + Random().nextDouble() * (size.height / anomaly),
      );
      bottomRight = Offset(
        bottomRight.dx - Random().nextDouble() * (size.width / anomaly),
        bottomRight.dy,
      );
    }

    if (isRightTopSideStick) {
      bottomLeft = Offset(
        bottomLeft.dx + Random().nextDouble() * (size.width / anomaly),
        bottomLeft.dy - Random().nextDouble() * (size.height / anomaly),
      );
      topLeft = Offset(
        topLeft.dx + Random().nextDouble() * (size.width / anomaly),
        topLeft.dy,
      );
    }

    if (isRightBottomSideStick) {
      topLeft = Offset(
        topLeft.dx + Random().nextDouble() * (size.width / anomaly),
        topLeft.dy + Random().nextDouble() * (size.height / anomaly),
      );
      bottomLeft = Offset(
        bottomLeft.dx + Random().nextDouble() * (size.width / anomaly),
        bottomLeft.dy,
      );
    }

    // 꼭짓점 사이의 거리
    final double topLeftToBottomLeftDistance = offsetsDistance(
      topLeft,
      bottomLeft,
    );
    final double topLeftToTopRightDistance = offsetsDistance(
      topLeft,
      topRight,
    );
    final double bottomLeftToBottomRightDistance = offsetsDistance(
      bottomLeft,
      bottomRight,
    );
    final double bottomRightToTopRightDistance = offsetsDistance(
      bottomRight,
      topRight,
    );

    // 내분점
    // 왼쪽 모서리의 위쪽 점
    final Offset internalConflict_1 = getInternalConflictOffset(
      short: topLeft,
      long: bottomLeft,
      distance: topLeftToBottomLeftDistance,
    );
    // 왼쪽 모서리의 아래쪽 점
    final Offset internalConflict_2 = getInternalConflictOffset(
      short: bottomLeft,
      long: topLeft,
      distance: topLeftToBottomLeftDistance,
    );
    // 아래쪽 모서리의 왼쪽 점
    final Offset internalConflict_3 = getInternalConflictOffset(
      short: bottomLeft,
      long: bottomRight,
      distance: bottomLeftToBottomRightDistance,
    );
    // 아래쪽 모서리의 오른쪽 점
    final Offset internalConflict_4 = getInternalConflictOffset(
      short: bottomRight,
      long: bottomLeft,
      distance: bottomLeftToBottomRightDistance,
    );
    // 오른쪽 모서리의 아래쪽 점
    final Offset internalConflict_5 = getInternalConflictOffset(
      short: bottomRight,
      long: topRight,
      distance: bottomRightToTopRightDistance,
    );
    // 오른쪽 모서리의 위쪽 점
    final Offset internalConflict_6 = getInternalConflictOffset(
      short: topRight,
      long: bottomRight,
      distance: bottomRightToTopRightDistance,
    );
    // 위쪽 모서리의 오른쪽 점
    final Offset internalConflict_7 = getInternalConflictOffset(
      short: topRight,
      long: topLeft,
      distance: topLeftToTopRightDistance,
    );
    // 위쪽 모서리의 왼쪽 점
    final Offset internalConflict_8 = getInternalConflictOffset(
      short: topLeft,
      long: topRight,
      distance: topLeftToTopRightDistance,
    );

    final Path path = Path()
      ..moveTo(
        internalConflict_1.dx,
        internalConflict_1.dy,
      )
      ..lineTo(
        internalConflict_2.dx,
        internalConflict_2.dy,
      )
      ..quadraticBezierTo(
        bottomLeft.dx,
        bottomLeft.dy,
        internalConflict_3.dx,
        internalConflict_3.dy,
      )
      ..lineTo(
        internalConflict_4.dx,
        internalConflict_4.dy,
      )
      ..quadraticBezierTo(
        bottomRight.dx,
        bottomRight.dy,
        internalConflict_5.dx,
        internalConflict_5.dy,
      )
      ..lineTo(
        internalConflict_6.dx,
        internalConflict_6.dy,
      )
      ..quadraticBezierTo(
        topRight.dx,
        topRight.dy,
        internalConflict_7.dx,
        internalConflict_7.dy,
      )
      ..lineTo(
        internalConflict_8.dx,
        internalConflict_8.dy,
      )
      ..quadraticBezierTo(
        topLeft.dx,
        topLeft.dy,
        internalConflict_1.dx,
        internalConflict_1.dy,
      );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
