import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../routes/routes.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';

class HeaderWidget extends StatefulWidget implements PreferredSizeWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();

  @override
  Size get preferredSize => const Size(double.infinity, 64);
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool isMobile = constraints.maxWidth < 768;

          if (constraints.maxWidth > 1200) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 1200,
                  child: buildHeader(
                    context: context,
                    isMobile: isMobile,
                  ),
                ),
              ],
            );
          }

          return buildHeader(
            context: context,
            isMobile: isMobile,
          );
        },
      );

  Widget buildHeader({
    required BuildContext context,
    required bool isMobile,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeInOut,
              style: AppTextStyles.textB16.copyWith(
                fontSize: isMobile ? 16 : 24,
              ),
              child: GestureDetector(
                onTap: () {
                  context.goNamed(Routes.home.name);
                },
                child: const Text(
                  'Ma Jae Hoon',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <String>['RESUME', 'GITHUB']
                  .map(
                    (String item) => MenuItem(
                      item: item,
                      isMobile: isMobile,
                      onTap: () {
                        if (item == 'RESUME') {
                          context.goNamed(Routes.resume.name);
                        } else {
                          launchUrl(Uri.parse('https://github.com/bluekmky1'));
                        }
                      },
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      );
}

class MenuItem extends StatefulWidget {
  const MenuItem({
    required this.item,
    required this.isMobile,
    required this.onTap,
    super.key,
  });

  final String item;
  final bool isMobile;
  final VoidCallback onTap;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) =>
          GestureDetector(
            onTap: widget.onTap,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (_) {
                setState(() => isHovered = true);
              },
              onExit: (_) {
                setState(() => isHovered = false);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.easeInOut,
                  style: AppTextStyles.textL12.copyWith(
                    color: isHovered ? AppColors.orange : AppColors.black,
                    fontSize: widget.isMobile ? 12 : 16,
                  ),
                  child: Text(
                    widget.item,
                  ),
                ),
              ),
            ),
          ));
}
