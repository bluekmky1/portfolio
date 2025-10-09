import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../common/const/assets.dart';
import '../common/const/mock/mock_data.dart';
import '../common/const/mock/mock_model.dart';
import '../common/widgets/back_icon_button_widget.dart';
import 'resume_state.dart';
import 'resume_view_model.dart';
import 'widgets/resume_section.dart';

class ResumeView extends ConsumerStatefulWidget {
  const ResumeView({super.key});

  @override
  ConsumerState<ResumeView> createState() => _ResumeViewState();
}

class _ResumeViewState extends ConsumerState<ResumeView> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _containerKeys = List<GlobalKey>.generate(
    MockData.resumeSections.length,
    (int index) => GlobalKey(),
  );

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_updateSelectedIndex);
  }

  void _updateSelectedIndex() {
    final RenderBox? scrollViewRenderBox =
        _scrollController.position.context.storageContext.findRenderObject()
            as RenderBox?;

    if (scrollViewRenderBox == null) {
      return;
    }

    final double scrollViewTop =
        scrollViewRenderBox.localToGlobal(Offset.zero).dy;
    final double scrollViewHeight = scrollViewRenderBox.size.height;
    final double scrollViewCenter = scrollViewTop + (scrollViewHeight / 2);

    int closestIndex = 0;
    double closestDistance = double.infinity;

    for (int i = 0; i < _containerKeys.length; i++) {
      final RenderBox? containerRenderBox =
          _containerKeys[i].currentContext?.findRenderObject() as RenderBox?;

      if (containerRenderBox != null) {
        final double containerTop =
            containerRenderBox.localToGlobal(Offset.zero).dy;
        final double containerCenter =
            containerTop + (containerRenderBox.size.height / 2);
        final double distance = (containerCenter - scrollViewCenter).abs();

        if (distance < closestDistance) {
          closestDistance = distance;
          closestIndex = i;
        }
      }
    }

    final ResumeViewModel viewModel =
        ref.read(resumeViewModelProvider.notifier);
    final ResumeState state = ref.read(resumeViewModelProvider);

    if (state.selectedIndex != closestIndex) {
      viewModel.onSelectIndex(index: closestIndex);
    }
  }

  void _scrollToSection(int index) {
    if (index < 0 || index >= _containerKeys.length) {
      return;
    }

    final RenderBox? containerRenderBox =
        _containerKeys[index].currentContext?.findRenderObject() as RenderBox?;

    if (containerRenderBox != null) {
      final RenderBox? scrollViewRenderBox =
          _scrollController.position.context.storageContext.findRenderObject()
              as RenderBox?;

      if (scrollViewRenderBox != null) {
        // 컨테이너의 현재 위치 계산
        final double containerGlobalTop =
            containerRenderBox.localToGlobal(Offset.zero).dy;
        final double scrollViewGlobalTop =
            scrollViewRenderBox.localToGlobal(Offset.zero).dy;

        // 스크롤 위치 계산 (컨테이너를 화면 중앙에 위치시키기 위해)
        final double targetScrollPosition = _scrollController.offset +
            (containerGlobalTop - scrollViewGlobalTop) -
            (scrollViewRenderBox.size.height / 2) +
            (containerRenderBox.size.height / 2);

        _scrollController.animateTo(
          targetScrollPosition.clamp(
            0.0,
            _scrollController.position.maxScrollExtent,
          ),
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ResumeState state = ref.watch(resumeViewModelProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const BackIconButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: constraints.maxWidth > 1024 ? 1024 : constraints.maxWidth,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: <Widget>[
                    if (constraints.maxWidth > 450)
                      SizedBox(
                        width: constraints.maxWidth > 768 ? 200 : 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            ...List<Widget>.generate(
                              MockData.resumeTitles.length,
                              (int index) => GestureDetector(
                                onTap: () {
                                  _scrollToSection(index);
                                },
                                child: AnimatedDefaultTextStyle(
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.easeInOut,
                                  style: state.selectedIndex == index
                                      ? AppTextStyles.textR16.copyWith(
                                          fontSize: 20,
                                          color: AppColors.black,
                                        )
                                      : AppTextStyles.textL12.copyWith(
                                          fontSize: 16,
                                          color: AppColors.gray400,
                                        ),
                                  child: Text(
                                    textAlign: TextAlign.right,
                                    MockData.resumeTitles[index],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    SizedBox(
                      width: constraints.maxWidth > 768
                          ? 64
                          : constraints.maxWidth > 450
                              ? 16
                              : 0,
                    ),
                    Expanded(
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(
                          dragDevices: <PointerDeviceKind>{
                            PointerDeviceKind.touch,
                            PointerDeviceKind.mouse,
                          },
                          scrollbars: false,
                        ),
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 210,
                              bottom: 600,
                            ),
                            child: Column(
                              crossAxisAlignment: constraints.maxWidth > 450
                                  ? CrossAxisAlignment.start
                                  : CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                      left:
                                          constraints.maxWidth > 450 ? 32 : 0),
                                  width: 250,
                                  height: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: AppColors.gray300,
                                    ),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset(
                                    Assets.profileImg,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                ...List<Widget>.generate(
                                  state.resumeSections.length,
                                  (int index) => ResumeSection(
                                    key: _containerKeys[index],
                                    title: state.resumeSections[index]['title']
                                        as String,
                                    modelList: state.resumeSections[index]
                                        ['modelList'] as List<ResumeTileModel>,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
