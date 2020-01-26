import 'package:flutter/material.dart';
import 'package:flutter_core/routing/routing.dart';
import 'package:flutter_core/ui/widgets/center_text.dart';
import 'package:spacex_guide/features/history/ui/screens/all_events_screen.dart';
import 'package:spacex_guide/features/launches/ui/screens/all_launches_screen.dart';
import 'package:spacex_guide/features/launchpads/ui/screens/all_launchpads_screen.dart';
import 'package:spacex_guide/features/rockets/ui/screens/all_rockets_screen.dart';

class MyDrawer extends StatelessWidget {
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
            child: const CenterText(
              'SpaceX',
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          ListTile(
            title: const Text('All Launches'),
            leading: Icon(Icons.label),
            onTap: () => _showScreen(context, AllLaunchesScreen()),
          ),
          ListTile(
            title: const Text('Rockets'),
            leading: Icon(Icons.label),
            onTap: () => _showScreen(context, AllRocketsScreen()),
          ),
          ListTile(
            title: const Text('Launchpads'),
            leading: Icon(Icons.location_on),
            onTap: () => _showScreen(context, AllLaunchpadsScreen()),
          ),
          ListTile(
            title: const Text('Historical Events'),
            leading: Icon(Icons.history),
            onTap: () => _showScreen(context, AllEventsScreen()),
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

  void _showScreen(context, Widget screen) {
    // close drawer
    Navigator.pop(context);

    // navigate to new screen
    showScreen(context, screen);
  }
}