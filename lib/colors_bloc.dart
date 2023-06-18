import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent { event_red, event_green }

class ColorBloc {
  Color _color = Colors.red;

  final _inputEventComtroller = StreamController<ColorEvent>();
  StreamSink<ColorEvent> get inputEvenSink => _inputEventComtroller.sink;

  final _outputStateController = StreamController<Color>();
  Stream<Color> get outputStateStrim => _outputStateController.stream;
  void _mapEventToState(ColorEvent event) {
    if (event == ColorEvent.event_red)
      _color = Colors.red;
    else if (event == ColorEvent.event_green)
      _color = Colors.green;
    else
      throw Exception('wrong it s wrong');
    _outputStateController.sink.add(_color);
  }

  ColorBloc() {
    _inputEventComtroller.stream.listen(_mapEventToState);
  }

  void dispose() {
    _inputEventComtroller.close();
    _outputStateController.close();
  }
}
