import 'package:stock_app/features/categorie/data/models/categorie_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class CategorieDataSource {
  Future<CategorieModel> createCategorie(CategorieModel categoriModel);
  Future<List<CategorieModel>> listCategorie();
  Future<CategorieModel> updateCategorie(CategorieModel categorieModel);
  
  bool deleteCategor(String id);
}
class CategorieRemoteDataSourceImpl implements CategorieDataSource {
  final SupabaseClient supabaseClient;

  CategorieRemoteDataSourceImpl(this.supabaseClient);
  @override
  Future<CategorieModel> createCategorie(CategorieModel categorieModel) async {
    var categorieData = await supabaseClient.from('categories').insert(categorieModel).select();
    return CategorieModel.fromJson(categorieData.first);

  }

  @override
  bool deleteCategor(String id) {
    // TODO: implement deleteCategor
    throw UnimplementedError();
  }

  @override
  Future<List<CategorieModel>> listCategorie() async {
    var categorieListData = await supabaseClient.from('categories').select();
    return categorieListData.map((categorieData)=>CategorieModel.fromJson(categorieData)).toList();
  }

  @override
  Future<CategorieModel> updateCategorie(CategorieModel categorieModel) async{
    var updatedCategorieData = await supabaseClient
        .from('categories')
        .update(categorieModel.toJson())
        .eq('id', categorieModel.id)
        .select();
    return CategorieModel.fromJson(updatedCategorieData.first);
  }


  
}