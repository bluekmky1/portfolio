import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../theme/app_colors.dart';
import '../../../../theme/app_text_styles.dart';
import '../../../common/widgets/back_icon_button_widget.dart';
import 'detail_state.dart';
import 'detail_view_model.dart';

class GyeonDetailView extends ConsumerStatefulWidget {
  const GyeonDetailView({required this.id, super.key});

  final String id;

  @override
  ConsumerState<GyeonDetailView> createState() => _GyeonDetailViewState();
}

class _GyeonDetailViewState extends ConsumerState<GyeonDetailView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(gyeonDetailViewModelProvider.notifier).onInit(id: widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final GyeonDetailState state = ref.watch(gyeonDetailViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.gyeonMain,
        leading: BackIconButton(
          beginColor: AppColors.white,
          endColor: AppColors.gyeonGray1,
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: <PointerDeviceKind>{
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 768,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 12),
                      Row(
                        children: <Widget>[
                          Text(
                            state.title,
                            style: AppTextStyles.textB20.copyWith(
                              color: AppColors.gyeonMain,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      state.explainWidgetList,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
