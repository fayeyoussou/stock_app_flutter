import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_app/core/usecase/usecase.dart';
import 'package:stock_app/features/categorie/domain/usecases/update_categorie.dart';

import '../../data/models/categorie_model.dart';
import '../../domain/usecases/create_categorie.dart';
import '../../domain/usecases/list_categorie.dart';

part 'categorie_event.dart';

part 'categorie_state.dart';

class CategorieBloc extends Bloc<CategorieEvent, CategorieState> {
  List<CategorieModel> categories = [];
  final CreateCategorie _createCategorie;
  final UpdateCategorie _updateCategorie;
  final ListCategorie _listCategorie;

  CategorieBloc(
      {required CreateCategorie createCategorie,
      required ListCategorie listCategorie,
      required UpdateCategorie updateCategorie})
      : _createCategorie = createCategorie,
        _listCategorie = listCategorie,
        _updateCategorie = updateCategorie,
        super(CategorieInitialState()) {
    on<CategorieEvent>((event, emit) {
      emit(CategorieLoadingState());
    });
    on<CreatingCategorieEvent>(_onCreateCategorie);
    on<ListingCategorieEvent>(_onListingCategorie);
    on<UpdatingCategorieEvent>(_onUpdatingCategorie);
  }

  void _onCreateCategorie(
      CreatingCategorieEvent event, Emitter<CategorieState> emit) async {
    var result = await _createCategorie(CreateCategorieParams(event.nom));

    result.fold(
      (fail) {
        emit(CategorieFailureState(fail.message));
      },
      (success) {
        categories.add(success as CategorieModel);
        emit(CategorieSuccessState(
             categories: categories));
      },
    );
  }

  void _onUpdatingCategorie(
      UpdatingCategorieEvent event, Emitter<CategorieState> emit) async {
    var result = await _updateCategorie(UpdateCategorieParams(nom : event.nom,id: event.id));

    result.fold(
      (fail) {
        emit(CategorieFailureState(fail.message));
      },
      (success) {

        categories = categories.map((toElement){
          if(toElement.id == success.id){
            return success as CategorieModel;
          }else {
            return toElement;
          }
        }).toList();
        emit(CategorieSuccessState(
            categories: categories));
      },
    );
  }

  void _onListingCategorie(
      ListingCategorieEvent event, Emitter<CategorieState> emit) async {
    var result = await _listCategorie(NoParams());

    result.fold(
      (fail) {
        emit(CategorieFailureState(fail.message));
      },
      (success) {
        categories = success as List<CategorieModel>;

        emit(
            CategorieSuccessState(categories: success as List<CategorieModel>));
      },
    );
  }
}
