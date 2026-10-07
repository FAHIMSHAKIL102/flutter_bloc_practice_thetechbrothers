import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/switch/bloc/switch_bloc.dart';

class SwitchScreen extends StatelessWidget {
  const SwitchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('S W I T C H')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text('Notification', style: TextStyle(fontSize: 20)),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) =>
                      previous.isSwitch != current.isSwitch,
                  builder: (context, state) {
                    print('Notification');
                    return Switch(
                      value: state.isSwitch,
                      onChanged: (newValue) {
                        //print(newValue);
                        context.read<SwitchBloc>().add(
                          EnableOrDisableNotification(),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Container(
                  height: 200,
                  color: Colors.red.withValues(alpha: state.slider),
                );
              },
            ),
            SizedBox(height: 50),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) =>
                  previous.slider != current.slider,
              builder: (context, state) {
                return Slider(
                  value: state.slider,
                  onChanged: (value) {
                    print(value);
                    context.read<SwitchBloc>().add(SliderEvent(slider: value));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
