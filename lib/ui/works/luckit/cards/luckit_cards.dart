// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';

import '../../../../theme/app_colors.dart';
import '../../../../theme/app_text_styles.dart';
import '../../../common/const/mock/mock_data.dart';

List<Widget> luckitCards = <Widget>[
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Overview',
        style: AppTextStyles.textTenada.copyWith(
          fontSize: 24,
          color: AppColors.luckitMain,
        ),
      ),
      const SizedBox(height: 12),
      ...List<Widget>.generate(
        MockData.luckitExplainModels.length,
        (int index) => Container(
          constraints: const BoxConstraints(
            maxWidth: 480,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                MockData.luckitExplainModels[index].title,
                style: AppTextStyles.textB14.copyWith(
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                MockData.luckitExplainModels[index].explain,
                style: AppTextStyles.textR14.copyWith(
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    ],
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const SizedBox(height: 12),
      Text(
        '주요 패키지 : Flame, Lottie, Riverpod',
        style: AppTextStyles.textB18.copyWith(
          color: AppColors.black,
        ),
      ),
      const SizedBox(height: 18),
      Text(
        '캐릭터의 확률적인 움직임',
        style: AppTextStyles.textB16.copyWith(
          color: AppColors.black,
        ),
      ),
      const SizedBox(height: 4),
      Text(
        '''특정 시간마다 캐릭터의 움직임과 멈춤 상태가 확률적으로 선택됩니다. 움직임 상태로 변할 때 랜덤 방향으로 움직이도록 구현했습니다.''',
        style: AppTextStyles.textR16.copyWith(
          color: AppColors.black,
        ),
      ),
      Text(
        '화면 바깥으로 나가지 않게 하기 위해서 화면 경계 충돌 감지를 구현했습니다.',
        style: AppTextStyles.textR16.copyWith(
          color: AppColors.black,
        ),
      ),
      const SizedBox(height: 12),
      Text(
        '게임과 투두리스트 연결',
        style: AppTextStyles.textB16.copyWith(
          color: AppColors.black,
        ),
      ),
      const SizedBox(height: 4),
      Text(
        'Riverpod의 ref.listen을 활용해 투두 리스트 상태 변화를 감지하여, 게임 내 캐릭터가 추가되거나 삭제되도록 구현했습니다.',
        style: AppTextStyles.textR16.copyWith(
          color: AppColors.black,
        ),
      ),
    ],
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        '주요 기술 : OpenAI API, Supabase',
        style: AppTextStyles.textB18.copyWith(
          color: AppColors.black,
        ),
      ),
      const SizedBox(height: 18),
      Text(
        'AI 모델 선택',
        style: AppTextStyles.textB16.copyWith(
          color: AppColors.black,
        ),
      ),
      const SizedBox(height: 6),
      Text(
        'GPT-3.5-turbo와 GPT-4o-mini를 비교했었는데, 답변 품질과 응답속도 측면에서 차이가 크지 않아, 당시 입력 및 출력 비용이 가장 저렴했던 GPT-3.5-turbo를 채택 했습니다',
        style: AppTextStyles.textR16.copyWith(
          color: AppColors.black,
        ),
      ),
      const SizedBox(height: 6),
      Text(
        '운세와 추천할 일을 1번 생성할 때 4원 정도를 사용하도록 프롬프트를 설계했습니다',
        style: AppTextStyles.textR16.copyWith(
          color: AppColors.black,
        ),
      ),
      const SizedBox(height: 12),
      Text(
        '운세 및 추천 할 일 생성',
        style: AppTextStyles.textB16.copyWith(
          color: AppColors.black,
        ),
      ),
      const SizedBox(height: 6),
      Text(
        '온보딩에서 입력받은 사용자의 생년월일을 바탕으로 오늘의 운세와 추천 할 일을 openAI API를 활용하여 생성했습니다',
        style: AppTextStyles.textR16.copyWith(
          color: AppColors.black,
        ),
      ),
      const SizedBox(height: 6),
      Text(
        'Supabase Edge Functions를 이용하여 서버리스 함수를 배포했습니다',
        style: AppTextStyles.textR16.copyWith(
          color: AppColors.black,
        ),
      ),
      const SizedBox(height: 12),
      Text(
        '데이터 타입 선택',
        style: AppTextStyles.textB16.copyWith(
          color: AppColors.black,
        ),
      ),
      const SizedBox(height: 6),
      Text(
        '운세는 받아온 JSON 데이터를 JSONB 타입으로 저장, 추천 할 일은 JSON 데이터를 파싱하여 별도 컬럼으로 저장했습니다',
        style: AppTextStyles.textR16.copyWith(
          color: AppColors.black,
        ),
      ),
      const SizedBox(height: 6),
      Text(
        '운세는 한 번 생성되면 수정될 일이 없고, 데이터 내에 객체 리스트 구조가 있어, 별도 테이블을 만들기보다 JSONB 타입으로 관리하는 것이 더 직관적이라고 판단했습니다. 반대로 추천할 일은 사용자의 투두리스트에 추가 되었는지 아닌지에 대한 정보를 수정할 가능성이 있었기 때문에 JSON을 파싱하여 별도 컬럼으로 저장했습니다',
        style: AppTextStyles.textR16.copyWith(
          color: AppColors.black,
        ),
      ),
    ],
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'AI 생성 지연 시간 관련 설계',
        style: AppTextStyles.textB16.copyWith(
          color: AppColors.black,
        ),
      ),
      const SizedBox(height: 6),
      Text(
        '운세 생성 후 추천할 일을 동기적으로 처리하는 방식으로 구현하여 지연 시간이 6~8초 발생했으나, 많은 애니매이션이 포함된 로딩 인디케이터를 통해 사용자가 기다리는 동안 지루함을 최소화할 수 있도록 했습니다.',
        style: AppTextStyles.textR16.copyWith(
          color: AppColors.black,
        ),
      ),
    ],
  ),
];
