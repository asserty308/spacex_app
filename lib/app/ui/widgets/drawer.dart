import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex_guide/app/bloc/app_navigation/app_navigation_cubit.dart';

class AppDrawer extends StatelessWidget {

  AppDrawer({super.key});
  final AppNavigationCubit _navigationCubit = GetIt.I<AppNavigationCubit>();

  @override
  Widget build(BuildContext context) => Drawer(
    child: ListView(
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Center(
            child: Text(
              'SpaceX',
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        ListTile(
          title: const Text('Launches'),
          leading: const Icon(Icons.label),
          onTap: _navigationCubit.showLaunches,
        ),
        ListTile(
          title: const Text('Rockets'),
          leading: const Icon(Icons.label),
          onTap: _navigationCubit.showRockets,
        ),
        ListTile(
          title: const Text('Launchpads'),
          leading: const Icon(Icons.location_on),
          onTap: _navigationCubit.showLaunchpads,
        ),
        // ListTile(
        //   title: const Text('Historical Events'),
        //   leading: Icon(Icons.history),
        //   onTap: () => _navigationCubit.showHistory(),
        // ),
        ListTile(
          title: const Text('About SpaceX'),
          leading: const Icon(Icons.info_outline),
          onTap: _navigationCubit.showAboutScreen,
        ),
        ListTile(
          title: const Text('Settings'),
          leading: const Icon(Icons.settings),
          onTap: () => showAboutDialog(
            context: context,
          ),
        )
      ],
    ),
  );
}