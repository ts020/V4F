import 'dart:ui';

import 'package:v4f/core/morph/sampled_path_data.dart';

/// Generates a path using the [SampledPathData] object.
/// You can use this path while drawing the frames of
/// the morph animation on your canvas.
Path generatePath(SampledPathData data) {
  Path p = Path();
  for (var i = 0; i < data.shiftedPoints.length; i++) {
    for (var j = 0; j < data.endIndices.length; j++) {
      if (i == data.endIndices[j]) {
        p.moveTo(data.shiftedPoints[i].dx, data.shiftedPoints[i].dy);
        break;
      }
    }
    p.lineTo(data.shiftedPoints[i].dx, data.shiftedPoints[i].dy);
  }
  return p;
}
