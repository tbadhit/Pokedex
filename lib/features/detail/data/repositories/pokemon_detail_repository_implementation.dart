import 'package:dartz/dartz.dart';
import 'package:tech_test_vokraf_pokedex/core/error/failure.dart';
import 'package:tech_test_vokraf_pokedex/core/mapper/mapper.dart';
import 'package:tech_test_vokraf_pokedex/features/detail/data/datasources/pokemon_detail_remote_data_source.dart';
import 'package:tech_test_vokraf_pokedex/features/detail/domain/entities/pokemon_detail.dart';
import 'package:tech_test_vokraf_pokedex/features/detail/domain/repositories/pokemon_detail_repository.dart';

class PokemonDetailRepositoryImplementation extends PokemonDetailRepository {
  final PokemonDetailRemoteDataSource pokemonDetailRemoteDataSource;

  PokemonDetailRepositoryImplementation(
      {required this.pokemonDetailRemoteDataSource});

  @override
  Future<Either<Failure, PokemonDetail>> getDetailPokemon(int id) async {
    try {
      final pokemon = await pokemonDetailRemoteDataSource.getDetailPokemon(id);
      return Right(mapPokemonDetailModelToPokemonDetail(pokemon));
    } catch (e) {
      return const Left(GeneralFailure(message: "Cannot get data pokemon"));
    }
  }
}
