import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/counter/presentation/bloc/counter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  late CounterBloc _counterBloc;
  @override
  void initState() {
    super.initState();
    _counterBloc = CounterBloc();
  }

  @override
  void dispose() {
    super.dispose();
    _counterBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _counterBloc,
      child: Scaffold(
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
                BlocBuilder<CounterBloc, CounterState>(
                  buildWhen: (previous, current) => false,
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(
                          IncrementCounterEvent(),
                        );
                      },
                      child: Icon(Icons.add, color: Colors.green, size: 25),
                    );
                  },
                ),
                SizedBox(width: 10),
                BlocBuilder<CounterBloc, CounterState>(
                  buildWhen: (previous, current) => false,
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(
                          DecrementCounterEvent(),
                        );
                      },
                      child: Icon(Icons.remove, color: Colors.red, size: 25),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
