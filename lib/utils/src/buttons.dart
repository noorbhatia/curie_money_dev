import 'package:curie_money_dev/utils/src/colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.color,
    required this.child,
    this.onPressed,
    this.textColor,
  });

  final Color color;
  final Color? textColor;
  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      textColor: textColor ?? Colors.white,
      disabledColor: AppColors.disabledForeground,
      color: onPressed == null ? AppColors.disabledForeground : color,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
