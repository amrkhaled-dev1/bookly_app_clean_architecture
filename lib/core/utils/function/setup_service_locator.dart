import 'package:bookly_app_clean_architecture/core/utils/api_service.dart';
import 'package:bookly_app_clean_architecture/feature/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app_clean_architecture/feature/home/data/data_sources/home_remote_data_sources.dart';
import 'package:bookly_app_clean_architecture/feature/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app_clean_architecture/feature/home/domain/use_cases/featch_featured_book_use_case.dart';
import 'package:bookly_app_clean_architecture/feature/home/domain/use_cases/featch_newest_book_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSources: HomeRemoteDataSourcesImpl(
        apiService: getIt<ApiService>(),
      ),
      homeLocalDataSource: HomeLocalDataSourceImp(),
    ),
  );
  getIt.registerSingleton<FeatchFeaturedBookUseCase>(
    FeatchFeaturedBookUseCase(homeRepo: getIt<HomeRepoImpl>()),
  );
  getIt.registerSingleton<FeatchNewestBookUseCase>(
    FeatchNewestBookUseCase(homeRepo: getIt<HomeRepoImpl>()),
  );
}
