part of 'categorie_bloc.dart';

@immutable
sealed class CategorieEvent {}

final class CreatingCategorieEvent extends CategorieEvent{
  final String nom;

  CreatingCategorieEvent(this.nom);

}
final class UpdatingCategorieEvent extends CategorieEvent{
  final String nom;
  final String id;

  UpdatingCategorieEvent(this.nom,this.id);

}
final class ListingCategorieEvent extends CategorieEvent{}
