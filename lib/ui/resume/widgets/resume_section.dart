import 'package:flutter/material.dart';

import '../../../theme/app_text_styles.dart';
import '../../common/const/mock/mock_model.dart';
import 'text_row_widget.dart';

class ResumeSection extends StatelessWidget {
  const ResumeSection({
    required this.title,
    required this.modelList,
    super.key,
  });

  final String title;
  final List<ResumeTileModel> modelList;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 16),
                SizedBox(
                  width: constraints.maxWidth > 450 ? 100 : 70,
                  child: Text(
                    title,
                    style: AppTextStyles.textSb16,
                    textAlign: TextAlign.right,
                  ),
                ),
                ...modelList.map((ResumeTileModel model) => Column(
                      children: <Widget>[
                        const SizedBox(height: 8),
                        TextRowWidget(
                          title: model.title,
                          value: model.value,
                          subValue: model.subValue,
                        ),
                      ],
                    )),
              ],
            ),
          ));
}
