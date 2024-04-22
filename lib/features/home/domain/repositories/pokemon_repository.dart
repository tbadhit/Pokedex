import 'package:dartz/dartz.dart';
import 'package:tech_test_vokraf_pokedex/core/error/failure.dart';
import 'package:tech_test_vokraf_pokedex/features/home/domain/entities/pokemon.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<Pokemon>>> getPokemons(int limit, int offset);
}