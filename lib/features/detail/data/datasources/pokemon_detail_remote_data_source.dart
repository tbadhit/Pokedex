import 'dart:convert';

import 'package:tech_test_vokraf_pokedex/features/detail/data/datasources/pokemon_species_model.dart';
import 'package:tech_test_vokraf_pokedex/features/detail/data/models/pokemon_detail_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';

abstract class PokemonDetailRemoteDataSource {
  Future<PokemonDetailModel> getDetailPokemon(int id);
}

class PokemonDetailRemoteDataSourceImplementation
    extends PokemonDetailRemoteDataSource {
  @override
  Future<PokemonDetailModel> getDetailPokemon(int id) async {
    final url = Uri.parse("https://pokeapi.co/api/v2/pokemon/$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      PokemonDetailModel pokemonDetail = PokemonDetailModel.fromJson(responseBody);
      final responsePokemonSpecies = await http.get(Uri.parse(pokemonDetail.species.url));
      if (responsePokemonSpecies.statusCode == 200) {
        final responsePokemonSpeciesBody = jsonDecode(responsePokemonSpecies.body);
        final pokemonSpecies = PokemonSpeciesModel.fromJson(responsePokemonSpeciesBody);
        pokemonDetail.flavorText = pokemonSpecies.flavorTextEntries.first.flavorText;
        pokemonDetail.color = pokemonSpecies.color.name;
      }
      return pokemonDetail;
    } else if (response.statusCode == 404) {
      throw const StatusCodeException(message: "Data not found - error 404");
    } else {
      throw const GeneralException(message: "Cannot get data pokemon");
    }
  }
}
