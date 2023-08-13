import 'package:curie_money_dev/l10n/l10n.dart';
import 'package:curie_money_dev/utils/src/pin_field.dart';
import 'package:curie_money_dev/utils/utils.dart';
import 'package:curie_money_dev/views/src/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key, required this.amount});

  final double amount;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final _controller = TextEditingController();
  final ValueNotifier<bool> obscureText = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.upiBlue),
      child: Scaffold(
        backgroundColor: AppColors.lotion,
        body: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.l10n.iciciBank),
                  SvgPicture.asset(
                    AppIcon.icUpi,
                    width: 80,
                    height: 50,
                  ),
                ],
              ),
            ),
            Container(
              color: AppColors.upiBlue,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: Row(
                children: [
                  Text(
                    context.l10n.iciciBank,
                    style: context.textTheme.bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  const Spacer(),
                  Text(
                    '${context.l10n.rupeeSymbol}${widget.amount}',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 40.toResponsiveHeight(context)),
            Column(
              children: [
                SizedBox(
                  width: context.screenWidth * 0.55,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(context.l10n.enterUpiPin.toUpperCase(),
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          )),
                      IconButton(
                        onPressed: () => obscureText.value = !obscureText.value,
                        icon: Row(
                          children: [
                            Icon(Icons.remove_red_eye,
                                color: AppColors.upiBlue),
                            const SizedBox(width: 7),
                            Text(
                              context.l10n.showBtnLabel.toUpperCase(),
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: AppColors.upiBlue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 12.toResponsiveHeight(context)),
                ValueListenableBuilder(
                  valueListenable: obscureText,
                  builder: (context, value, child) => PinField(
                    pinController: _controller,
                    obscureText: value,
                  ),
                ),
              ],
            ),
            const Spacer(),
            NumericKeyboard(
              onKeyboardTap: (text) => _controller.append(text, 4),
              leftButtonFn: () => _controller.delete(),
              rightButtonFn: () => context.pushReplacement(
                ThirdScreen(amount: widget.amount),
              ),
              textColor: AppColors.upiBlue,
              leftIcon: Icon(Icons.backspace, color: AppColors.upiBlue),
              rightIcon: Icon(
                Icons.check_circle,
                color: AppColors.upiBlue,
                size: context.screenWidth * 0.18,
              ),
            )
          ],
        )),
      ),
    );
  }
}
