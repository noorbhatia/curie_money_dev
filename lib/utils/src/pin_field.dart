import 'package:curie_money_dev/utils/src/colors.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinField extends StatelessWidget {
  const PinField({
    super.key,
    required this.pinController,
    this.pinLength,
    this.obscureText = true,
  });

  final TextEditingController pinController;
  final int? pinLength;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: pinController,
      separatorBuilder: (index) => const SizedBox(width: 15),
      length: pinLength ?? 4,
      submittedPinTheme: PinTheme(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(color: AppColors.cursorGrey),
          ),
        ),
      ),
      followingPinTheme: PinTheme(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(color: AppColors.cursorGrey),
          ),
        ),
      ),
      focusedPinTheme: const PinTheme(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(color: Colors.black),
          ),
        ),
      ),
      showCursor: false,
      onTap: () {},
      useNativeKeyboard: false,
      obscureText: obscureText,
      obscuringCharacter: '*',
    );
  }
}
