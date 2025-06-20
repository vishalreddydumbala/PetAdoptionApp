
import 'package:get_it/get_it.dart';
import 'package:petadoptionapp/networking/api_repository.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {


  sl.registerSingletonAsync<ApiRepository>(() async {
    return ApiRepository();
  });



}