import 'package:flutter/material.dart';
import 'package:flutter_core/ui/extensions/widget_extension.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex_guide/core/bloc/app_navigation/app_navigation_cubit.dart';

class AppDrawer extends StatelessWidget {
  final AppNavigationCubit _navigationCubit = GetIt.I<AppNavigationCubit>();

  @override
  Widget build(BuildContext context) => Drawer(
    child: ListView(
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: const Text(
            'SpaceX',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ).centered,
        ),
        ListTile(
          title: const Text('Launches'),
          leading: Icon(Icons.label),
          onTap: () => _navigationCubit.showLaunches(),
        ),
        ListTile(
          title: const Text('Rockets'),
          leading: Icon(Icons.label),
          onTap: () => _navigationCubit.showRockets(),
        ),
        ListTile(
          title: const Text('Launchpads'),
          leading: Icon(Icons.location_on),
          onTap: () => _navigationCubit.showLaunchpads(),
        ),
        // ListTile(
        //   title: const Text('Historical Events'),
        //   leading: Icon(Icons.history),
        //   onTap: () => _navigationCubit.showHistory(),
        // ),
        ListTile(
          title: const Text('About SpaceX'),
          leading: Icon(Icons.info_outline),
          onTap: () => _navigationCubit.showAboutScreen(),
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