import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_test_vokraf_pokedex/features/home/presentation/bloc/home_bloc.dart';
import 'package:tech_test_vokraf_pokedex/features/home/presentation/widgets/pokemon_card_item_widget.dart';

class CustomSilverGridWidget extends StatelessWidget {
  const CustomSilverGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final pokemon = context.read<HomeBloc>().state.pokemons[index];
            return PokemonCardItemWidget(
              pokemon: pokemon,
            );
          },
          childCount:
               context.read<HomeBloc>().state.pokemons.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 200,
        ),
      ),
    );
  }
}
