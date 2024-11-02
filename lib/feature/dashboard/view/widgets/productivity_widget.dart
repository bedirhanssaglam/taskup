part of '../dashboard_view.dart';

final class ProductivityWidget extends StatelessWidget {
  const ProductivityWidget({
    required this.percent,
    super.key,
  });

  final double percent;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: CustomPaint(
        painter: HalfGaugePainter(
          percent: percent,
        ),
      ),
    );
  }
}

final class HalfGaugePainter extends CustomPainter {
  HalfGaugePainter({
    required this.percent,
  });

  final double percent;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2 - 30 / 2;

    final backgroundPaint = Paint()
      ..color = CupertinoColors.systemGrey
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi,
      pi,
      false,
      backgroundPaint,
    );

    final percentPaint = Paint()
      ..color = TaskStatistics.completed.color
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final percentAngle = percent * pi / 100;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi,
      percentAngle,
      false,
      percentPaint,
    );

    final textSpan = TextSpan(
      text: '${percent.round()}%',
      style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: size.width);

    final xTextPosition = (size.width - textPainter.width) / 2;
    final yTextPosition = (size.height - textPainter.height) * 3 / 4;
    final textOffset = Offset(xTextPosition, yTextPosition);
    textPainter.paint(canvas, textOffset);
  }

  @override
  bool shouldRepaint(covariant HalfGaugePainter oldDelegate) {
    return oldDelegate.percent != percent;
  }
}
