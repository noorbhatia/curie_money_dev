import 'dart:math';

import 'package:curie_money_dev/l10n/l10n.dart';
import 'package:curie_money_dev/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key, required this.amount});

  final double amount;

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _transactionInProgress = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween(begin: 0.0, end: pi).animate(_controller)
      ..addListener(() => setState(() {}));
    _controller.repeat();
    _stopAnimating();
  }

  void _stopAnimating() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() => _transactionInProgress = false);
    _controller.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueberry,
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'check',
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 700),
                    child: _transactionInProgress
                        ? AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) =>
                          Transform(
                            transform: Matrix4.rotationY(_animation.value),
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              radius: context.screenWidth * 0.12,
                              backgroundColor: Colors.white,
                              child: const ClickableAnimatedButton(
                                icon: Icons.currency_rupee,
                                color: Colors.green,
                              ),
                            ),
                          ),
                    )
                        : Icon(
                      Icons.check_circle_sharp,
                      size: context.screenWidth * 0.3,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 40.toResponsiveHeight(context)),
                if (!_transactionInProgress)
                  Column(
                    children: [
                      Text(
                        '${context.l10n.rupeeSymbol}${widget.amount} paid',
                        style: context.textTheme.headlineMedium?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 30.toResponsiveHeight(context)),
                      Text(
                        'Max Life Pharma',
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'mlp19230@upi',
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  )
                else
                  _LoadingShimmer(),
                SizedBox(height: 60.toResponsiveHeight(context)),
                AnimatedCrossFade(
                  duration: Duration(milliseconds: 400),
                  firstChild: SizedBox.shrink(),
                  crossFadeState: _transactionInProgress ? CrossFadeState
                      .showFirst : CrossFadeState.showSecond,
                  secondChild: PrimaryButton(
                    color: AppColors.blueberryDark,
                    child: Text(context.l10n.doneBtnText),
                    onPressed: () => context.pop(),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class _LoadingShimmer extends StatelessWidget {
  const _LoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.blueberryDark,
      highlightColor: AppColors.lotion,
      enabled: true,
      child: Column(
        children: [
          Container(
            height: 20,
            width: context.screenWidth * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.lotion,
            ),
          ),
          SizedBox(height: 30.toResponsiveHeight(context)),
          Container(
            height: 10,
            width: context.screenWidth * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.lotion,
            ),
          ),
          const SizedBox(height: 7),
          Container(
            height: 8,
            width: context.screenWidth * 0.32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.lotion,
            ),
          ),
        ],
      ),
    );
  }
}
