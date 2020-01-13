import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';
import 'package:v4f/core/core.dart';

import 'axis/date_paint_factory.dart';

const _defaultFontSize = 14.0;

class XAxisPainter extends ShPainter {
  final Color color;
  final List<DateTime> dates;
  final double fontSize;
  double _plotInterval;
  XAxisPainter({
    @required this.color,
    @required this.dates,
    @required Rect world,
    this.fontSize = _defaultFontSize,
    double plotMargin,
    EdgeInsets padding = defaultPadding,
  })  : _plotInterval = plotMargin ?? fontSize * 2,
        super(
          world: world,
          padding: padding,
        );

  @override
  draw(Canvas canvas, ShCanvasViewPort viewPort) {
    _drawLine(canvas, viewPort);
    datePaintFactory(
      dates: dates,
      plotInterval: _plotInterval,
      color: color,
      viewPort: viewPort,
      canvas: canvas,
      fontSize: fontSize,
    ).draw();
  }

  _drawLine(Canvas canvas, ShCanvasViewPort viewPort) {
    final y = viewPort.screen.bottom - fontSize * 2;
    canvas.drawRect(
      Rect.fromPoints(
        Offset(viewPort.screen.left, y - 1),
        Offset(viewPort.screen.right, y - 2),
      ),
      Paint()
        ..color = color
        ..style = PaintingStyle.fill,
    );
  }
}
