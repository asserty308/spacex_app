import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // make the list start at the top of the screen, not under statusbar
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Center(
              child: Text(
                'SpaceX',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('Next Launch'),
            leading: Icon(Icons.timer),
          ),
          ListTile(
            title: Text('All Launches'),
            leading: Icon(Icons.all_inclusive),
          ),
          ListTile(
            title: Text('Historical Events'),
            leading: Icon(Icons.history),
          ),
          ListTile(
            title: Text('About SpaceX'),
            leading: Icon(Icons.info_outline),
          ),
          ListTile(
            title: Text('Settings'),
            leading: Icon(Icons.settings),
          )
        ],
      ),
    );
  }
}