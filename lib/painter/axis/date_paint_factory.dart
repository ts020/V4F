import 'package:flutter/cupertino.dart';
import 'package:v4f/core/core.dart';

import 'date_paint.dart';
import 'day_label_paint.dart';
import 'hour_label_paint.dart';

DatePaint datePaintFactory({
  @required List<DateTime> dates,
  @required double plotInterval,
  @required Color color,
  @required ShCanvasViewPort viewPort,
  @required Canvas canvas,
  @required double fontSize,
}) {
  final range = Duration(
      milliseconds: (viewPort.world.left - viewPort.world.right).abs().floor());
  if (range.inDays < 3) {
    return HourLabelPaint(
      dates: dates,
      plotInterval: plotInterval,
      color: color,
      viewPort: viewPort,
      canvas: canvas,
      fontSize: fontSize,
    );
  } else {
    return DayLabelPaint(
      dates: dates,
      plotInterval: plotInterval,
      color: color,
      viewPort: viewPort,
      canvas: canvas,
      fontSize: fontSize,
    );
  }
}
