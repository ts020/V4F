import 'package:flutter/widgets.dart';
import 'package:v4f/core/core.dart';

const defaultPadding = const EdgeInsets.all(0);

abstract class ShPainter {
  final Rect _world;
  final EdgeInsets _padding;

  ShPainter({
    @required Rect world,
    EdgeInsets padding = defaultPadding,
  })  : _world = world,
        _padding = padding;

  drawExec(Canvas canvas, Size size) {
    draw(
      canvas,
      ShCanvasViewPort(
        _world,
        _padding.deflateRect(
          Rect.fromLTWH(0, 0, size.width, size.height),
        ),
      ),
    );
  }

  draw(Canvas canvas, ShCanvasViewPort viewport);
}
