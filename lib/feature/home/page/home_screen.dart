import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/counter/presentation/page/counter_screen.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/favourite/presentation/pages/favourite_screen.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/imagepicker/pages/image_picker_screen.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/login/presentation/pages/login_screen.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/post/presentation/pages/post_screen.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/switch/pages/switch_screen.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/todo/presentation/pages/to_do_screen.dart';

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
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ToDoScreen()),
                  );
                },
                title: Text('T O D O'),
                trailing: Icon(Icons.today_outlined),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavouriteScreen()),
                  );
                },
                title: Text('F A V O U R I T E'),
                trailing: Icon(Icons.favorite_border_outlined),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PostScreen()),
                  );
                },
                title: Text('P O S T'),
                trailing: Icon(Icons.post_add_outlined),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                title: Text('L O G I N'),
                trailing: Icon(Icons.login_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
