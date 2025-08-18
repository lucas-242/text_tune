import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_tune/presenter/auth/auth_provider.dart';
import 'package:text_tune/shared/themes/themes.dart';

class LoginButton extends StatelessWidget {
  const LoginButton.private({super.key, required this.onTap})
      : _title = 'Entrar',
        _color = null,
        _icon = null;

  const LoginButton.google({super.key, required this.onTap})
      : _title = 'Entar com Google',
        _color = AppColors.greenDark,
        _icon = Icons.g_mobiledata;

  const LoginButton.apple({super.key, required this.onTap})
      : _title = 'Entar com Apple',
        _color = AppColors.black,
        _icon = Icons.apple;

  final String _title;
  final Color? _color;
  final IconData? _icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final authProvider = context.read<AuthProvider>();

    if (_icon == null) {
      return ElevatedButton(
        onPressed: authProvider.isLoading ? null : onTap,
        child: Text(
          _title,
          style: AppTextStyles.titleMd.copyWith(color: AppColors.greenDark),
        ),
      );
    }
    return ElevatedButton.icon(
      icon: Icon(_icon, size: 32),
      label: Text(
        _title,
        style: AppTextStyles.titleMd.copyWith(color: AppColors.white),
      ),
      onPressed: authProvider.isLoading ? null : onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: _color,
        foregroundColor: AppColors.white,
      ),
    );
  }
}
