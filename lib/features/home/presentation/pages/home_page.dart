import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_test_vokraf_pokedex/core/utils/constants/color_constants.dart';
import 'package:tech_test_vokraf_pokedex/features/home/presentation/bloc/home_bloc.dart';
import 'package:tech_test_vokraf_pokedex/features/home/presentation/widgets/app_bar_home_widget.dart';
import 'package:tech_test_vokraf_pokedex/features/home/presentation/widgets/bottom_loading_bar_widget.dart';
import 'package:tech_test_vokraf_pokedex/features/home/presentation/widgets/custom_silver_grid_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  var offset = 0;
  bool isAtBottom = false;
  bool isLoadData = false;

  @override
  void initState() {
    context.read<HomeBloc>().add(const HomeEventGetPokemons(limit: 20));
    pokemonLazyLoading();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> pokemonLazyLoading() async {
    setState(() {
      isAtBottom = true;
      isLoadData = true;
    });
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        bool isTop = _scrollController.position.pixels == 0;
        if (!isTop) {
          if (offset <= 980) {
            offset += 20;
            context.read<HomeBloc>().add(HomeEventGetPokemons(offset: offset));
          } else {
            setState(() {
              isAtBottom = false;
              isLoadData = false;
            });
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryColor,
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            const AppBarHomeWidget(),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeStateLoaded) {
                  return const CustomSilverGridWidget();
                }
                if (state is HomeStateError) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }
                if (state is HomeStateEmpty) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: Text("No data"),
                    ),
                  );
                }
                return const CustomSilverGridWidget();
              },
            ),
            if (isAtBottom && isLoadData) const BottomLoadingBarWidget(),
            if (isAtBottom && !isLoadData)
              const SliverToBoxAdapter(child: SizedBox(height: 22))
          ],
        ),
      ),
    );
  }
}
