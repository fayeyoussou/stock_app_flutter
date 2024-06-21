import 'package:fpdart/fpdart.dart';
import 'package:stock_app/core/errors/failure.dart';
import '../entities/categorie.dart';

abstract interface class CategorieRepository {

    Future<Either<Failure,Categorie>> createCategorie(String nom);
    Future<Either<Failure,List<Categorie>>> listCategories();
    Future<Either<Failure,Categorie>> updateCategorie(String nom,String id);

}