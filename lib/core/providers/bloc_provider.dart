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
          launchRepository: RepositoryProvider.of(context), 
          rocketRepository: RepositoryProvider.of(context), 
          historyRepository: RepositoryProvider.of(context), 
          launchpadRepository: RepositoryProvider.of(context),
        ),
      ),
      BlocProvider<LaunchesNavigationCubit>(
        create: (context) => LaunchesNavigationCubit(),
      ),
    ],
    child: child,
  );
}