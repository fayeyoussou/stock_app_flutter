import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_app/features/categorie/presentation/bloc/categorie_bloc.dart';

import '../../data/models/categorie_model.dart';

class CategorieCreateUpdatePage extends StatefulWidget {
  CategorieCreateUpdatePage({super.key, this.categorieModel});

  final CategorieModel? categorieModel;

  @override
  CategorieCreateUpdatePageState createState() =>
      CategorieCreateUpdatePageState();
}

class CategorieCreateUpdatePageState extends State<CategorieCreateUpdatePage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController categorieController = TextEditingController();

  _validate() async {
    if (_formkey.currentState!.validate() && mounted) {
      final categorieBloc = context
          .read<CategorieBloc>();
      if(widget.categorieModel == null){
        categorieBloc.add(CreatingCategorieEvent(categorieController.text.trim()));
      } else {
        categorieBloc.add(UpdatingCategorieEvent(categorieController.text.trim(),widget.categorieModel!.id));

      }
      Navigator.of(context).pop();
    }
  }
  @override
  void initState() {
    if(widget.categorieModel !=null){
      categorieController.text = widget.categorieModel!.nom;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Categorie ${widget.categorieModel == null ? 'Creation' : '${widget.categorieModel?.nom} Mise a jour'} '),
        actions: [
          IconButton(
              onPressed: _validate,
              icon: Icon(
                  widget.categorieModel == null ? Icons.check : Icons.update))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.15),
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width * 0.7,
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(

                  decoration: InputDecoration(
                    label: const Text('Categorie name'),
                    fillColor: Colors.blue,
                    contentPadding: const EdgeInsets.all(10),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.lightBlueAccent, width: 3),
                        borderRadius: BorderRadius.circular(13)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.lightBlueAccent, width: 4),
                        borderRadius: BorderRadius.circular(15)),
                    errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red, width: 4),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blueGrey, width: 3),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  controller: categorieController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez donner un nom au categorie';
                    } else {
                      return null;
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
