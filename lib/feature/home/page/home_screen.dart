import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/counter/page/counter_screen.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/imagepicker/pages/image_picker_screen.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/switch/pages/switch_screen.dart';

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
                trailing: Icon(Icons.calculate_outlined),
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
                trailing: Icon(Icons.switch_left_outlined),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImagePickerScreen(),
                    ),
                  );
                },
                title: Text('I M A G E   P I C K E R'),
                trailing: Icon(Icons.image_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
