import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../routes/routes.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';
import '../../common/const/mock/mock_data.dart';
import '../../common/widgets/back_icon_button_widget.dart';

class GyeonView extends ConsumerStatefulWidget {
  const GyeonView({super.key});

  @override
  ConsumerState<GyeonView> createState() => _GyeonViewState();
}

class _GyeonViewState extends ConsumerState<GyeonView> {
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
          backgroundColor: AppColors.gyeonMain,
          leading: const BackIconButton(
            beginColor: AppColors.white,
            endColor: AppColors.gyeonGray1,
          ),
          centerTitle: false,
          titleSpacing: 0,
          toolbarHeight: 78,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '경슐랭 메뉴판',
                style: AppTextStyles.textTenada.copyWith(
                  color: AppColors.white,
                  fontSize: 28,
                  height: 1.1,
                ),
              ),
              Text(
                '경기대학교 학식당 메뉴판 웹사이트',
                style: AppTextStyles.textL12.copyWith(
                  fontSize: 14,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                launchUrl(
                  Uri.parse('https://menu-plate-prod.vercel.app/'),
                  mode: LaunchMode.externalNonBrowserApplication,
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: AppColors.white,
              ),
              child: const Text(
                '바로가기',
                style: AppTextStyles.textB14,
              ),
            ),
            const SizedBox(width: 16),
          ],
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
              child: Container(
                alignment: Alignment.topCenter,
                constraints: const BoxConstraints(
                  maxWidth: 1024,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 12),
                    const _OverViewWidget(),
                    const SizedBox(height: 12),
                    ...List<Widget>.generate(
                      MockData.gyeonSectionExplainModels.length,
                      (int index) => _SectionWidget(
                        id: MockData.gyeonSectionExplainModels[index].id,
                        tag: MockData.gyeonSectionExplainModels[index].tag,
                        title: MockData.gyeonSectionExplainModels[index].title,
                        subTitle:
                            MockData.gyeonSectionExplainModels[index].subTitle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class _OverViewWidget extends StatefulWidget {
  const _OverViewWidget();

  @override
  State<_OverViewWidget> createState() => _OverViewWidgetState();
}

class _OverViewWidgetState extends State<_OverViewWidget> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.gyeonMain,
            width: 2,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Overview', style: AppTextStyles.textB20),
            const SizedBox(height: 12),
            ...List<Widget>.generate(
              MockData.gyeonExplainModels.length,
              (int index) => _TextWidgetRow(
                title: MockData.gyeonExplainModels[index].title,
                value: MockData.gyeonExplainModels[index].explain,
              ),
            ),
          ],
        ),
      );
}

class _SectionWidget extends StatefulWidget {
  const _SectionWidget({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.tag,
  });

  final String id;
  final String title;
  final String subTitle;
  final String tag;
  @override
  State<_SectionWidget> createState() => _SectionWidgetState();
}

class _SectionWidgetState extends State<_SectionWidget> {
  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: widget.id == '5'
                  ? AppColors.transparent
                  : AppColors.gyeonGray1,
            ),
          ),
        ),
        child: InkWell(
          onTap: () {
            context.goNamed(
              Routes.gyeonDetail.name,
              pathParameters: <String, String>{
                'id': widget.id,
              },
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 16,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: AppColors.gyeonGray1,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Icons.image,
                        color: AppColors.gray600,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '이미지 준비중',
                        style: AppTextStyles.textL12.copyWith(
                          color: AppColors.gray600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.gyeonMain,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          widget.tag,
                          style: AppTextStyles.textL12.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.title,
                        style: AppTextStyles.textB16,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.subTitle,
                        style: AppTextStyles.textL12.copyWith(
                          color: AppColors.gray600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class _TextWidgetRow extends StatelessWidget {
  const _TextWidgetRow({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(bottom: 12),
        constraints: const BoxConstraints(
          maxWidth: 1024,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 90,
              child: Text(
                title,
                style: AppTextStyles.textR14,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(child: Text(value, style: AppTextStyles.textB14)),
          ],
        ),
      );
}
