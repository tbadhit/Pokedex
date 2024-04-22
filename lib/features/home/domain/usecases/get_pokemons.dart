import 'package:dartz/dartz.dart';
import 'package:tech_test_vokraf_pokedex/core/error/failure.dart';
import 'package:tech_test_vokraf_pokedex/features/home/domain/repositories/pokemon_repository.dart';

import '../entities/pokemon.dart';

class GetPokemons {
  final PokemonRepository pokemonRepository;

  const GetPokemons({required this.pokemonRepository});

  Future<Either<Failure, List<Pokemon>>> execute(
      {int limit = 8, int offset = 0}) async {
    return await pokemonRepository.getPokemons(limit, offset);
  }
}
