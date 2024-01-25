import 'dart:ui';

import 'package:bookshop/Feature/presentation/views/widgets/book_item_detailes.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'Feature/presentation/views/home.dart';
import 'Feature/presentation/views/splash_view.dart';

class AppColors {
  static const primaryColor = Color(0xff100B20);
}

class AppRoutes {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SpalshView();
        },
      ),
      GoRoute(
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: '/bookDetails',
        builder: (BuildContext context, GoRouterState state) {
          return const BookDetailes();
        },
      ),
    ],
  );
}
