import 'package:flutter/material.dart';

final class AnimatedView extends StatelessWidget {
  const AnimatedView({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 1, end: 0),
      curve: Curves.fastOutSlowIn,
      key: UniqueKey(),
      duration: const Duration(milliseconds: 1500),
      builder: (context, animation, _) => Transform.translate(
        offset: Offset(0, 1 * animation * 3),
        child: Opacity(
          opacity: 1 - animation,
          child: child,
        ),
      ),
    );
  }
}
