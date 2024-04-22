import 'dart:convert';

import 'package:tech_test_vokraf_pokedex/core/error/exception.dart';
import 'package:tech_test_vokraf_pokedex/features/home/data/models/pokemon_model.dart';
import 'package:http/http.dart' as http;
import 'package:tech_test_vokraf_pokedex/features/home/data/models/pokemon_response_model.dart';

abstract class PokemonRemoteDataSource {
  Future<List<PokemonModel>> getPokemons(
    int limit,
    int offset,
  );
}

class PokemonRemoteDataSourceImplementation extends PokemonRemoteDataSource {
  @override
  Future<List<PokemonModel>> getPokemons(
      int limit, int offset) async {
    Map<String, String> queryParameters = {
      'limit': "$limit",
      'offset': "$offset",
    };
    Uri url = Uri.parse("https://pokeapi.co/api/v2/pokemon?limit")
        .replace(queryParameters: queryParameters);

    final response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      PokemonResponseModel pokemonResponseModel =
          PokemonResponseModel.fromJson(responseBody);
      List<PokemonModel> pokemons = pokemonResponseModel.results;
      return pokemons;
    } else if (response.statusCode == 404) {
      throw const StatusCodeException(message: "Data not found - error 404");
    } else {
      throw const GeneralException(message: "Cannot get data pokemons");
    }
  }
}
