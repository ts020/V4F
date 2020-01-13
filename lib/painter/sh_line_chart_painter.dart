import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';
import 'package:v4f/core/core.dart';
import 'package:v4f/core/sh_painter.dart';

class LinePainter extends ShPainter {
  final Color color;
  final List<Offset> points;
  final Paint _linePaint;
  final LineBuilder _lineBuilder;
  LinePainter({
    @required this.color,
    @required this.points,
    @required Rect world,
    EdgeInsets padding = defaultPadding,
    double strokeWidth = 2.0,
    LineBuilder lineBuilder,
  })  : _linePaint = Paint()
          ..color = color
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth,
        _lineBuilder = lineBuilder ?? Lines.Curve,
        super(
          world: world,
          padding: padding,
        );

  @override
  draw(Canvas canvas, ShCanvasViewPort viewPort) {
    final path = Path();
    _lineBuilder(path, viewPort, points);
    canvas.drawPath(
      path,
      _linePaint,
    );
  }
}

typedef void LineBuilder(
    Path path, ShCanvasViewPort viewPort, List<Offset> points);

class Lines {
  static final LineBuilder Solid =
      (Path path, ShCanvasViewPort viewPort, List<Offset> points) {
    path.moveTo(
      viewPort.xScale.toScreen(points[0].dx),
      viewPort.yScale.toScreen(points[0].dy),
    );
    points.sublist(1).forEach((next) {
      path.lineTo(
        viewPort.xScale.toScreen(next.dx),
        viewPort.yScale.toScreen(next.dy),
      );
    });
  };

  static final LineBuilder Curve =
      (Path path, ShCanvasViewPort viewPort, List<Offset> points) {
    path.moveTo(
      viewPort.xScale.toScreen(points[0].dx),
      viewPort.yScale.toScreen(points[0].dy),
    );
    Offset prev = points[0];
    Offset current = points[0];
    points.sublist(1).forEach((next) {
      path.quadraticBezierTo(
        viewPort.xScale.toScreen(current.dx - (prev.dx - current.dx) / 5.25),
        viewPort.yScale.toScreen(current.dy - (prev.dy - current.dy) / 5.25),
        viewPort.xScale.toScreen(next.dx),
        viewPort.yScale.toScreen(next.dy),
      );
      prev = current;
      current = next;
    });
  };
}
