import 'dart:async';

class CounterBloc {
  int _counter = 0;

  int get counter => _counter;
  // Controller Input
  StreamController _inputController = StreamController();
  StreamSink get sinkInputan => _inputController.sink;

  //Controller Output
  StreamController _outputController = StreamController();
  StreamSink get _sinkOutput => _outputController.sink;

  Stream get outputan => _outputController.stream;

  ConterBloc() {
    _inputController.stream.listen(
      (event) {
        if (event == 'add') {
          _counter++;

          print("counter add");
        } else {
          _counter--;
          print("counter minus");
        }

        _sinkOutput.add(_counter);
      },
    );
  }

  void dispose() {
    _inputController.close();
    _outputController.close();
  }
}
