import 'package:bookshop/Feature/repos/home_repo_implementation.dart';
import 'package:bookshop/Feature/view_model/featured_books_cubit/cubit/featured_books_cubit.dart';
import 'package:bookshop/constants.dart';
import 'package:bookshop/core/utils/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getit.get<HomeRepoImplementation>())
                ..fetchFeatureBooksCubit(),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.router,
        // home: const SpalshView(),
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: AppColors.primaryColor),
      ),
    );
  }
}
