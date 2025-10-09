import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';
import '../../common/const/mock/mock_data.dart';
import '../../common/widgets/back_icon_button_widget.dart';
import 'search_state.dart';
import 'search_view_model.dart';

class SearchView extends ConsumerStatefulWidget {
  const SearchView({super.key});

  @override
  ConsumerState<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends ConsumerState<SearchView>
    with TickerProviderStateMixin {
  Timer? _debounceTimer;
  final TextEditingController _textController = TextEditingController();
  late AnimationController _scrollAnimationController1;
  late AnimationController _scrollAnimationController2;
  late AnimationController _scrollAnimationController3;
  late Animation<double> _scrollAnimation1;
  late Animation<double> _scrollAnimation2;
  late Animation<double> _scrollAnimation3;

  @override
  void initState() {
    super.initState();

    // 첫 번째 Row 애니메이션
    _scrollAnimationController1 = AnimationController(
      duration: const Duration(minutes: 6),
      vsync: this,
    );
    _scrollAnimation1 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scrollAnimationController1,
      curve: Curves.linear,
    ));

    // 두 번째 Row 애니메이션 (약간의 지연)
    _scrollAnimationController2 = AnimationController(
      duration: const Duration(minutes: 4),
      vsync: this,
    );
    _scrollAnimation2 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scrollAnimationController2,
      curve: Curves.linear,
    ));

    // 세 번째 Row 애니메이션 (더 큰 지연)
    _scrollAnimationController3 = AnimationController(
      duration: const Duration(minutes: 5),
      vsync: this,
    );
    _scrollAnimation3 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scrollAnimationController3,
      curve: Curves.linear,
    ));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(searchViewModelProvider.notifier).onInit();
      _scrollAnimationController1
        ..value = 0.5
        ..repeat();
      _scrollAnimationController2
        ..value = 0.5
        ..repeat();
      _scrollAnimationController3
        ..value = 0.5
        ..repeat();
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _textController.dispose();
    _scrollAnimationController1.dispose();
    _scrollAnimationController2.dispose();
    _scrollAnimationController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SearchState state = ref.watch(searchViewModelProvider);
    return Scaffold(
      backgroundColor: AppColors.searchMain,
      appBar: AppBar(
        backgroundColor: AppColors.searchMain,
        leading: const BackIconButton(
          beginColor: AppColors.white,
          endColor: AppColors.black,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: AppColors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                ),
                builder: (BuildContext context) => const _ExplainDialogWidget(),
              );
            },
            icon: const Icon(Icons.info_outline_rounded),
            color: AppColors.white,
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _textController,
                  cursorColor: AppColors.white,
                  style: AppTextStyles.textL12.copyWith(
                    fontSize: 16,
                    color: AppColors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: '꽃 이름을 검색해보세요.',
                    hintStyle: AppTextStyles.textL12.copyWith(
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.white,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.white,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.white,
                        width: 2.0,
                      ),
                    ),
                    disabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.white,
                        width: 2.0,
                      ),
                    ),
                  ),
                  onChanged: (String value) {
                    _debounceTimer?.cancel();
                    _debounceTimer =
                        Timer(const Duration(milliseconds: 360), () {
                      ref
                          .read(searchViewModelProvider.notifier)
                          .searchPummock(searchWord: value);
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              FlowerLineWidget(
                currentAnimation: _scrollAnimation1,
                currentList: state.searchedPummockList1,
                onDragEnd: (double newValue) {
                  _scrollAnimationController1
                    ..value = newValue
                    ..repeat();
                },
              ),
              FlowerLineWidget(
                currentAnimation: _scrollAnimation2,
                currentList: state.searchedPummockList2,
                onDragEnd: (double newValue) {
                  _scrollAnimationController2
                    ..value = newValue
                    ..repeat();
                },
              ),
              FlowerLineWidget(
                currentAnimation: _scrollAnimation3,
                currentList: state.searchedPummockList3,
                onDragEnd: (double newValue) {
                  _scrollAnimationController3
                    ..value = newValue
                    ..repeat();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExplainDialogWidget extends StatelessWidget {
  const _ExplainDialogWidget();

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 500,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  CloseButton(),
                  SizedBox(width: 8),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ...List<Widget>.generate(
                              MockData.searchExplainModels.length,
                              (int index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    MockData.searchExplainModels[index].title,
                                    style: AppTextStyles.textB20,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    MockData.searchExplainModels[index].explain,
                                    style: AppTextStyles.textR14,
                                  ),
                                  const SizedBox(height: 16),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

class FlowerLineWidget extends StatefulWidget {
  const FlowerLineWidget({
    required this.currentAnimation,
    required this.currentList,
    required this.onDragEnd,
    super.key,
  });

  final Animation<double> currentAnimation;
  final List<String> currentList;
  final void Function(double newValue) onDragEnd;

  @override
  State<FlowerLineWidget> createState() => _FlowerLineWidgetState();
}

class _FlowerLineWidgetState extends State<FlowerLineWidget> {
  bool isDragging = false;
  double dragStartAnimationValue = 0;
  double dragOffset = 0;

  double get contentWidth => widget.currentList.length * 200;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onHorizontalDragStart: (DragStartDetails details) {
          setState(() {
            isDragging = true;
            dragStartAnimationValue = widget.currentAnimation.value;
            dragOffset = 0;
          });
        },
        onHorizontalDragUpdate: (DragUpdateDetails details) {
          setState(() {
            dragOffset += details.delta.dx;
          });
        },
        onHorizontalDragEnd: (DragEndDetails details) {
          // 드래그한 거리를 애니메이션 값으로 변환 (정규화)
          final double draggedAnimationValue = -dragOffset / contentWidth;
          final double newAnimationValue =
              (dragStartAnimationValue + draggedAnimationValue) % 1.0;

          // 상위 위젯에서 애니메이션 컨트롤러 업데이트
          widget.onDragEnd(newAnimationValue);

          setState(() {
            isDragging = false;
            dragOffset = 0;
          });
        },
        child: AnimatedBuilder(
          animation: widget.currentAnimation,
          builder: (BuildContext context, Widget? child) =>
              SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            child: Transform.translate(
              offset: Offset(
                isDragging
                    ? -dragStartAnimationValue * contentWidth + dragOffset
                    : -widget.currentAnimation.value * contentWidth,
                0,
              ),
              child: Builder(builder: (BuildContext context) {
                final bool isMobile = MediaQuery.of(context).size.width < 768;
                return SizedBox(
                  height: isMobile ? 100 : 120,
                  child: Row(
                    children: <Widget>[
                      ...List<Widget>.generate(
                        widget.currentList.length,
                        (int index) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          child: Text(
                            widget.currentList[index],
                            style: AppTextStyles.textB20.copyWith(
                              color: widget.currentList[index] == 'ㅁ'
                                  ? AppColors.searchMain
                                  : AppColors.white,
                              fontSize: isMobile ? 80 : 100,
                            ),
                          ),
                        ),
                      ),
                      ...List<Widget>.generate(
                        widget.currentList.length,
                        (int index) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          child: Text(
                            widget.currentList[index],
                            style: AppTextStyles.textB20.copyWith(
                              color: widget.currentList[index] == 'ㅁ'
                                  ? AppColors.searchMain
                                  : AppColors.white,
                              fontSize: isMobile ? 80 : 100,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      );
}
