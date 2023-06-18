import 'package:bloc/colors_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ColorBloc _bloc = ColorBloc();
  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _bloc.outputStateStrim,
          initialData: Colors.red,
          builder: (context, snapshot) {
            return AnimatedContainer(
              duration: const Duration(seconds: 1),
              color: snapshot.data,
              height: 200,
              width: 200,
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              _bloc.inputEvenSink.add(ColorEvent.event_red);
            },
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              _bloc.inputEvenSink.add(ColorEvent.event_green);
            },
          )
        ],
      ),
    );
  }
}
