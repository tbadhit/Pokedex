import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_test_vokraf_pokedex/core/utils/constants/dimension_constants.dart';
import 'package:tech_test_vokraf_pokedex/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:tech_test_vokraf_pokedex/features/detail/presentation/widgets/stats_row_widgets.dart';

class ContentDetailWidget extends StatelessWidget {
  const ContentDetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final detailBloc = context.read<DetailBloc>();
    final stateLoaded = (detailBloc.state as DetailStateLoaded);

    return Positioned(
      top: 50.0,
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // IMAGE
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: DimensionConstants.pixel20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                stateLoaded.pokemon.id == 1
                    ? Container()
                    : IconButton(
                        onPressed: () {
                          detailBloc.add(DetailEventGetPokemon(
                              id: stateLoaded.pokemon.id - 1));
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                CachedNetworkImage(
                  imageUrl: stateLoaded.pokemon.imageURL,
                  width: DimensionConstants.pixel200,
                ),
                IconButton(
                    onPressed: () {
                      detailBloc.add(DetailEventGetPokemon(
                          id: stateLoaded.pokemon.id + 1));
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          // TYPES
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: stateLoaded.pokemon.types
                .map(
                  (type) => Container(
                    padding: const EdgeInsets.all(DimensionConstants.pixel10),
                    decoration: BoxDecoration(
                        color: stateLoaded.pokemon.color,
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      type,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(
            height: DimensionConstants.pixel20,
          ),
          // ABOUT
          Text(
            "About",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold, color: stateLoaded.pokemon.color),
          ),
          const SizedBox(
            height: DimensionConstants.pixel20,
          ),
          // INFO LAIN
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.scale),
                      const SizedBox(
                        width: DimensionConstants.pixel10,
                      ),
                      Text(
                        "${stateLoaded.pokemon.weight}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: DimensionConstants.pixel20,
                  ),
                  Text(
                    "Weight",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: Colors.grey),
                  ),
                ],
              ),
              Container(
                width: 1.0,
                height: 70,
                color: Colors.grey,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.height),
                      const SizedBox(
                        width: DimensionConstants.pixel10,
                      ),
                      Text(
                        "${stateLoaded.pokemon.height}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: DimensionConstants.pixel20,
                  ),
                  Text(
                    "Height",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: Colors.grey),
                  ),
                ],
              ),
              Container(
                width: 1.0,
                height: 70,
                color: Colors.grey,
              ),
              Column(
                children: [
                  ...stateLoaded.pokemon.moves.map((move) => Text(
                        move,
                        style: Theme.of(context).textTheme.titleMedium,
                      )),
                  const SizedBox(
                    height: DimensionConstants.pixel20,
                  ),
                  Text(
                    "Moves",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: DimensionConstants.pixel20,
          ),
          // DESCRIPTION
          Container(
            // width: double.infinity,
            margin: const EdgeInsets.symmetric(
                horizontal: DimensionConstants.pixel30),
            child: Text(stateLoaded.pokemon.flavorText,
                style: Theme.of(context).textTheme.titleSmall),
          ),
          const SizedBox(
            height: DimensionConstants.pixel30,
          ),
          Text(
            "Base Stats",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold, color: stateLoaded.pokemon.color),
          ),
          const SizedBox(
            height: DimensionConstants.pixel20,
          ),
          // STATS
          StatsRowWidget(
            name: "HP",
            statNum: stateLoaded.pokemon.stats.hp,
          ),
          StatsRowWidget(name: "ATK", statNum: stateLoaded.pokemon.stats.atk),
          StatsRowWidget(name: "DEF", statNum: stateLoaded.pokemon.stats.def),
          StatsRowWidget(name: "SATK", statNum: stateLoaded.pokemon.stats.satk),
          StatsRowWidget(name: "SDEF", statNum: stateLoaded.pokemon.stats.sdef),
          StatsRowWidget(name: "SPD", statNum: stateLoaded.pokemon.stats.spd),
        ],
      ),
    );
  }
}
