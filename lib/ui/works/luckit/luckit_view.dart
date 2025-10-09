import 'dart:async';
import 'dart:math' as math;
import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/loading_status.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';
import '../../common/const/assets.dart';
import '../../common/const/luckit/animal_type.dart';
import '../../common/const/mock/mock_data.dart';
import '../../common/game/farm_game.dart';
import '../../common/widgets/back_icon_button_widget.dart';
import 'cards/luckit_cards.dart';
import 'luckit_state.dart';
import 'luckit_view_model.dart';

class LuckitView extends ConsumerStatefulWidget {
  const LuckitView({super.key});

  @override
  ConsumerState<LuckitView> createState() => _LuckitViewState();
}

class _LuckitViewState extends ConsumerState<LuckitView> {
  final ScrollController _scrollController = ScrollController();
  final PageController _pageController = PageController();
  late FarmGame _farmGame;

  @override
  void initState() {
    super.initState();
    _farmGame = FarmGame();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final double width = MediaQuery.of(context).size.width;
      FarmGame.screenSize = Vector2(
        width < 1024 + 32 + 36 ? width - 34 - 36 : 1026,
        300,
      );
      _initAnimalsToGame();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final double width = MediaQuery.of(context).size.width;
    FarmGame.screenSize = Vector2(
      width < 1024 + 32 ? width - 32 : 1026,
      300,
    );
  }

  Vector2 _getRandomPosition() {
    final math.Random random = math.Random();
    return Vector2(
      random.nextDouble() * FarmGame.screenSize.x,
      random.nextDouble() * FarmGame.screenSize.y,
    );
  }

  void _initAnimalsToGame() {
    for (final AnimalType animal in AnimalType.values) {
      _farmGame.world.add(
        MovableObject(
          id: animal.name,
          position: _getRandomPosition(),
          animalType: animal,
        ),
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(luckitViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        leading: const BackIconButton(
          endColor: AppColors.luckitMain,
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.luckitMain,
            ),
            onPressed: () {
              launchUrl(
                Uri.parse(
                  MockData.luckitImage,
                ),
                mode: LaunchMode.externalNonBrowserApplication,
              );
            },
            child: Text(
              '디자인 & 기획',
              style: AppTextStyles.textR14.copyWith(
                color: AppColors.luckitMain,
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      backgroundColor: AppColors.white,
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: <PointerDeviceKind>{
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const SizedBox(height: 32),
                  const _TitleWidget(),
                  const SizedBox(height: 32),
                  _ExplainCard(
                    child: luckitCards[0],
                  ),
                  const SizedBox(height: 56),
                  const _SectionTitleWidget(title: '수집형 게임 개발'),
                  const SizedBox(height: 12),
                  _GameSection(farmGame: _farmGame),
                  const SizedBox(height: 16),
                  _ExplainCard(child: luckitCards[1]),
                  const SizedBox(height: 32),
                  const _ExplainCard(
                    child: Column(),
                  ),
                  const SizedBox(height: 16),
                  const _SectionTitleWidget(title: 'AI 활용 콘텐츠 생성'),
                  _ExplainCard(child: luckitCards[2]),
                  const SizedBox(height: 72),
                  const _SectionTitleWidget(title: 'UI 설계'),
                  const _ExplainCard(
                    child: _LoadingWidget(),
                  ),
                  _ExplainCard(child: luckitCards[3]),
                  const SizedBox(height: 128),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionTitleWidget extends StatelessWidget {
  const _SectionTitleWidget({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width < 1024 + 32
            ? MediaQuery.of(context).size.width - 32
            : 1024,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(18),
        child: Text(
          title,
          style: AppTextStyles.textTenada.copyWith(
            fontSize: 22,
            color: AppColors.luckitMain,
          ),
        ),
      );
}

class _ExplainCard extends StatelessWidget {
  const _ExplainCard({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width < 1024 + 32
            ? MediaQuery.of(context).size.width - 32
            : 1024,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.white,
        ),
        child: child,
      );
}

class _LoadingWidget extends ConsumerStatefulWidget {
  const _LoadingWidget();

  @override
  ConsumerState<_LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends ConsumerState<_LoadingWidget>
    with TickerProviderStateMixin {
  Timer? messageTimer;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    // 애니메이션 컨트롤러 초기화
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this,
      );

      // 위아래로 살짝 움직이는 애니메이션 (5픽셀 범위)
      _animation = Tween<double>(
        begin: -2.5,
        end: 2.5,
      ).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ));

      // 반복 애니메이션 시작
      _animationController.repeat(reverse: true);
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void startLoadingMessages() {
    messageTimer?.cancel();
    messageTimer = Timer.periodic(
      const Duration(milliseconds: 2500),
      (Timer timer) {
        if (mounted) {
          ref
              .read(luckitViewModelProvider.notifier)
              .changeCurrentMessageIndex();
        }
      },
    );
  }

  void stopLoadingMessages() {
    messageTimer?.cancel();
    messageTimer = null;
  }

  @override
  Widget build(BuildContext context) {
    final LuckitState state = ref.watch(luckitViewModelProvider);
    final LuckitViewModel viewModel =
        ref.watch(luckitViewModelProvider.notifier);

    ref.listen(
      luckitViewModelProvider
          .select((LuckitState state) => state.loadingStatus),
      (LoadingStatus? previous, LoadingStatus next) async {
        if (next == LoadingStatus.loading) {
          startLoadingMessages();
        } else {
          stopLoadingMessages();
        }
      },
    );
    return Container(
      height: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.luckitShadow.withValues(alpha: 0.25),
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (state.loadingStatus == LoadingStatus.loading)
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Column(
                children: <Widget>[
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (BuildContext context, Widget? child) =>
                        Transform.translate(
                      offset: Offset(0, _animation.value),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: AppColors.luckitShadow
                                  .withValues(alpha: 0.25),
                              blurRadius: 12,
                              offset: const Offset(0, 16),
                            ),
                          ],
                        ),
                        child: SvgPicture.asset(
                          Assets.luckitFortuneColored,
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 102,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: Text(
                            key: ValueKey<String>(
                              MockData
                                  .loadingMessages[state.currentMessageIndex],
                            ),
                            MockData.loadingMessages[state.currentMessageIndex],
                            style: AppTextStyles.textR16,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          if (state.loadingStatus == LoadingStatus.none ||
              state.loadingStatus == LoadingStatus.success)
            Column(
              children: <Widget>[
                if (state.loadingStatus == LoadingStatus.none)
                  Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.only(bottom: 24),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: AppColors.luckitShadow.withValues(alpha: 0.25),
                          blurRadius: 12,
                          offset: const Offset(0, 16),
                        ),
                      ],
                    ),
                    child: SvgPicture.asset(
                      Assets.luckitFortuneColored,
                      width: 50,
                      height: 50,
                    ),
                  )
                else
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        '오늘의 운세 지수',
                        style: AppTextStyles.textB16,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${state.fortuneScore}',
                        style: AppTextStyles.textTenada.copyWith(
                          color: AppColors.luckitMain,
                          fontSize: 32,
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 91,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        state.loadingStatus == LoadingStatus.success
                            ? '한 번 더 확인해볼까요?'
                            : '오늘의 운세 지수를\n확인해보세요!',
                        style: AppTextStyles.textB16,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.luckitMain,
                          foregroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(16),
                        ),
                        onPressed: () async {
                          startLoadingMessages();
                          await viewModel.getFortune();
                        },
                        child: Text(
                          '운세 받아오기',
                          style: AppTextStyles.textM16.copyWith(
                            color: AppColors.white,
                            height: 1.1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _GameSection extends StatefulWidget {
  const _GameSection({
    required FarmGame farmGame,
  }) : _farmGame = farmGame;

  final FarmGame _farmGame;

  @override
  State<_GameSection> createState() => _GameSectionState();
}

class _GameSectionState extends State<_GameSection> {
  @override
  Widget build(BuildContext context) => Container(
        height: 299,
        width: MediaQuery.of(context).size.width < 1024 + 32 + 36
            ? MediaQuery.of(context).size.width - 34 - 36
            : 1024,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.white,
        ),
        clipBehavior: Clip.hardEdge,
        child: GameWidget<FarmGame>(
          game: widget._farmGame,
          backgroundBuilder: (BuildContext context) => Container(
            decoration: const BoxDecoration(color: AppColors.white),
          ),
          loadingBuilder: (BuildContext context) => const Center(
            child: CircularProgressIndicator(color: AppColors.luckitMain),
          ),
          errorBuilder: (BuildContext context, Object error) => Center(
            child: Text('Error: $error'),
          ),
        ),
      );
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget();

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;
    return Column(
      children: <Widget>[
        if (isMobile) const SizedBox(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(width: isMobile ? 18 : 54),
            Text(
              'LUCKIT',
              style: AppTextStyles.textTenada.copyWith(
                fontSize: isMobile ? 58 : 84,
                height: 0.6,
                color: AppColors.luckitMain,
              ),
            ),
            SizedBox(width: isMobile ? 12 : 24),
            SvgPicture.asset(
              Assets.luckitLogo2,
              width: isMobile ? 48 : 72,
              height: isMobile ? 48 : 72,
            ),
            SizedBox(width: isMobile ? 18 : 54),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: <Widget>[
            Text(
              '운세와 작은 성취로 성장하는 투두리스트',
              style: AppTextStyles.textL12.copyWith(
                fontSize: isMobile ? 12 : 16,
                color: AppColors.luckitMain,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
