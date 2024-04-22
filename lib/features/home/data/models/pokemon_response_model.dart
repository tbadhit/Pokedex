import 'package:tech_test_vokraf_pokedex/features/home/data/models/pokemon_model.dart';

class PokemonResponseModel {
    final int count;
    final String? next;
    final String? previous;
    final List<PokemonModel> results;

    PokemonResponseModel({
        required this.count,
        required this.next,
        required this.previous,
        required this.results,
    });

    factory PokemonResponseModel.fromJson(Map<String, dynamic> json) => PokemonResponseModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<PokemonModel>.from(json["results"].map((x) => PokemonModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}