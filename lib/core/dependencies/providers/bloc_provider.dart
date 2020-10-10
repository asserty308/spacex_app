part of 'app_provider.dart';

class AppBlocProvider extends StatelessWidget {
  const AppBlocProvider({
    Key key, 
    @required this.child,
  }) : super(key: key);

  final Widget child;
  
  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider<AllDataCubit>(
        create: (context) => AllDataCubit(),
      ),
      BlocProvider<LaunchesNavigationCubit>(
        create: (context) => LaunchesNavigationCubit(),
      ),
      BlocProvider<LaunchListCubit>(
        create: (context) => LaunchListCubit(),
      ),
      BlocProvider<LaunchDetailsCubit>(
        create: (context) => LaunchDetailsCubit(),
      ),
      BlocProvider<LaunchInfoCubit>(
        create: (context) => LaunchInfoCubit(),
      ),
      BlocProvider<CompanyInfoScreenCubit>(
        create: (context) => CompanyInfoScreenCubit()
      ),
      BlocProvider<AllEventsListCubit>(
        create: (context) => AllEventsListCubit(),
      ),
      BlocProvider<AllLaunchpadsCubit>(
        create: (context) => AllLaunchpadsCubit(),
      ),
    ],
    child: child,
  );
}
