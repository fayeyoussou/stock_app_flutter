import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_app/core/theme/theme.dart';
import 'package:stock_app/features/categorie/presentation/bloc/categorie_bloc.dart';
import 'package:stock_app/features/categorie/presentation/pages/categorie_create_update_page.dart';
import 'package:stock_app/features/categorie/presentation/pages/categorie_list_page.dart';
import 'package:stock_app/welcome_screen.dart';

import 'init_dependency.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => serviceLocator<CategorieBloc>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/list_categorie': (ctx) => const CategorieListPage(),
        '/create_categorie': (ctx) =>  CategorieCreateUpdatePage(),
        '/': (ctx) => const WelcomeScreen (),
      },
    );
  }
}
