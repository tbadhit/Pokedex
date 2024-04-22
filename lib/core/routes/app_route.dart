import 'package:flutter/material.dart';
import 'package:tech_test_vokraf_pokedex/core/routes/app_path.dart';
import 'package:tech_test_vokraf_pokedex/features/detail/presentation/pages/detail_page.dart';
import 'package:tech_test_vokraf_pokedex/features/home/presentation/pages/home_page.dart';

abstract class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppPath.home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case AppPath.detail:
        int? id;
        if (settings.arguments is int) {
          id = settings.arguments as int;
        }
        return MaterialPageRoute(
          builder: (_) => DetailPage(
            id: id,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
    }
  }
}
