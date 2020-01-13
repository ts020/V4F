import 'package:flutter/animation.dart';
import 'package:v4f/core/morph/sampled_path_data.dart';

/// Generates a bunch of animations that are responsible for moving
/// all the points of paths into the right positions.
void generateAnimations(
    AnimationController controller, SampledPathData data, Function func) {
  for (var i = 0; i < data.points1.length; i++) {
    var start = data.points1[i];
    var end = data.points2[i];
    var tween = Tween(begin: start, end: end);
    var animation = tween.animate(controller);
    animation.addListener(() {
      func(i, animation.value);
    });
  }
}
