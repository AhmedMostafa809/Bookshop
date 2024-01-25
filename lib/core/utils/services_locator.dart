import 'package:bookshop/Feature/repos/home_repo_implementation.dart';
import 'package:bookshop/core/utils/api_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

void setup() {
  getit.registerSingleton<HomeRepoImplementation>(
      HomeRepoImplementation(ApiServices(Dio())));
}
