import 'package:curie_money_dev/l10n/l10n.dart';
import 'package:curie_money_dev/utils/utils.dart';
import 'package:curie_money_dev/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});

  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      appBar: AppBar(backgroundColor: AppColors.primaryBlue, actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ))
      ]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.black87,
                    child: Icon(Icons.person, color: Colors.orange),
                  ),
                ),
                Icon(Icons.chevron_right, color: Colors.white),
                CircleAvatar(
                  radius: 30,
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.black87,
                    child: Icon(Icons.bus_alert_outlined, color: Colors.orange),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.toResponsiveHeight(context)),
            Text(
              textAlign: TextAlign.center,
              context.l10n.paymentTo,
              style:
                  context.textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
            SizedBox(height: 30.toResponsiveHeight(context)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.l10n.rupeeSymbol,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                  ),
                ),
                IntrinsicWidth(
                  child: TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    style: context.textTheme.displayLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                    ],
                    decoration: InputDecoration.collapsed(
                      hintText: '0',
                      hintStyle: context.textTheme.displayLarge?.copyWith(
                          color: Colors.white70, fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              textAlign: TextAlign.center,
              context.l10n.paymentVia,
              style:
                  context.textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 7),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              child: Column(
                children: [
                  Row(children: [
                    const Icon(
                      Icons.credit_card_rounded,
                      color: Colors.black54,
                    ),
                    SizedBox(width: 7.toResponsiveWidth(context)),
                    Text(
                      context.l10n.bankAccount,
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.keyboard_arrow_down),
                  ]),
                  SizedBox(height: 30.toResponsiveHeight(context)),
                  SizedBox(
                    width: context.screenWidth,
                    child: PrimaryButton(
                      color: AppColors.primaryBlue,
                      child: Text(context.l10n.proceedToPayBtnText),
                      onPressed: () => _amountController.text.isEmpty
                          ? null
                          : context.push(
                              SecondScreen(
                                amount: double.parse(_amountController.text),
                              ),
                            ),
                    ),
                  ),
                  SizedBox(height: 12.toResponsiveHeight(context)),
                  Text(
                    context.l10n.partnershipLabelText,
                    style: context.textTheme.labelSmall?.copyWith(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
