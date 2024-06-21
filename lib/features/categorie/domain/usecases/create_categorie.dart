import 'package:fpdart/src/either.dart';
import 'package:stock_app/core/errors/failure.dart';
import 'package:stock_app/core/usecase/usecase.dart';

import '../entities/categorie.dart';
import '../repositories/categorie_repository.dart';

class CreateCategorie implements UseCase<Categorie,CreateCategorieParams> {
  final CategorieRepository repo;

  CreateCategorie(this.repo);
  @override
  Future<Either<Failure, Categorie>> call(CreateCategorieParams params) async {
    return (await repo.createCategorie(params.nom));
  }



}
class CreateCategorieParams {
  final String nom;

  CreateCategorieParams(this.nom);
}