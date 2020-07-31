part of 'app_provider.dart';

class AppBlocProvider extends StatelessWidget {
  final Widget child;

  const AppBlocProvider({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider<AppNavigationCubit>(
        create: (context) => AppNavigationCubit(),
      ),
      BlocProvider<AllDataCubit>(
        create: (context) => AllDataCubit(),
      ),
      BlocProvider<LaunchesNavigationBloc>(
        create: (context) => LaunchesNavigationBloc(),
      ),
    ],
    child: child,
  );
}