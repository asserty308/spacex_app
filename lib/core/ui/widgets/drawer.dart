import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/ui/widgets/center_text.dart';
import 'package:spacex_guide/core/bloc/app_navigation/app_navigation_cubit.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Drawer(
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
          title: const Text('Launches'),
          leading: Icon(Icons.label),
          onTap: () => BlocProvider.of<AppNavigationCubit>(context).showLaunches(),
        ),
        ListTile(
          title: const Text('Rockets'),
          leading: Icon(Icons.label),
          onTap: () => BlocProvider.of<AppNavigationCubit>(context).showRockets(),
        ),
        ListTile(
          title: const Text('Launchpads'),
          leading: Icon(Icons.location_on),
          onTap: () => BlocProvider.of<AppNavigationCubit>(context).showLaunchpads(),
        ),
        // ListTile(
        //   title: const Text('Historical Events'),
        //   leading: Icon(Icons.history),
        //   onTap: () => BlocProvider.of<AppNavigationCubit>(context).showHistory(),
        // ),
        ListTile(
          title: const Text('About SpaceX'),
          leading: Icon(Icons.info_outline),
          onTap: () => BlocProvider.of<AppNavigationCubit>(context).showAboutScreen(), // TODO: Implement about screen with information about the company
        ),
        ListTile(
          title: const Text('Settings'),
          leading: Icon(Icons.settings),
          onTap: () => showAboutDialog(
            context: context,
          ), // TODO: Implement settings screen
        )
      ],
    ),
  );
}