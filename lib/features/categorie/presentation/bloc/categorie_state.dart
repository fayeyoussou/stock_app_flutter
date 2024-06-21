part of 'categorie_bloc.dart';

@immutable
sealed class CategorieState {}

final class CategorieInitialState extends CategorieState {}
final class CategorieSuccessState extends CategorieState {
  CategorieModel? categorie;
  List<CategorieModel>? categories =[];
  CategorieSuccessState({this.categorie,this.categories});
}
final class CategorieLoadingState extends CategorieState {}

final class CategorieFailureState extends CategorieState {
  final String errorMessage;

  CategorieFailureState(this.errorMessage);
}

