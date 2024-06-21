import 'package:fpdart/src/either.dart';

import 'package:stock_app/core/errors/failure.dart';

import '../../../../core/usecase/usecase.dart';
import '../entities/categorie.dart';
import '../repositories/categorie_repository.dart';

class UpdateCategorie implements UseCase<Categorie,UpdateCategorieParams> {
  final CategorieRepository repo;

  UpdateCategorie(this.repo);
  @override
  Future<Either<Failure, Categorie>> call(UpdateCategorieParams params) async {
    return await repo.updateCategorie(params.nom,params.id);

  }

}

class UpdateCategorieParams{
  final String nom;
  final String id;

  UpdateCategorieParams({required this.nom, required this.id});
}