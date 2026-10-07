import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/counter/page/counter_screen.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/switch/switch_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('H O M E P A G E')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CounterScreen()),
                  );
                },
                title: Text('C O U N T E R'),
                trailing: Icon(Icons.calculate),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SwitchScreen()),
                  );
                },
                title: Text('S W I T C H'),
                trailing: Icon(Icons.switch_camera_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
