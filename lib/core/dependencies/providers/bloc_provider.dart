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
        create: (context) => AllDataCubit(
          launchRepository: RepositoryProvider.of<LaunchRepository>(context), 
          rocketRepository: RepositoryProvider.of<RocketRepository>(context), 
          historyRepository: RepositoryProvider.of<HistoryRepository>(context), 
          launchpadRepository: RepositoryProvider.of<LaunchpadRepository>(context),
        ),
      ),
      BlocProvider<LaunchesNavigationCubit>(
        create: (context) => LaunchesNavigationCubit(),
      ),
      BlocProvider<LaunchListCubit>(
        create: (context) => LaunchListCubit(
          launchRepository: RepositoryProvider.of<LaunchRepository>(context),
        ),
      ),
      BlocProvider<LaunchDetailsCubit>(
        create: (context) => LaunchDetailsCubit(
          rocketRepository: RepositoryProvider.of<RocketRepository>(context),
        ),
      ),
      BlocProvider<LaunchInfoCubit>(
        create: (context) => LaunchInfoCubit(
          rocketRepository: RepositoryProvider.of<RocketRepository>(context),
          launchpadRepository: RepositoryProvider.of<LaunchpadRepository>(context),
        ),
      ),
      BlocProvider<CompanyInfoScreenCubit>(
        create: (context) => CompanyInfoScreenCubit(
          companyInfoRepository: RepositoryProvider.of<CompanyInfoRepository>(context),
        )
      ),
    ],
    child: child,
  );
}