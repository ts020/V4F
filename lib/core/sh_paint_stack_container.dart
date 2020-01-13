import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:v4f/core/sh_painter.dart';

class PaintStackContainer extends StatelessWidget {
  final List<ShPainter> painters;
  final Widget child;
  PaintStackContainer({
    @required this.painters,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: child,
      foregroundPainter: _Painter(painters),
    );
  }
}

class _Painter extends CustomPainter {
  final List<ShPainter> painters;
  _Painter(this.painters);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Rect.fromLTRB(0, 0, size.width, size.height));
    painters.forEach((layer) => layer.drawExec(canvas, size));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
