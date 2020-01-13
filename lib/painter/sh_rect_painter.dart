import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:v4f/core/core.dart';

class RectPainter extends ShPainter {
  final Color color;
  final List<Rect> rectList;
  final Paint _paint;
  RectPainter({
    @required this.color,
    @required this.rectList,
    @required Rect world,
    EdgeInsets padding = defaultPadding,
  })  : _paint = Paint()..color = color,
        super(
          world: world,
          padding: padding,
        );

  @override
  draw(Canvas canvas, ShCanvasViewPort viewPort) {
    rectList.forEach((rect) {
      canvas.drawRect(
        Rect.fromLTRB(
          viewPort.xScale.toScreen(rect.left),
          viewPort.yScale.toScreen(rect.top),
          viewPort.xScale.toScreen(rect.right),
          viewPort.yScale.toScreen(rect.bottom),
        ),
        _paint,
      );
    });
  }
}
