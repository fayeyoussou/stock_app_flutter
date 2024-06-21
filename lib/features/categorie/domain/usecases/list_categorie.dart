import 'package:fpdart/src/either.dart';
import 'package:stock_app/core/errors/failure.dart';
import 'package:stock_app/core/usecase/usecase.dart';
import 'package:stock_app/features/categorie/domain/entities/categorie.dart';

import '../repositories/categorie_repository.dart';

class ListCategorie implements UseCase<List<Categorie>,NoParams>{
  final CategorieRepository repo;

  ListCategorie(this.repo);

  @override
  Future<Either<Failure, List<Categorie>>> call(NoParams params)  async {

    var categoriesdart =  await repo.listCategories();
    categoriesdart.fold((onLeft)=>{}, (onRight){
      print('right here');
      print(onRight);
    });
    return categoriesdart;
  }

}