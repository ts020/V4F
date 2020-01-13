import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:v4f/core/core.dart';
import 'package:v4f/core/sh_scales.dart';

class Plot {
  final double x;
  final double y;
  final double value;
  Plot(this.x, this.y, [this.value = 1]);
}

class PlotsPainter extends ShPainter {
  final Color color;
  final Color strokeColor;
  final List<Plot> points;
  final double radius;
  final double strokeWidth;
  final Paint _paint;
  final LinearScale valueScale;
  PlotsPainter({
    @required this.points,
    @required Rect world,
    this.color = Colors.white,
    this.strokeColor,
    this.radius = 4,
    this.strokeWidth = 1,
    this.valueScale,
    EdgeInsets padding = defaultPadding,
  })  : _paint = Paint()..color = color,
        super(
          world: world,
          padding: padding,
        );

  @override
  draw(Canvas canvas, ShCanvasViewPort viewPort) {
    final Color _strokeColor =
        strokeColor ?? Color.fromRGBO(0, 0, 0, 1);
    final strokePaint = Paint()
      ..color = _strokeColor
      ..style = PaintingStyle.fill;
    points.forEach((point) {
      canvas.drawCircle(
        Offset(
          viewPort.xScale.toScreen(point.x),
          viewPort.yScale.toScreen(point.y),
        ),
        (valueScale?.toScreen(point.value) ?? radius) + strokeWidth * 2,
        strokePaint,
      );
      canvas.drawCircle(
        Offset(
          viewPort.xScale.toScreen(point.x),
          viewPort.yScale.toScreen(point.y),
        ),
        valueScale?.toScreen(point.value) ?? radius,
        _paint,
      );
    });
  }
}
