import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';
import '../../common/widgets/back_icon_button_widget.dart';
import 'pages/bezier_pages.dart';
import 'widgets/irregular_square_widget.dart';

class BezierView extends ConsumerStatefulWidget {
  const BezierView({super.key});

  @override
  ConsumerState<BezierView> createState() => _BezierViewState();
}

class _BezierViewState extends ConsumerState<BezierView> {
  Timer? _exitTimer;
  final PageController _pageController = PageController();
  final ScrollController _scrollController = ScrollController();

  final List<Color> randomColorList = <Color>[
    AppColors.bezierColor1,
    AppColors.bezierColor2,
    AppColors.bezierColor3,
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _exitTimer?.cancel();
    _scrollController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.bezierBackground,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const BackIconButton(
            beginColor: AppColors.bezierText,
            endColor: AppColors.bezierColor1,
          ),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Builder(
              builder: (BuildContext context) {
                final bool isMobile = MediaQuery.of(context).size.width < 768;
                if (!isMobile) {
                  return _ExplainSection(
                    pageController: _pageController,
                    isMobile: isMobile,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: <PointerDeviceKind>{
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                },
                scrollbars: false,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Builder(builder: (BuildContext context) {
                      final bool isMobile =
                          MediaQuery.of(context).size.width < 768;
                      if (isMobile) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 32),
                          child: _ExplainSection(
                            pageController: _pageController,
                            isMobile: isMobile,
                          ),
                        );
                      }

                      return const SizedBox.shrink();
                    }),
                    const _TitleSection(),
                    const SizedBox(height: 32),
                    ...List<dynamic>.generate(
                      10,
                      (int index) => _SquareListTileWidget(
                        index: index,
                        randomColorList: randomColorList,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}

class _SquareListTileWidget extends StatelessWidget {
  const _SquareListTileWidget({
    required this.index,
    required this.randomColorList,
  });

  final int index;
  final List<Color> randomColorList;

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          IrregularSquareWidget(
            randomInt: index,
            randomColor: randomColorList[index % 3],
          ),
          Positioned(
            left: 40,
            bottom: 30,
            child: SizedBox(
              width: 320 * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: AppColors.transparent,
                      border: Border.all(
                        color: AppColors.bezierText,
                        width: 2,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward_rounded,
                      color: AppColors.bezierText,
                      size: 19,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'The first time real estate guide',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.textB20.copyWith(
                      color: AppColors.bezierText,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );
}

class _TitleSection extends StatelessWidget {
  const _TitleSection();

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 155,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Text(
              'Real Estate\nis Hard.',
              textAlign: TextAlign.center,
              style: AppTextStyles.textB18.copyWith(
                color: AppColors.bezierText,
                fontSize: 50,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Transform.rotate(
                angle: pi * 357 / 180,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color:
                        AppColors.bezierSquareBackground.withValues(alpha: 0.9),
                    border: Border.all(
                      color: AppColors.bezierSquareLine,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 13,
                      vertical: 8,
                    ),
                    child: Text(
                      'Let us help you!',
                      style: AppTextStyles.textL12.copyWith(
                        color: AppColors.bezierText,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

class _ExplainSection extends StatelessWidget {
  const _ExplainSection({
    required PageController pageController,
    required bool isMobile,
  })  : _pageController = pageController,
        _isMobile = isMobile;

  final PageController _pageController;
  final bool _isMobile;

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(horizontal: _isMobile ? 16 : 20),
        width: _isMobile ? MediaQuery.of(context).size.width * 0.8 + 32 : 432,
        height: _isMobile ? 560 : 500,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: <PointerDeviceKind>{
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                  scrollbars: false,
                ),
                child: PageView(
                  controller: _pageController,
                  children: List<Widget>.generate(
                    bezierPages.length,
                    (int index) => Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: _isMobile ? 16 : 8),
                      child: bezierPages[index],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 32,
                child: Row(
                  children: <Widget>[
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: 4,
                      effect: ExpandingDotsEffect(
                        activeDotColor: AppColors.bezierText,
                        dotColor: AppColors.bezierText.withValues(alpha: 0.5),
                        dotWidth: 8,
                        dotHeight: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}

class ExplainTileWidget extends StatelessWidget {
  const ExplainTileWidget({
    required this.title,
    required this.explain,
    super.key,
  });

  final String title;
  final String explain;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: AppTextStyles.textB16.copyWith(
                color: AppColors.bezierText,
              ),
            ),
            Text(
              explain,
              style: AppTextStyles.textR14.copyWith(
                color: AppColors.bezierText,
              ),
            ),
          ],
        ),
      );
}

class SvgIconButton extends StatefulWidget {
  const SvgIconButton({
    required this.asset,
    this.onEnter,
    this.onExit,
    this.text,
    this.onTap,
    super.key,
  });

  final VoidCallback? onEnter;
  final VoidCallback? onExit;
  final VoidCallback? onTap;

  final String asset;
  final String? text;

  @override
  State<SvgIconButton> createState() => _SvgIconButtonState();
}

class _SvgIconButtonState extends State<SvgIconButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: widget.onTap,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) {
            widget.onEnter?.call();
            setState(() => isHovered = true);
          },
          onExit: (_) {
            widget.onExit?.call();
            setState(() => isHovered = false);
          },
          child: TweenAnimationBuilder<Color?>(
            tween: ColorTween(
              begin: AppColors.bezierText.withValues(alpha: 0.5),
              end: AppColors.bezierText.withValues(alpha: isHovered ? 1 : 0.5),
            ),
            duration: const Duration(milliseconds: 150),
            builder: (_, Color? color, __) => Row(
              children: <Widget>[
                SvgPicture.asset(
                  widget.asset,
                  colorFilter: ColorFilter.mode(
                    color ?? AppColors.bezierText.withValues(alpha: 0.5),
                    BlendMode.srcIn,
                  ),
                  width: 24,
                  height: 24,
                ),
                if (widget.text != null)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        widget.text!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.textR14.copyWith(
                          color: color ??
                              AppColors.bezierText.withValues(alpha: 0.5),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
}
