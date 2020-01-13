import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:v4f/core/sh_paint_viewport.dart';

abstract class DatePaint {
  final Color color;
  final ShCanvasViewPort viewPort;
  final Canvas canvas;
  final double fontSize;
  final List<DateTime> dates;
  final double plotInterval;

  DatePaint({
    @required this.dates,
    @required this.plotInterval,
    @required this.color,
    @required this.viewPort,
    @required this.canvas,
    @required this.fontSize,
  });

  double dateToDouble(DateTime dateTime) {
    return dateTime.millisecondsSinceEpoch.toDouble();
  }

  hitTest(double a, double b) {
    return (a - b).abs() < plotInterval;
  }

  drawScale(Canvas canvas, ShCanvasViewPort viewPort, double x) {
    final y = viewPort.screen.bottom - fontSize * 2;
    canvas.drawRect(
      Rect.fromPoints(
        Offset(x - .5, y - 6),
        Offset(x + .5, y - 1),
      ),
      Paint()
        ..color = color
        ..style = PaintingStyle.fill,
    );
  }

  drawText(Canvas canvas, Offset offset, String text) {
    TextPainter(
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
      text: TextSpan(
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w400,
          fontSize: fontSize,
        ),
        text: text,
      ),
    )
      ..layout()
      ..paint(
        canvas,
        offset,
      );
  }

  draw();
}
