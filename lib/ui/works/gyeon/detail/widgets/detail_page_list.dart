// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/loading_status.dart';
import '../../../../../theme/app_colors.dart';
import '../../../../../theme/app_text_styles.dart';
import '../../../../common/const/assets.dart';
import '../detail_state.dart';
import '../detail_view_model.dart';

List<Widget> pageList = <Widget>[
  const DetailPage1(),
  const DetailPage2(),
  const DetailPage3(),
  const DetailPage4(),
  const DetailPage5(),
  const DetailPage6(),
];

class DetailPage1 extends StatelessWidget {
  const DetailPage1({super.key});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox.shrink(),
          const Text(
            '''대학교 커뮤니티 앱 에브리타임을 보던 중, 학식당에서 기다리는 동안 메뉴판을 확인할 수 없어 불편하다는 문제를 발견했습니다.''',
            style: AppTextStyles.textM16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: <Widget>[
                SizedBox(
                  child: Image.network(
                    'https://euaozzqxpkadydffwxil.supabase.co/storage/v1/object/public/portpolio/post1.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  child: Image.network(
                    'https://euaozzqxpkadydffwxil.supabase.co/storage/v1/object/public/portpolio/post2.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
          ),
          const Text(
            '''실제로 일주일 사이 같은 주제로 두 개의 게시글이 올라왔고, 총 500개 가량의 좋아요를 기록한 것을 보고 이 문제가 많은 학생들이 공감하는 불편이라는 점을 확인할 수 있었습니다.''',
            style: AppTextStyles.textM16,
          ),
          const SizedBox(height: 16),
          const Text(
            '''이를 해결하기 위해 에브리타임의 게시글까지 들어가지 않고 QR코드를 통해 바로 메뉴판을 확인할 수 있는 웹사이트를 만들면 좋겠다고 생각했습니다.''',
            style: AppTextStyles.textM16,
          ),
          const SizedBox(height: 60),
        ],
      );
}

class DetailPage2 extends ConsumerStatefulWidget {
  const DetailPage2({super.key});

  @override
  ConsumerState<DetailPage2> createState() => _DetailPage2State();
}

class _DetailPage2State extends ConsumerState<DetailPage2>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
  }

  @override
  Widget build(BuildContext context) {
    final GyeonDetailState state = ref.watch(gyeonDetailViewModelProvider);
    final GyeonDetailViewModel viewModel =
        ref.read(gyeonDetailViewModelProvider.notifier);

    ref.listen<LoadingStatus>(
        gyeonDetailViewModelProvider.select(
            (GyeonDetailState state) => state.selectingMenuLoadingStatus),
        (LoadingStatus? previous, LoadingStatus next) {
      if (next == LoadingStatus.success) {
        _controller
          ..reset()
          ..forward();
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox.shrink(),
        const Text(
          '''메뉴판 UI는 학식당에서 QR코드를 이용해 들어올 것과 수업 중에 메뉴 확인을 위해 테블릿으로 들어올 것을 모두 대응할 수 있도록 반응형 UI로 디자인했습니다.''',
          style: AppTextStyles.textM16,
        ),
        const SizedBox(height: 16),
        const Text(
          '''사이트 체류 시간을 늘리고 사용자들에게 바이럴을 유도하기 위한 부가 기능으로 메뉴 선택을 돕는 랜덤 음식 뽑기 인터랙션을 기획했습니다.''',
          style: AppTextStyles.textM16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width > 500 ? 400 : 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.gyeonMain,
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: <Widget>[
                              const Text(
                                '오늘 뭐먹지?',
                                style: AppTextStyles.textB18,
                              ),
                              const SizedBox(height: 16),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: AppColors.gyeonGray1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    ClipRRect(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: AnimatedSwitcher(
                                          duration:
                                              const Duration(milliseconds: 150),
                                          transitionBuilder: (Widget child,
                                              Animation<double> animation) {
                                            final Animation<double>
                                                easeAnimation = CurvedAnimation(
                                              parent: animation,
                                              curve: Curves.easeInOut,
                                            );

                                            return SlideTransition(
                                              position: Tween<Offset>(
                                                begin: const Offset(0.0, -0.3),
                                                end: child.key ==
                                                        ValueKey<String>(state
                                                            .selectedMenuTitle)
                                                    ? Offset.zero
                                                    : const Offset(0.0, 1.6),
                                              ).animate(easeAnimation),
                                              child: FadeTransition(
                                                opacity: animation,
                                                child: child,
                                              ),
                                            );
                                          },
                                          child: Text(
                                            state.selectedMenuTitle,
                                            key: ValueKey<String>(
                                                state.selectedMenuTitle),
                                            style: AppTextStyles.textB16,
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: AppColors.gyeonMain,
                                      foregroundColor: AppColors.white,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                    onPressed: state.isSelectingMenuLoading
                                        ? null
                                        : viewModel.selectTodayMenu,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 8,
                                      ),
                                      child: Text(
                                        state.selectingMenuLoadingStatusText,
                                        style: AppTextStyles.textR16.copyWith(
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        if (state.isSelectingMenuLoadingSuccess)
                          Lottie.asset(
                            width: 175,
                            Assets.gyeonCongratulation,
                            controller: _controller,
                            fit: BoxFit.fitWidth,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Text(
          '''Lottie와 룰렛 애니메이션을 구현해 사용자에게 보는 재미를 주려했습니다.''',
          style: AppTextStyles.textM16,
        ),
        const SizedBox(height: 16),
        const Text(
          '''혼자 모든 메뉴판 사진을 촬영하기 어렵다고 판단해서, 카카오톡 오픈채팅방을 열어 학생들의 제보를 받을 수 있는 채널을 마련했습니다.''',
          style: AppTextStyles.textM16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Wrap(
                  runAlignment: WrapAlignment.center,
                  alignment: WrapAlignment.center,
                  spacing: 32,
                  runSpacing: 32,
                  children: <Widget>[
                    SizedBox(
                      width: 200,
                      child: Image.network(
                        'https://euaozzqxpkadydffwxil.supabase.co/storage/v1/object/public/portpolio/chatrooms.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.black.withValues(alpha: 0.65),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          topLeft: Radius.circular(50),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Photography by 제보자',
                            style: AppTextStyles.textR12.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Text(
          '추가적으로 제보율을 올리기 위해, 원하는 제보자에 한해 제보자의 닉네임을 메뉴 사진에 표시되도록 기획했습니다.',
          style: AppTextStyles.textM16,
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}

class DetailPage3 extends StatelessWidget {
  const DetailPage3({super.key});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            'https://euaozzqxpkadydffwxil.supabase.co/storage/v1/object/public/portpolio/planning.png',
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(height: 16),
          const Text(
            '백엔드 단을 구현하기 위한 도구로는 Supabase를 사용했으며, 데이터 베이스의 전체적인 구조는 ERD 클라우드에 올라와 있는 배달의 민족 ERD 클론을 참고해서 설계했습니다.',
            style: AppTextStyles.textM16,
          ),
          const SizedBox(height: 16),
          const Text(
            '주요 고려 사항으로는 관리의 편의성을 위해, 메뉴 테이블에서 단일 이미지 URL을 저장하는 방향으로 설계했습니다.',
            style: AppTextStyles.textM16,
          ),
          const SizedBox(height: 16),
          const Text(
            '메뉴 옵션도 중복되는 경우가 생길 수 있다고 생각했지만, 모든 메뉴 옵션에 대한 정보가 없었기 때문에 일단 제보가 들어오는 옵션만 저장하는 구조로 설계했습니다.',
            style: AppTextStyles.textM16,
          ),
          const SizedBox(height: 32),
          Image.network(
            'https://euaozzqxpkadydffwxil.supabase.co/storage/v1/object/public/portpolio/imagetocsv.png',
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(height: 16),
          const Text(
            '''학식당 메뉴 데이터를 제공받을 곳이 없어서, GPT를 활용해 직접 메뉴판 사진에서 음식명과 가격 텍스트를 추출하고 검수를 거친 뒤 최종 데이터셋을 완성했습니다.''',
            style: AppTextStyles.textM16,
          ),
          const SizedBox(height: 16),
          const SizedBox(height: 60),
        ],
      );
}

class DetailPage4 extends StatelessWidget {
  const DetailPage4({super.key});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            'https://euaozzqxpkadydffwxil.supabase.co/storage/v1/object/public/portpolio/vercel.png',
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(height: 16),
          const Text(
            'Vercel을 사용해 배포했고 사용한 이유는 다음과 같습니다.',
            style: AppTextStyles.textM16,
          ),
          const Text(
            '1. 소규모 프로젝트라 무료로 제공되는 스펙이 충분함',
            style: AppTextStyles.textM16,
          ),
          const Text(
            '2. 따로 호스팅 서버에 대한 관리를 하지 않아도 됨',
            style: AppTextStyles.textM16,
          ),
          const Text(
            '3. 도메인 이름을 구매하지 않고도 관련 있는 이름을 사용할 수 있음',
            style: AppTextStyles.textM16,
          ),
          const Text(
            '4. 자동 배포 기능이 있어 코드 변경 시 자동으로 배포됨',
            style: AppTextStyles.textM16,
          ),
        ],
      );
}

class DetailPage5 extends StatelessWidget {
  const DetailPage5({super.key});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Image.network(
                  'https://euaozzqxpkadydffwxil.supabase.co/storage/v1/object/public/portpolio/ad1.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Image.network(
                  'https://euaozzqxpkadydffwxil.supabase.co/storage/v1/object/public/portpolio/poster.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            '홍보는 에브리타임 게시글을 통해 진행했습니다.',
            style: AppTextStyles.textM16,
          ),
          const Text(
            '2025.04월 기준 좋아요 152개, 댓글 39개, 스크랩 284회를 기록했습니다.',
            style: AppTextStyles.textM16,
          ),
          const SizedBox(height: 16),
          const Text(
            '홍보글 업로드 첫날 사이트 방문자수는 500명 정도로 생각하고 있습니다. ',
            style: AppTextStyles.textM16,
          ),
          const Text(
            '(홈 화면 접속 시 호출되는 API 기준으로 추정)',
            style: AppTextStyles.textM16,
          ),
          const SizedBox(height: 16),
          const Text(
            '추가로 원래 기획했던 대로 QR코드가 있는 포스터를 제작하여 학식당 벽면에 부착하여 홍보했습니다.',
            style: AppTextStyles.textM16,
          ),
          const SizedBox(height: 60),
        ],
      );
}

class DetailPage6 extends StatelessWidget {
  const DetailPage6({super.key});

  @override
  Widget build(BuildContext context) => const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '약 한 학기 동안 운영한 결과, 첫날의 임팩트와 달리, 평일 DAU는 10~20명 수준을 유지했습니다.',
            style: AppTextStyles.textM16,
          ),
          Text(
            '(메인 화면 접속 시 호출되는 API를 기준으로 추정)',
            style: AppTextStyles.textM16,
          ),
          Text(
            '카카오톡 오픈채팅을 통해 4명의 학생이 메뉴판 사진을 제보해 주었고, 총 14장의 사진을 등록할 수 있었습니다.',
            style: AppTextStyles.textM16,
          ),
        ],
      );
}
