import 'dart:ui';

class SampledPathData {
  var points1;
  var points2;
  var endIndices;
  var shiftedPoints;

  SampledPathData() {
    points1 = List<Offset>();
    points2 = List<Offset>();
    shiftedPoints = List<Offset>();
    endIndices = List<int>();
  }
}
