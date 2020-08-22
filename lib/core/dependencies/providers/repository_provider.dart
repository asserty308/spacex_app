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
      RepositoryProvider(create: (context) => LaunchRepository(launchRemoteDatasource: GetIt.I.get())),
      RepositoryProvider(create: (context) => HistoryRepository(historyRemoteDatasource: GetIt.I.get())),
      RepositoryProvider(create: (context) => RocketRepository(rocketsRemoteDatasource: GetIt.I.get())),
      RepositoryProvider(create: (context) => LaunchpadRepository(launchpadRemoteDatasource: GetIt.I.get())),
      RepositoryProvider(create: (context) => CompanyInfoRepository(companyInfoApi: GetIt.I.get())),
    ],
    child: child,
  );
}
