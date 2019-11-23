import 'package:flutter/material.dart';
import 'package:spacex_guide/core/utility/navigation.dart';
import 'package:spacex_guide/features/history/ui/pages/all_events_page.dart';
import 'package:spacex_guide/features/launches/ui/pages/all_launches_screen.dart';
import 'package:spacex_guide/features/rockets/ui/pages/all_rockets_screen.dart';

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
            title: const Text('All Launches'),
            leading: Icon(Icons.all_inclusive),
            onTap: () => showScreen(context, AllLaunchesScreen()),
          ),
          ListTile(
            title: const Text('All Missions'),
            leading: Icon(Icons.all_inclusive),
          ),
          ListTile(
            title: const Text('Rockets'),
            leading: Icon(Icons.build),
            onTap: () => showScreen(context, AllRocketsScreen()),
          ),
          ListTile(
            title: const Text('Historical Events'),
            leading: Icon(Icons.history),
            onTap: () => showScreen(context, AllEventsScreen()),
          ),
          ListTile(
            title: const Text('About SpaceX'),
            leading: Icon(Icons.info_outline),
          ),
          ListTile(
            title: const Text('Settings'),
            leading: Icon(Icons.settings),
          )
        ],
      ),
    );
  }
}