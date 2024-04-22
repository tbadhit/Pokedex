import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_test_vokraf_pokedex/core/injection/dependency_injection.dart';
import 'package:tech_test_vokraf_pokedex/core/routes/app_path.dart';
import 'package:tech_test_vokraf_pokedex/core/routes/app_route.dart';
import 'package:tech_test_vokraf_pokedex/core/utils/constants/color_constants.dart';
import 'package:tech_test_vokraf_pokedex/core/utils/navigator_helper/navigator_helper.dart';
import 'package:tech_test_vokraf_pokedex/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:tech_test_vokraf_pokedex/features/home/presentation/bloc/home_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencyInjection();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => serviceLocator<HomeBloc>(),
      ),
      BlocProvider(
        create: (context) => serviceLocator<DetailBloc>(),
      )
    ], child: MainAppView());
  }
}

class MainAppView extends StatelessWidget {
  const MainAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: ColorConstants.primaryColor),
        useMaterial3: false,
      ),
      navigatorKey: navigatorKey,
      onGenerateRoute: AppRoute.onGenerateRoute,
      initialRoute: AppPath.home,
    );
  }
}
