import 'package:get_it/get_it.dart';
import 'package:test_cicd/src/bloc/account/account_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => AccountBloc(
      httpClient: sl(),
    ),
  );

  sl.registerLazySingleton(() => http.Client());
}
