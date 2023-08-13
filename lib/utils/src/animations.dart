import 'dart:async';
import 'dart:math';

import 'package:curie_money_dev/utils/utils.dart';
import 'package:flutter/material.dart';

class ClickableAnimatedButton extends StatefulWidget {
  const ClickableAnimatedButton({
    Key? key,
    required this.icon,
    required this.color,
  }) : super(key: key);

  final IconData icon;
  final Color color;

  @override
  State<ClickableAnimatedButton> createState() =>
      _ClickableAnimatedButtonState();
}

class _ClickableAnimatedButtonState extends State<ClickableAnimatedButton> {
  final _animatedIconsKeys = <Key>[];
  late final icon = Icon(
    widget.icon,
    color: widget.color,
    size: context.screenWidth * 0.1,
  );
  final iconKey = GlobalKey();

  late final Size size;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final renderBox =
            iconKey.currentContext!.findRenderObject() as RenderBox;
        size = renderBox.size * 2;
        triggerAnimation();
      },
    );
  }

  void triggerAnimation() async {
    setState(() {
      _animatedIconsKeys.addAll(List.generate(20, (index) => UniqueKey()));
    });
    await Future.delayed(Duration(seconds: 1));
    if (mounted) {
      _animatedIconsKeys.remove(UniqueKey());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ..._animatedIconsKeys.map(
          (key) => _AnimatedIcon(key: key, icon: icon, size: size),
        ),
        KeyedSubtree(
          key: iconKey,
          child: icon,
        ),
      ],
    );
  }
}

class _AnimatedIcon extends StatefulWidget {
  const _AnimatedIcon({
    Key? key,
    required this.icon,
    required this.size,
  }) : super(key: key);

  final Widget icon;
  final Size size;

  @override
  State<_AnimatedIcon> createState() => _AnimatedIconState();
}

class _AnimatedIconState extends State<_AnimatedIcon> {
  // Random number between -pi/8 and pi/8
  final originAngle = 2 * pi / 8 * Random().nextDouble() - pi / 8;
  var plusOrMinusX = 1;
  var continueTimer = true;

  // The final y position of the icon
  late final endYOffset =
      -(1.5 + Random().nextDouble()) * widget.size.height * 2;

  final animationDuration = const Duration(seconds: 3);

  @override
  void initState() {
    super.initState();
    animateOnX();
  }

  Future<void> animateOnX() async {
    while (continueTimer) {
      final duration = Duration(milliseconds: (100 + Random().nextInt(100)));
      await Future.delayed(duration);
      if (mounted) {
        setState(() => plusOrMinusX *= -2);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    continueTimer = false;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: originAngle,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: plusOrMinusX * 0.5 * widget.size.width),
        duration: Duration(milliseconds: 300),
        builder: (context, xOffset, child) {
          return TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: endYOffset),
            duration: animationDuration,
            builder: (context, yOffset, child) {
              return TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: animationDuration,
                builder: (context, progress, child) {
                  final fadeStartProgress = 0.5;
                  final fadeDuration =
                      (animationDuration.inMilliseconds * fadeStartProgress)
                          .ceil();

                  return AnimatedOpacity(
                    duration: Duration(milliseconds: fadeDuration),
                    opacity: progress > fadeStartProgress ? 0 : 1,
                    child: child!,
                  );
                },
                child: Transform.translate(
                  offset: Offset(xOffset, yOffset),
                  child: widget.icon,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
