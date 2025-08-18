import 'package:flutter/material.dart';
import 'package:text_tune/shared/themes/settings/app_colors.dart';
import 'package:text_tune/shared/themes/settings/app_insets.dart';
import 'package:text_tune/shared/themes/settings/app_spacings.dart';
import 'package:text_tune/shared/themes/settings/app_text_styles.dart';

class ProcessTab extends StatefulWidget {
  const ProcessTab({super.key});
  @override
  State<ProcessTab> createState() => _ProcessTabState();
}

class _ProcessTabState extends State<ProcessTab> {
  final _controller = TextEditingController();
  String processedText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppInsets.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _controller,
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: 'Digite seu texto aqui',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(AppInsets.lg),
            ),
          ),
          AppSpacings.verticalMd,
          ElevatedButton(
            onPressed: () {
              setState(() {
                processedText = _controller.text;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.greenDark,
            ),
            child: Text(
              'Melhorar Texto',
              style: AppTextStyles.titleMd.copyWith(color: AppColors.white),
            ),
          ),
          AppSpacings.verticalLg,
          if (processedText.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(AppInsets.md),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.greenDark),
                borderRadius: BorderRadius.circular(AppInsets.sm),
                color: AppColors.greenDark.withOpacity(0.05),
              ),
              child: Text(
                processedText,
                style: AppTextStyles.lg,
              ),
            ),
        ],
      ),
    );
  }
}
