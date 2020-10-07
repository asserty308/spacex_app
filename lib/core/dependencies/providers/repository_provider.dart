part of 'app_provider.dart';

class AppRepositoryProvider extends StatelessWidget {
  final Widget child;

  const AppRepositoryProvider({
    Key key, 
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
    providers: [
      RepositoryProvider(create: (context) => LaunchRepository()),
      RepositoryProvider(create: (context) => HistoryRepository()),
      RepositoryProvider(create: (context) => RocketRepository()),
      RepositoryProvider(create: (context) => LaunchpadRepository()),
      RepositoryProvider(create: (context) => CompanyInfoRepository()),
    ],
    child: child,
  );
}
