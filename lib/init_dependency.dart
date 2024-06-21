
import 'package:get_it/get_it.dart';
import 'package:stock_app/features/categorie/data/datasources/categorie_data_source.dart';
import 'package:stock_app/features/categorie/data/repositories/categorie_repository_imp.dart';
import 'package:stock_app/features/categorie/domain/repositories/categorie_repository.dart';
import 'package:stock_app/features/categorie/domain/usecases/create_categorie.dart';
import 'package:stock_app/features/categorie/domain/usecases/list_categorie.dart';
import 'package:stock_app/features/categorie/presentation/bloc/categorie_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/secrets/app_secrets.dart';
import 'features/categorie/domain/usecases/update_categorie.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {

  final supabase = await Supabase.initialize(
      url: AppSecrets.supaBaseUrl, anonKey: AppSecrets.supaBaseKey);
  _initAuth();

  serviceLocator.registerLazySingleton<SupabaseClient>(() => supabase.client);
}

void _initAuth() {
  serviceLocator
    // datasource
    ..registerFactory<CategorieDataSource>(
      () => CategorieRemoteDataSourceImpl(
        serviceLocator<SupabaseClient>(),
      ),
    )
    // Repository
    ..registerFactory<CategorieRepository>(
      () => CategorieRepositoryImp(
        serviceLocator<CategorieDataSource>(),
      ),
    )
    // Use cases
    ..registerFactory<CreateCategorie>(
      () => CreateCategorie(
        serviceLocator<CategorieRepository>(),
      ),
    )
    ..registerFactory<ListCategorie>(
      () => ListCategorie(
        serviceLocator<CategorieRepository>(),
      ),
    )
    ..registerFactory<UpdateCategorie>(
          () => UpdateCategorie(
        serviceLocator<CategorieRepository>(),
      ),
    )

    // Bloc
    ..registerLazySingleton<CategorieBloc>(
      () => CategorieBloc(
          createCategorie: serviceLocator<CreateCategorie>(),
          listCategorie: serviceLocator<ListCategorie>(),
          updateCategorie: serviceLocator<UpdateCategorie>(),
    ));
}

