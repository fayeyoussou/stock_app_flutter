import 'package:fpdart/src/either.dart';
import 'package:stock_app/core/errors/failure.dart';
import 'package:stock_app/core/errors/server_exception.dart';
import 'package:stock_app/features/categorie/data/datasources/categorie_data_source.dart';
import 'package:stock_app/features/categorie/data/models/categorie_model.dart';
import 'package:stock_app/features/categorie/domain/entities/categorie.dart';
import 'package:stock_app/features/categorie/domain/repositories/categorie_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';


class CategorieRepositoryImp implements CategorieRepository {
  final CategorieDataSource categorieDataSource;

  CategorieRepositoryImp(this.categorieDataSource);
  @override
  Future<Either<Failure, CategorieModel>> createCategorie(String nom) async {
    try
    {
      var categorie = await categorieDataSource.createCategorie(CategorieModel(id: const Uuid().v1(), nom: nom));
      return Either.right(categorie);
    }on PostgrestException catch( e){
      return left(Failure('PostgresException : ${e.message}'));
    } on ServerException catch( e){
      return left(Failure('ServerException : ${e.message}'));
    }
  }

  @override
  Future<Either<Failure, List<Categorie>>> listCategories() async{
    try
    {
      var categories = await categorieDataSource.listCategorie();
      return Either.right(categories);
    }on PostgrestException catch( e){
      return left(Failure('PostgresException : ${e.message}'));
    } on ServerException catch( e){
      return left(Failure('ServerException : ${e.message}'));
    }
  }

  @override
  Future<Either<Failure, Categorie>> updateCategorie(String nom, String id) async {
    try
    {
      var categorie = await categorieDataSource.updateCategorie(CategorieModel(id: id, nom: nom));
      return Either.right(categorie);
    }on PostgrestException catch( e){
      return left(Failure('PostgresException : ${e.message}'));
    } on ServerException catch( e){
      return left(Failure('ServerException : ${e.message}'));
    }
  }

}