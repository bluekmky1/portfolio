import 'package:flutter/material.dart';

import '../clipper/irregular_rect_clipper.dart';

class IrregularSquareWidget extends StatelessWidget {
  const IrregularSquareWidget({
    required this.randomInt,
    required this.randomColor,
    super.key,
  });

  final int randomInt;
  final Color randomColor;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: ClipPath(
          clipper: IrregularRectClipper(
            arcRoundness: 14,
            anomaly: 1.17,
            isLeftTopSideStick: randomInt % 4 == 0,
            isLeftBottomSideStick: randomInt % 4 == 1,
            isRightTopSideStick: randomInt % 4 == 2,
            isRightBottomSideStick: randomInt % 4 == 3,
          ),
          child: Container(
            color: randomColor,
            width: 320 - 40, // width - padding
            height: (320 - 40) * 0.55,
            // width - padding * 0.55 (가로길이와의 비율을 지키기 위함 )
          ),
        ),
      );
}
