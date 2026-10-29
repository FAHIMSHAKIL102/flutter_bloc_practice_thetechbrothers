import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice_thetechbrothers/core/router/routes_name.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('H O M E P A G E')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.counterScreen);
                  },
                  title: Text('C O U N T E R'),
                  trailing: Icon(Icons.calculate_outlined),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.switchScreen);
                  },
                  title: Text('S W I T C H'),
                  trailing: Icon(Icons.switch_left_outlined),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.imagepickerScreen);
                  },
                  title: Text('I M A G E   P I C K E R'),
                  trailing: Icon(Icons.image_outlined),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.todoScreen);
                  },
                  title: Text('T O D O'),
                  trailing: Icon(Icons.today_outlined),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.favouriteScreen);
                  },
                  title: Text('F A V O U R I T E'),
                  trailing: Icon(Icons.favorite_border_outlined),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.postScreen);
                  },
                  title: Text('P O S T'),
                  trailing: Icon(Icons.post_add_outlined),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.loginScreen);
                  },
                  title: Text('L O G I N'),
                  trailing: Icon(Icons.login_outlined),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
