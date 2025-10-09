import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/routes.dart';

class BackIconButton extends StatefulWidget {
  const BackIconButton({
    this.beginColor = Colors.black,
    this.endColor = Colors.orange,
    this.onPressed,
    super.key,
  });

  final Color? beginColor;
  final Color? endColor;
  final VoidCallback? onPressed;

  @override
  State<BackIconButton> createState() => _BackIconButtonState();
}

class _BackIconButtonState extends State<BackIconButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) => MouseRegion(
        onEnter: (_) {
          setState(() => isHovered = true);
        },
        onExit: (_) {
          setState(() => isHovered = false);
        },
        child: GestureDetector(
          onTap: () {
            if (widget.onPressed != null) {
              widget.onPressed!();
            } else {
              context.goNamed(Routes.home.name);
            }
          },
          child: TweenAnimationBuilder<Color?>(
            tween: ColorTween(
              begin: widget.beginColor,
              end: isHovered ? widget.endColor : widget.beginColor,
            ),
            duration: const Duration(milliseconds: 150),
            builder: (_, Color? color, __) => Icon(
              Icons.arrow_back_ios_outlined,
              color: color,
              size: 24,
            ),
          ),
        ),
      );
}
