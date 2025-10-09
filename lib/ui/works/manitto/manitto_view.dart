import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../theme/app_colors.dart';
import '../../common/widgets/back_icon_button_widget.dart';

class ManittoView extends ConsumerStatefulWidget {
  const ManittoView({super.key});

  @override
  ConsumerState<ManittoView> createState() => _ManittoViewState();
}

class _ManittoViewState extends ConsumerState<ManittoView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: const BackIconButton(
            endColor: AppColors.manittoSub,
          ),
        ),
        body: const SingleChildScrollView(
          child: Row(),
        ),
      );
}
