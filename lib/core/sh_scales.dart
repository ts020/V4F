class LinearScale {
  double _worldStart = 0;
  double _worldLength = 1;
  double _screenStart = 0;
  double _screenLength = 1;

  LinearScale world(double start, double end) {
    _worldStart = start;
    _worldLength = end - start;
    return this;
  }

  LinearScale screen(double start, double end) {
    _screenStart = start;
    _screenLength = end - start;
    return this;
  }

  LinearScale clone() {
    return LinearScale()
        .world(_worldStart, _worldStart + _worldLength)
        .screen(_screenStart, _screenStart + _screenLength);
  }

  double toScreen(double worldPosition) {
    return ((worldPosition - _worldStart) / _worldLength) * _screenLength +
        _screenStart;
  }

  double toWorld(double screenPosition) {
    return ((screenPosition - _screenStart) / _screenLength) * _worldLength +
        _worldStart;
  }
}

class ImmutableLinearScale {
  final LinearScale _scales;
  ImmutableLinearScale({
    double worldStart,
    double worldEnd,
    double screenStart,
    double ScreenEnd,
  }) : _scales = LinearScale()
            .world(worldStart, worldEnd)
            .screen(screenStart, ScreenEnd);
  double toScreen(double value) {
    return _scales.toScreen(value);
  }

  double toWorld(double rangeValue) {
    return _scales.toWorld(rangeValue);
  }
}
