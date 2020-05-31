import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/ui/widgets/center_text.dart';
import 'package:spacex_guide/core/bloc/app_navigation/app_navigation_bloc.dart';
import 'package:spacex_guide/core/bloc/app_navigation/app_navigation_events.dart';

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
            title: const Text('Upcoming'),
            leading: Icon(Icons.label),
            onTap: () => BlocProvider.of<AppNavigationBloc>(context).add(ShowUpcomingLaunches()),
          ),
          ListTile(
            title: const Text('Rockets'),
            leading: Icon(Icons.label),
            onTap: () => BlocProvider.of<AppNavigationBloc>(context).add(ShowRockets()),
          ),
          ListTile(
            title: const Text('Launchpads'),
            leading: Icon(Icons.location_on),
            onTap: () => BlocProvider.of<AppNavigationBloc>(context).add(ShowLaunchpads()),
          ),
          ListTile(
            title: const Text('Historical Events'),
            leading: Icon(Icons.history),
            onTap: () => BlocProvider.of<AppNavigationBloc>(context).add(ShowHistory()),
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