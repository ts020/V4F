import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:v4f/core/sh_scales.dart';

const defaultRect = Rect.fromLTWH(0, 0, 1, 1);

class ShCanvasViewPort {
  final Rect world;
  final Rect screen;
  final LinearScale xScale;
  final LinearScale yScale;

  ShCanvasViewPort(this.world, this.screen)
      : xScale = LinearScale()
            .world(world.left, world.right)
            .screen(screen.left, screen.right),
        yScale = LinearScale()
            .world(world.top, world.bottom)
            .screen(screen.top, screen.bottom);
}
