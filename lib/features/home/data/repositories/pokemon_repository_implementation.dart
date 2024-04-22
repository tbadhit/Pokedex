import 'package:dartz/dartz.dart';
import 'package:tech_test_vokraf_pokedex/core/error/failure.dart';
import 'package:tech_test_vokraf_pokedex/features/home/data/datasources/remote_datasource.dart';
import 'package:tech_test_vokraf_pokedex/features/home/domain/entities/pokemon.dart';
import 'package:tech_test_vokraf_pokedex/features/home/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImplementation extends PokemonRepository {
  final PokemonRemoteDataSource pokemonRemoteDataSource;
  PokemonRepositoryImplementation({required this.pokemonRemoteDataSource});
  @override
  Future<Either<Failure, List<Pokemon>>> getPokemons(int limit, int offset) async {
    try {
      final pokemons = await pokemonRemoteDataSource.getPokemons(limit, offset);
      return Right(pokemons);
    } catch (e) {
      return const Left(GeneralFailure(message: "Cannot get data pokemons"));
    }
  }

}