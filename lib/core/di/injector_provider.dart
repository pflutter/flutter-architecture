import 'package:cpap_mobile/app/data/auth.repository.dart';
import 'package:cpap_mobile/app/data/sources/remote/auth.service.dart';
import 'package:cpap_mobile/app/data/sources/remote/user.service.dart';
import 'package:cpap_mobile/app/ui/modules/authenticated/home/home.viewmodel.dart';
import 'package:cpap_mobile/app/ui/modules/unauthenticated/login/login.viewmodel.dart';
import 'package:get_it/get_it.dart';

import 'http_client.dart';

final GetIt inject = GetIt.I;

Future<void> setupInjection() async {
  //Components
  inject.registerSingleton(HttpClient());

  //Remote Services
  inject.registerFactory(() => AuthService());
  inject.registerFactory(() => UserService());

  //Repositories
  inject.registerFactory(() => AuthRepository());

  //ViewModels
  inject.registerLazySingleton(() => LoginViewModel());
  inject.registerLazySingleton(() => HomeViewModel());
}
