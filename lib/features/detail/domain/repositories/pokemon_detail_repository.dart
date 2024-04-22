import 'package:dartz/dartz.dart';
import 'package:tech_test_vokraf_pokedex/core/error/failure.dart';
import 'package:tech_test_vokraf_pokedex/features/detail/domain/entities/pokemon_detail.dart';

abstract class PokemonDetailRepository {
  Future<Either<Failure, PokemonDetail>> getDetailPokemon(int id);
}