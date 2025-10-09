import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../theme/app_colors.dart';
import '../../../../theme/app_text_styles.dart';
import '../../../common/const/assets.dart';
import '../../../common/const/mock/mock_data.dart';
import '../bezier_view.dart';

List<Widget> bezierPages = <Widget>[
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Bézier curve\nPractice',
        style: AppTextStyles.textB20.copyWith(
          color: AppColors.bezierText,
          fontSize: 48,
        ),
      ),
      const Spacer(),
      ...List<Widget>.generate(
        MockData.bezierTitleContents.length,
        (int index) => ExplainTileWidget(
          title: MockData.bezierTitleContents[index]['title'] as String,
          explain: MockData.bezierTitleContents[index]['explain'] as String,
        ),
      ),
      Text(
        '디자인 래퍼런스',
        style: AppTextStyles.textB16.copyWith(
          color: AppColors.bezierText,
        ),
      ),
      const SizedBox(height: 4),
      SvgIconButton(
        onTap: () {
          launchUrl(
            Uri.parse(
              'https://dribbble.com/shots/18481472-Guide-App-Real-Estate',
            ),
            mode: LaunchMode.externalNonBrowserApplication,
          );
        },
        asset: Assets.dribbleLogo,
        text: '''"Guide App - Real Estate" By Michael Martinho''',
      ),
    ],
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        '개발 배경',
        style: AppTextStyles.textB20.copyWith(
          color: AppColors.bezierText,
          fontSize: 48,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        '''
  Dribbble에서 본 불규칙한 사각형 디자인을 보고 구현을 시도하게 되었습니다.
    
  처음에는 Flutter의 BorderRadius만으로 모서리를 둥글게 만들 수 있을 것 같았지만, 원하는 형태를 만들 수 없어 고민하던 중 ClipPath위젯과 quadraticBezierTo함수를 활용하여 코드를 작성했습니다.
    
  구현 중 꼭짓점의 둥근 정도와 사각형의 변형 정도 부분에서 수정이 발생할 수 있다고 생각되어 속성으로 (arcRoundness, anomaly) 분리하여 동적으로 조절할 수 있도록 처리했습니다.''',
        style: AppTextStyles.textR16.copyWith(
          color: AppColors.bezierText,
        ),
      ),
    ],
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        '구현 방식',
        style: AppTextStyles.textB20.copyWith(
          color: AppColors.bezierText,
          fontSize: 48,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        '1. 기본 꼭짓점 설정',
        style: AppTextStyles.textB16.copyWith(
          color: AppColors.bezierText,
        ),
      ),
      const SizedBox(height: 4),
      Text(
        '''
width와 height를 기준으로 4개의 모서리 좌표(topLeft, topRight, bottomLeft, bottomRight) 생성
                      ''',
        style: AppTextStyles.textR16.copyWith(
          color: AppColors.bezierText,
        ),
      ),
      const SizedBox(height: 4),
      Text(
        '2. 붙어있을 모서리 처리',
        style: AppTextStyles.textB16.copyWith(
          color: AppColors.bezierText,
        ),
      ),
      Text(
        '''
좌상/우상/좌하/우하 중 2개의 꼭짓점 중 하나는 x축+y축 모두 랜덤 이동시키고, 다른 하나는 x축 또는 y축 중 1개만 랜덤 이동시켰습니다. 
    
이를 통해 2개의 모서리는 직선을 유지하여 디자인 구현 정도를 올렸습니다.
                      ''',
        style: AppTextStyles.textR16.copyWith(
          color: AppColors.bezierText,
        ),
      ),
    ],
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        '3. 꼭짓점 간 거리 계산',
        style: AppTextStyles.textB16.copyWith(
          color: AppColors.bezierText,
        ),
      ),
      const SizedBox(height: 4),
      Text(
        '''
각 모서리의 길이를 계산하고 내분점 좌표 계산 시 사용했습니다.
                      ''',
        style: AppTextStyles.textR16.copyWith(
          color: AppColors.bezierText,
        ),
      ),
      const SizedBox(height: 4),
      Text(
        '4. 내분점 계산 (Bezier 곡선 시작/끝점)',
        style: AppTextStyles.textB16.copyWith(
          color: AppColors.bezierText,
        ),
      ),
      Text(
        '''
각 꼭짓점마다 2개의 내분점을 계산하여 총 8개의 내분점 좌표를 구했습니다.
(거리와 arcRoundness를 활용해 곡선 시작/끝점 좌표 결정)
                      ''',
        style: AppTextStyles.textR16.copyWith(
          color: AppColors.bezierText,
        ),
      ),
      Text(
        '5. Path 생성',
        style: AppTextStyles.textB16.copyWith(
          color: AppColors.bezierText,
        ),
      ),
      Text(
        '''
moveTo()로 첫 번째 내분점 좌표로 이동하고
lineTo()와 quadraticBezierTo()로 8개의 점을 순서대로 연결했습니다. 
마지막으로 Path를 닫아 둥근 꼭짓점을 가진 불규칙한 사각형 완성했습니다.
                      ''',
        style: AppTextStyles.textR16.copyWith(
          color: AppColors.bezierText,
        ),
      ),
    ],
  ),
];
