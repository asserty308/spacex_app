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
      BlocProvider<AppNavigationCubit>(
        create: (context) => AppNavigationCubit(),
      ),
      BlocProvider<AllDataCubit>(
        create: (context) => AllDataCubit(),
      ),
      BlocProvider<LaunchesNavigationCubit>(
        create: (context) => LaunchesNavigationCubit(),
      ),
      BlocProvider<LaunchListCubit>(
        create: (context) => LaunchListCubit(
          launchRepository: GetIt.I<LaunchRepository>(),
        ),
      ),
      BlocProvider<LaunchDetailsCubit>(
        create: (context) => LaunchDetailsCubit(
          rocketRepository: GetIt.I<RocketRepository>(),
        ),
      ),
      BlocProvider<LaunchInfoCubit>(
        create: (context) => LaunchInfoCubit(
          rocketRepository: GetIt.I<RocketRepository>(),
          launchpadRepository: GetIt.I<LaunchpadRepository>(),
        ),
      ),
      BlocProvider<CompanyInfoScreenCubit>(
        create: (context) => CompanyInfoScreenCubit(
          companyInfoRepository: GetIt.I<CompanyInfoRepository>(),
        )
      ),
      BlocProvider<AllEventsListCubit>(
        create: (context) => AllEventsListCubit(),
      ),
      BlocProvider<AllLaunchpadsCubit>(
        create: (context) => AllLaunchpadsCubit(
          launchpadRepository: GetIt.I<LaunchpadRepository>(),
        ),
      ),
    ],
    child: child,
  );
}
