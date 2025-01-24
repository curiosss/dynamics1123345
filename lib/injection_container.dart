import 'package:get_it/get_it.dart';

import 'core/network/connectivity_service.dart';
import 'core/network/network_service.dart';

final getIt = GetIt.instance;

setupLocator() async {
  getIt.registerSingleton(ConnectivityService());
  getIt.registerSingleton(NetworkService(getIt<ConnectivityService>()));
}
