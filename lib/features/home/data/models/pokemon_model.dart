import 'package:tech_test_vokraf_pokedex/core/extensions/x_string.dart';
import 'package:tech_test_vokraf_pokedex/features/home/domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  final String url;

  PokemonModel({
    required super.name,
    required this.url,
  }) : super(
          id: int.parse(url.getPokemonIdFromURL()),
          idString: "#${url.getPokemonIdFromURL().padLeft(3, '0')}",
          imageUrl:
              "https://assets.pokemon.com/assets/cms2/img/pokedex/full/${url.getPokemonIdFromURL().padLeft(3, '0')}.png",
        );

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        name: (json["name"] as String)
            .replaceRange(0, 1, (json["name"] as String)[0].toUpperCase()),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
