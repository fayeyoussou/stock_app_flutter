import 'package:equatable/equatable.dart';
import 'package:stock_app/features/categorie/domain/entities/categorie.dart';

class CategorieModel extends Categorie with EquatableMixin {

  CategorieModel({required super.id, required super.nom});

  factory CategorieModel.fromJson(Map<String, dynamic> json) {
    return CategorieModel(
      id: json['id'],
      nom: json['nom'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
    };
  }

  @override
  List<Object?> get props => [id, nom];

  @override
  String toString() => 'CategorieModel(id: $id, nom: $nom)';

  CategorieModel copyWith({
    String? id,
    String? nom,
  }) {
    return CategorieModel(
      id: id ?? this.id,
      nom: nom ?? this.nom,
    );
  }
}

