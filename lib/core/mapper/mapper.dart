import 'package:tech_test_vokraf_pokedex/core/utils/color_generator.dart';
import 'package:tech_test_vokraf_pokedex/features/detail/data/models/pokemon_detail_model.dart';
import 'package:tech_test_vokraf_pokedex/features/detail/domain/entities/pokemon_detail.dart';

PokemonDetail mapPokemonDetailModelToPokemonDetail(
    PokemonDetailModel pokemonDetailModel) {
  return PokemonDetail(
    name: pokemonDetailModel.name,
    id: pokemonDetailModel.id,
    idString: "#${pokemonDetailModel.id.toString().padLeft(3, '0')}",
    imageURL:
        "https://assets.pokemon.com/assets/cms2/img/pokedex/full/${pokemonDetailModel.id.toString().padLeft(3, '0')}.png",
    types: pokemonDetailModel.types.map((type) => type.type.name).toList(),
    weight: pokemonDetailModel.weight.toDouble(),
    height: pokemonDetailModel.height.toDouble(),
    moves: pokemonDetailModel.abilities
        .map((move) => move.ability.name
            .replaceRange(0, 1, move.ability.name[0].toUpperCase()))
        .toList(),
    flavorText: pokemonDetailModel.flavorText?.replaceAll(RegExp(r"\n|\f"), "") ?? "",
    stats: Stats(
      hp: pokemonDetailModel.stats[0].baseStat.toDouble(),
      atk: pokemonDetailModel.stats[1].baseStat.toDouble(),
      def: pokemonDetailModel.stats[2].baseStat.toDouble(),
      satk: pokemonDetailModel.stats[3].baseStat.toDouble(),
      sdef: pokemonDetailModel.stats[4].baseStat.toDouble(),
      spd: pokemonDetailModel.stats[5].baseStat.toDouble(),
    ),
    color: colorGenerator(pokemonDetailModel.color!)
  );
}
