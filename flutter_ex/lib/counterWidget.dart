
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CounterWidget extends StatefulWidget {
  CounterWidget({
    Key key, 
    this.count: 0
    }) : super(key: key);
  final int count;
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;
  @override
  void initState() { 
    super.initState();
    _counter = widget.count;
    print("init state");
  }
  @override
  Widget build(BuildContext context) {
    print("build");
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text("计数器"),
        ),
        body: FlatButton(
          child: Text("点击增加"),
          onPressed: () => setState(() => ++_counter),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}