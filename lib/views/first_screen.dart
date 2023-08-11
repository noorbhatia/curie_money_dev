import 'package:curie_money_dev/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

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
                  child:
                      CircleAvatar(radius: 28, backgroundColor: Colors.black),
                ),
                Icon(Icons.chevron_right, color: Colors.white),
                CircleAvatar(
                  radius: 30,
                  child:
                      CircleAvatar(radius: 28, backgroundColor: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 12.toResponsiveHeight(context)),
            Text(
              textAlign: TextAlign.center,
              'Payment to red bus\n(redbus@axis)',
              style:
                  context.textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
            SizedBox(height: 30.toResponsiveHeight(context)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\u20b9 ',
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                  ),
                ),
                IntrinsicWidth(
                  child: TextField(
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
              'Payment via Billdesk',
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
                  const Row(children: [
                    Icon(Icons.credit_card_rounded),
                    Text('Your Bank .... 6321'),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_down),
                  ]),
                  SizedBox(height: 30.toResponsiveHeight(context)),
                  SizedBox(
                    width: context.screenWidth,
                    child: MaterialButton(
                      color: AppColors.primaryBlue,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      textColor: Colors.white,
                      onPressed: () {},
                      child: const Text('Proceed to pay'),
                    ),
                  ),
                  SizedBox(height: 12.toResponsiveHeight(context)),
                  Text(
                    'IN PARTNERSHIP WITH YOUR BANK',
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
