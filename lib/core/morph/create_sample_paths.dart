import 'dart:ui';

import 'package:v4f/core/morph/sampled_path_data.dart';

SampledPathData createSamplePaths(Path path1, Path path2,
    {double precision = 0.01}) {
  var data = SampledPathData();
  var k = 0;
  path1.computeMetrics().forEach((metric) {
    for (var i = 0.0; i < 1.1; i += precision) {
      Offset position = metric.getTangentForOffset(metric.length * i).position;
      data.points1.add(position);
      data.shiftedPoints.add(position);
    }
  });
  path2.computeMetrics().forEach((metric) {
    data.endIndices.add(k);
    for (var i = 0.0; i < 1.1; i += precision) {
      k += 1;
      data.points2.add(metric.getTangentForOffset(metric.length * i).position);
    }
  });
  return data;
}
