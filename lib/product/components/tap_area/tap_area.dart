import 'package:flutter/material.dart';

final class TapArea extends StatefulWidget {
  const TapArea({
    required this.child,
    required this.onTap,
    super.key,
    this.onLongTap,
    this.padding,
    this.borderRadius = 0,
  });
  final Widget child;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onLongTap;
  final double borderRadius;
  final EdgeInsets? padding;

  @override
  State<TapArea> createState() => _TapAreaState();
}

final class _TapAreaState extends State<TapArea> {
  final ValueNotifier<bool> _isDown = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _isDown.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: widget.child,
    );

    if (widget.onTap == null && widget.onLongTap == null) return content;

    return GestureDetector(
      onTapDown: (_) {
        _isDown.value = true;
      },
      onTapCancel: () {
        _isDown.value = false;
      },
      onTap: () {
        _isDown.value = false;
        if (widget.onTap != null) widget.onTap!.call();
      },
      onLongPress: widget.onLongTap,
      child: Focus(
        child: ValueListenableBuilder<bool>(
          valueListenable: _isDown,
          builder: (context, isDown, child) {
            return Opacity(
              opacity: isDown ? 0.7 : 1.0,
              child: content,
            );
          },
        ),
      ),
    );
  }
}
