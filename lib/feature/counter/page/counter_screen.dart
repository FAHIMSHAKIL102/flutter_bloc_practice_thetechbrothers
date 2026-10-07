import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/counter/bloc/counter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter'), centerTitle: true),
      body: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Center(
                child: Text(
                  state.counter.toString(),
                  style: TextStyle(fontSize: 50),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(IncrementCounterEvent());
                },
                child: Icon(Icons.add, color: Colors.green, size: 25),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(DecrementCounterEvent());
                },
                child: Icon(Icons.remove, color: Colors.red, size: 25),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
