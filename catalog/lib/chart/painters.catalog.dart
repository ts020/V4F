import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:catalog/catalog/Catalog.dart';
import 'package:flutter/widgets.dart';
import 'package:v4f/v4f.dart';

class ShRectPainterCatalog extends StatelessWidget with CatalogClass {
  @override
  String get title => 'Painters';

  @override
  Widget build(BuildContext context) {
    final chartPadding = const EdgeInsets.fromLTRB(16, 16, 16, 40);
    final world = Rect.fromLTRB(
      dateTimeFromDouble(DateTime(2019, 8, 1)),
      1,
      dateTimeFromDouble(DateTime(2019, 10, 1)),
      0,
    );
    final borderBox = Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.greenAccent,
          width: 1,
        ),
      ),
    );

    final mutableViewPort = ValueNotifier<Rect>(world);

    return CatalogScaffold(
      title: title,
      children: <Widget>[
        CatalogCard(
          title: 'RectChartPainter',
          child: AspectRatio(
            aspectRatio: 1.0,
            child: PaintStackContainer(
              child: borderBox,
              painters: [
                RectPainter(
                  padding: chartPadding,
                  color: Colors.greenAccent,
                  rectList: [
                    Rect.fromLTRB(
                      dateTimeFromDouble(DateTime(2019, 8, 12)),
                      1,
                      dateTimeFromDouble(DateTime(2019, 8, 18)),
                      0,
                    ),
                    Rect.fromLTRB(
                      dateTimeFromDouble(DateTime(2019, 8, 21)),
                      0.5,
                      dateTimeFromDouble(DateTime(2019, 8, 24)),
                      0,
                    )
                  ],
                  world: world,
                ),
              ],
            ),
          ),
        ),
        CatalogCard(
          title: 'LineChartPainter - Curve',
          child: SizedBox(
            height: 200,
            child: PaintStackContainer(
              child: borderBox,
              painters: [
                LinePainter(
                  padding: chartPadding,
                  color: Colors.green,
                  points: [
                    Offset(dateTimeFromDouble(DateTime(2019, 8, 12)), 0.4),
                    Offset(dateTimeFromDouble(DateTime(2019, 8, 16)), 0.5),
                    Offset(dateTimeFromDouble(DateTime(2019, 8, 19)), 0.3),
                    Offset(dateTimeFromDouble(DateTime(2019, 8, 22)), 0.7),
                    Offset(dateTimeFromDouble(DateTime(2019, 8, 25)), 0.1),
                    Offset(dateTimeFromDouble(DateTime(2019, 8, 30)), 0.9),
                  ],
                  world: world,
                ),
              ],
            ),
          ),
        ),
        CatalogCard(
          title: 'LineChartPainter - SOLID',
          child: SizedBox(
            height: 200,
            child: PaintStackContainer(
              child: borderBox,
              painters: [
                LinePainter(
                  padding: chartPadding,
                  color: Colors.green,
                  lineBuilder: Lines.Solid,
                  points: [
                    Offset(dateTimeFromDouble(DateTime(2019, 8, 12)), 0.4),
                    Offset(dateTimeFromDouble(DateTime(2019, 8, 16)), 0.5),
                    Offset(dateTimeFromDouble(DateTime(2019, 8, 19)), 0.3),
                    Offset(dateTimeFromDouble(DateTime(2019, 8, 22)), 0.7),
                    Offset(dateTimeFromDouble(DateTime(2019, 8, 25)), 0.1),
                    Offset(dateTimeFromDouble(DateTime(2019, 8, 30)), 0.9),
                  ],
                  world: world,
                ),
              ],
            ),
          ),
        ),
        CatalogCard(
          title: 'LineChartPainter',
          child: AspectRatio(
            aspectRatio: 1.0,
            child: PaintStackContainer(
              child: borderBox,
              painters: [
                PlotsPainter(
                  strokeColor: Colors.green,
                  padding: chartPadding,
                  color: Colors.greenAccent,
                  points: [
                    Plot(dateTimeFromDouble(DateTime(2019, 8, 12)), 1.0, 1),
                    Plot(dateTimeFromDouble(DateTime(2019, 8, 21)), 0.5, 3),
                    Plot(dateTimeFromDouble(DateTime(2019, 8, 26)), 0.8, 7),
                  ],
                  world: world,
                ),
              ],
            ),
          ),
        ),
        CatalogCard(
          title: 'XAxis',
          child: AspectRatio(
            aspectRatio: 1.0,
            child: PaintStackContainer(
              child: borderBox,
              painters: [
                XAxisPainter(
                  padding: chartPadding,
                  color: Colors.greenAccent,
                  dates: [
                    DateTime(2019, 8, 1),
                    DateTime(2019, 8, 12),
                    DateTime(2019, 8, 15),
                    DateTime(2019, 8, 21),
                    DateTime(2019, 8, 26),
                    DateTime(2019, 8, 31),
                  ],
                  world: world,
                ),
              ],
            ),
          ),
        ),
        CatalogCard(
          title: 'Mix',
          child: Column(
            children: <Widget>[
              ValueListenableBuilder<Rect>(
                  valueListenable: mutableViewPort,
                  builder: (_, _world, __) {
                    return Column(
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 1.0,
                          child: PaintStackContainer(
                            child: borderBox,
                            painters: [
                              RectPainter(
                                padding: chartPadding,
                                color: Colors.greenAccent,
                                rectList: [
                                  Rect.fromLTRB(
                                    dateTimeFromDouble(DateTime(2019, 8, 12)),
                                    1,
                                    dateTimeFromDouble(DateTime(2019, 8, 18)),
                                    0,
                                  ),
                                  Rect.fromLTRB(
                                    dateTimeFromDouble(DateTime(2019, 8, 21)),
                                    0.5,
                                    dateTimeFromDouble(DateTime(2019, 8, 24)),
                                    0,
                                  ),
                                  Rect.fromLTRB(
                                    dateTimeFromDouble(DateTime(2019, 8, 26)),
                                    0.8,
                                    dateTimeFromDouble(DateTime(2019, 8, 27)),
                                    0,
                                  )
                                ],
                                world: _world,
                              ),
                              LinePainter(
                                padding: chartPadding,
                                color: Colors.blueGrey.shade200,
                                strokeWidth: 4,
                                points: [
                                  Offset(dateTimeFromDouble(DateTime(2019, 8, 15)),
                                      1.0),
                                  Offset(
                                      dateTimeFromDouble(DateTime(2019, 8, 22, 12)),
                                      0.5),
                                  Offset(
                                      dateTimeFromDouble(DateTime(2019, 8, 26, 12)),
                                      0.8),
                                  Offset(dateTimeFromDouble(DateTime(2019, 8, 27)),
                                      1.0),
                                  Offset(
                                      dateTimeFromDouble(DateTime(2019, 8, 28, 12)),
                                      0.5),
                                  Offset(
                                      dateTimeFromDouble(DateTime(2019, 8, 29, 12)),
                                      0.8),
                                  Offset(dateTimeFromDouble(DateTime(2019, 8, 30)),
                                      1.0),
                                  Offset(dateTimeFromDouble(DateTime(2019, 9, 1)),
                                      0.5),
                                  Offset(
                                      dateTimeFromDouble(DateTime(2019, 9, 9, 12)),
                                      0.9),
                                ],
                                world: _world,
                              ),
                              PlotsPainter(
                                strokeColor: Colors.green,
                                padding: chartPadding,
                                color: Colors.blueGrey.shade400,
                                radius: 4,
                                strokeWidth: 1,
                                valueScale: LinearScale().world(1, 4).screen(4, 40),
                                points: [
                                  Plot(
                                    dateTimeFromDouble(DateTime(2019, 8, 15)),
                                    1.0,
                                    1,
                                  ),
                                  Plot(
                                    dateTimeFromDouble(DateTime(2019, 8, 22, 12)),
                                    0.5,
                                    1,
                                  ),
                                  Plot(
                                    dateTimeFromDouble(DateTime(2019, 8, 26, 12)),
                                    0.8,
                                    2,
                                  ),
                                  Plot(
                                    dateTimeFromDouble(DateTime(2019, 8, 29, 12)),
                                    0.3,
                                    2.4,
                                  ),
                                  Plot(
                                    dateTimeFromDouble(DateTime(2019, 9, 2, 12)),
                                    0.1,
                                    3,
                                  ),
                                  Plot(
                                    dateTimeFromDouble(DateTime(2019, 9, 7, 12)),
                                    0.6,
                                    4,
                                  ),
                                  Plot(
                                    dateTimeFromDouble(DateTime(2019, 9, 9, 12)),
                                    0.9,
                                    1.4,
                                  ),
                                ],
                                world: _world,
                              ),
                              XAxisPainter(
                                color: Colors.blueGrey.shade200,
                                dates: [
                                  DateTime(2019, 8, 15),
                                  DateTime(2019, 8, 22, 12),
                                  DateTime(2019, 8, 26, 12),
                                  DateTime(2019, 8, 27, 12),
                                  DateTime(2019, 8, 28, 12),
                                  DateTime(2019, 8, 29, 12),
                                  DateTime(2019, 8, 30, 12),
                                  DateTime(2019, 8, 31, 12),
                                  DateTime(2019, 9, 1, 12),
                                  DateTime(2019, 9, 2, 12),
                                  DateTime(2019, 9, 3, 12),
                                  DateTime(2019, 9, 4, 12),
                                  DateTime(2019, 9, 5, 12),
                                  DateTime(2019, 9, 6, 12),
                                  DateTime(2019, 9, 7, 12),
                                  DateTime(2019, 9, 8, 4),
                                  DateTime(2019, 9, 8, 8),
                                  DateTime(2019, 9, 8, 12),
                                  DateTime(2019, 9, 8, 16),
                                  DateTime(2019, 9, 8, 20),
                                  DateTime(2019, 9, 9, 0),
                                  DateTime(2019, 9, 9, 4),
                                  DateTime(2019, 9, 9, 8),
                                  DateTime(2019, 9, 9, 12),
                                ],
                                world: _world,
                                padding: chartPadding.copyWith(bottom: 4),
                              )
                            ],
                          ),
                        ),
                        RangeSlider(
                          min: world.left,
                          max: world.right,
                          onChanged: (RangeValues rangeValue) {
                            mutableViewPort.value = Rect.fromLTRB(rangeValue.start, 1, rangeValue.end, 0);
                          },
                          values: RangeValues(mutableViewPort.value.left, mutableViewPort.value.right),
                        )
                      ],
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}

double dateTimeFromDouble(DateTime datetime) {
  return datetime.millisecondsSinceEpoch.toDouble();
}
