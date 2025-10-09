import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';

class TextRowWidget extends StatelessWidget {
  const TextRowWidget({
    required this.title,
    required this.value,
    this.subValue,
    super.key,
  });

  final String title;
  final String value;
  final String? subValue;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => Row(
            children: <Widget>[
              SizedBox(
                width: constraints.maxWidth > 450 ? 100 : 70,
                child: Text(
                  title,
                  textAlign: TextAlign.right,
                  style: AppTextStyles.textR12.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
              SizedBox(width: constraints.maxWidth > 450 ? 32 : 16),
              Expanded(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 300,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        value,
                        style: AppTextStyles.textSb16.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      if (subValue != null)
                        Text(
                          subValue!,
                          style: AppTextStyles.textL12.copyWith(
                            color: AppColors.gray600,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ));
}
