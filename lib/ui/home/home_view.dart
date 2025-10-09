import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../theme/app_text_styles.dart';
import '../common/const/mock/mock_model.dart';
import '../common/widgets/header_widget.dart';
import 'home_state.dart';
import 'home_view_model.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  Timer? _exitTimer;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _exitTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.read(homeViewModelProvider);
    final HomeViewModel viewModel = ref.read(homeViewModelProvider.notifier);

    ref.listen<AppIconModel>(
        homeViewModelProvider
            .select((HomeState state) => state.selectedAppIcon),
        (AppIconModel? previous, AppIconModel next) {
      if (previous != null && previous.title != next.title) {
        viewModel.setOpacity(opacity: 0.0);
        Future<void>.delayed(const Duration(milliseconds: 150), () {
          if (mounted) {
            viewModel
              ..setCurrentTitle(title: next.title)
              ..setCurrentExplain(explain: next.explain)
              ..setOpacity(opacity: 1.0);
          }
        });
      }
    });

    return Scaffold(
      appBar: const HeaderWidget(),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        final double paddingHeight = (constraints.maxHeight - 510) / 2;
        final bool isMobile = constraints.maxWidth < 768;
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              if (isMobile)
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical:
                        paddingHeight - 80 > 100 ? paddingHeight - 80 : 100,
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        width: 260,
                        height: 130,
                        child: const AnimatedExplainSection(isMobile: true),
                      ),
                      const Row(
                        children: <Widget>[
                          SizedBox(height: 32),
                        ],
                      ),
                      SizedBox(
                        width: 300,
                        height: 440,
                        child: AppIconListSection(
                          onEnter: () {
                            _exitTimer?.cancel();
                          },
                          onExit: () {
                            _exitTimer =
                                Timer(const Duration(milliseconds: 800), () {
                              viewModel.onHoverAppIcon(index: 0);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                )
              else
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: paddingHeight > 100 ? paddingHeight : 100,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 260,
                        height: 300,
                        child: const AnimatedExplainSection(),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(16),
                        width: 300,
                        height: 440,
                        child: AppIconListSection(
                          onEnter: () {
                            _exitTimer?.cancel();
                          },
                          onExit: () {
                            _exitTimer =
                                Timer(const Duration(milliseconds: 800), () {
                              viewModel.onHoverAppIcon(index: 0);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              const FooterWidget(),
            ],
          ),
        );
      }),
    );
  }
}

class AppIconListSection extends ConsumerWidget {
  const AppIconListSection({
    required this.onEnter,
    required this.onExit,
    super.key,
  });

  final VoidCallback onEnter;
  final VoidCallback onExit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeState state = ref.watch(homeViewModelProvider);
    final HomeViewModel viewModel = ref.read(homeViewModelProvider.notifier);
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      alignment: WrapAlignment.center,
      children: List<Widget>.generate(
        state.appIcons.length - 1,
        (int index) => AppIcon(
          onTap: () {
            context.goNamed(state.appIcons[index + 1].route);
          },
          onEnter: () {
            onEnter();
            viewModel.onHoverAppIcon(index: index + 1);
          },
          onExit: onExit,
          image: state.appIcons[index + 1].image,
        ),
      ),
    );
  }
}

class AnimatedExplainSection extends ConsumerWidget {
  const AnimatedExplainSection({
    this.isMobile = false,
    super.key,
  });

  final bool isMobile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeState state = ref.watch(homeViewModelProvider);
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInOut,
      opacity: state.opacity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
            isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            state.currentTitle,
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
            style: AppTextStyles.textB12.copyWith(fontSize: 28),
          ),
          const SizedBox(height: 12),
          Text(
            state.currentExplain,
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
            style: AppTextStyles.textR14,
          ),
        ],
      ),
    );
  }
}

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) => Container(
        height: 64,
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Portpolio', style: AppTextStyles.textM12),
            Text('Copyright © 2025 Jaehoon Ma', style: AppTextStyles.textM12),
          ],
        ),
      );
}

class AppIcon extends ConsumerStatefulWidget {
  const AppIcon({
    required this.onTap,
    required this.onEnter,
    required this.onExit,
    required this.image,
    super.key,
  });

  final VoidCallback onTap;
  final VoidCallback onEnter;
  final VoidCallback onExit;
  final String image;

  @override
  ConsumerState<AppIcon> createState() => _AppIconState();
}

class _AppIconState extends ConsumerState<AppIcon> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: widget.onTap,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) {
            setState(() => isHovered = true);
            widget.onEnter();
          },
          onExit: (_) {
            setState(() => isHovered = false);
            widget.onExit();
          },
          child: AnimatedContainer(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            height: isHovered ? 120 : 115,
            width: isHovered ? 120 : 115,
            duration: const Duration(milliseconds: 300),
            child: Image.asset(
              widget.image,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      );
}
