import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_app/features/categorie/presentation/pages/categorie_create_update_page.dart';

import '../../../../core/common/widgets/loader.dart';
import '../bloc/categorie_bloc.dart';

class CategorieListPage extends StatefulWidget {
  const CategorieListPage({Key? key}) : super(key: key);

  @override
  State<CategorieListPage> createState() => _CategorieListPageState();
}

class _CategorieListPageState extends State<CategorieListPage> {
  @override
  void initState() {
    context.read<CategorieBloc>().add(ListingCategorieEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Categorie'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/create_categorie');
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocConsumer<CategorieBloc, CategorieState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          if (state is CategorieLoadingState) {
            return Loader();
          }
          if (state is CategorieSuccessState && state.categories != null) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.1,
                left: MediaQuery.of(context).size.width * 0.1,
              ),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.categories?.length ?? 0,
                      itemBuilder: (context, id) => ListTile(
                        hoverColor: Colors.amber,
                        textColor: Colors.black54,
                        leading: const Icon(Icons.category),
                        contentPadding: const EdgeInsets.all(8),
                        title: Text(state.categories![id].nom,style: const TextStyle(color: Colors.black12),),
                        trailing: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return CategorieCreateUpdatePage(
                                    categorieModel: state.categories![id],
                                  );
                                },
                              ),
                            );
                          },
                          icon: const Icon(Icons.mode),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}