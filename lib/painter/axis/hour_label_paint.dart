import 'package:date_format/date_format.dart';
import 'package:flutter/widgets.dart';
import 'package:v4f/core/sh_paint_viewport.dart';

import 'date_paint.dart';

class HourLabelPaint extends DatePaint {
  HourLabelPaint({
    @required List<DateTime> dates,
    @required double plotInterval,
    @required Color color,
    @required ShCanvasViewPort viewPort,
    @required Canvas canvas,
    @required double fontSize,
  }) : super(
          dates: dates,
          plotInterval: fontSize * 3,
          color: color,
          viewPort: viewPort,
          canvas: canvas,
          fontSize: fontSize,
        );

  @override
  draw() {
    DateTime last;
    for (int i = 0; i < dates.length; i++) {
      final date = dates[i];
      final dateDouble = dateToDouble(date);
      if (viewPort.world.left > dateDouble &&
          dateDouble > viewPort.world.right) {
        continue;
      }
      final left = viewPort.xScale.toScreen(dateDouble);
      final bottom = viewPort.screen.bottom;
      final changedDay = (last == null) || (last.day != date.day);
      if (last != null &&
          hitTest(viewPort.xScale.toScreen(dateToDouble(last)), left)) {
        continue;
      }
      drawScale(canvas, viewPort, left);
      final offsetX = left - fontSize * 1.25;
      last = date;
      drawText(
        canvas,
        Offset(offsetX, bottom - fontSize * 2),
        formatDate(date, [HH, ':', nn]),
      );
      if (changedDay) {
        drawText(
          canvas,
          Offset(
            offsetX,
            bottom - fontSize,
          ),
          formatDate(date, [mm, '/', dd]),
        );
      }
    }
  }
}
