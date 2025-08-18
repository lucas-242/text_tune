import 'package:flutter/material.dart';
import 'package:text_tune/shared/themes/settings/app_colors.dart';
import 'package:text_tune/shared/themes/settings/app_insets.dart';
import 'package:text_tune/shared/themes/settings/app_spacings.dart';
import 'package:text_tune/shared/themes/settings/app_text_styles.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  String _formatDate(DateTime date) =>
      '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> history = [];

    if (history.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.history,
              size: 64,
              color: AppColors.greenDark.withOpacity(0.3),
            ),
            AppSpacings.verticalMd,
            Text(
              'Nenhum texto processado ainda',
              style: AppTextStyles.lg.copyWith(
                color: AppColors.textLight,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppInsets.lg),
      itemCount: history.length,
      itemBuilder: (context, index) {
        final item = history[index];
        return Card(
          margin: const EdgeInsets.only(bottom: AppInsets.md),
          child: Padding(
            padding: const EdgeInsets.all(AppInsets.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${item['style']} • ${item['language']}',
                  style: AppTextStyles.lg.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.greenDark,
                  ),
                ),
                AppSpacings.verticalSm,
                Text(
                  'Original: ${item['originalText']}',
                  style: AppTextStyles.md,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                AppSpacings.verticalXs,
                Text(
                  'Resultado: ${item['processedText']}',
                  style: AppTextStyles.md.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    _formatDate(item['timestamp']),
                    style: AppTextStyles.sm.copyWith(
                      color: AppColors.textLight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
