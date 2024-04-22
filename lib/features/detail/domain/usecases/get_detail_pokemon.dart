import 'package:tech_test_vokraf_pokedex/core/error/failure.dart';
import 'package:tech_test_vokraf_pokedex/features/detail/domain/entities/pokemon_detail.dart';
import 'package:tech_test_vokraf_pokedex/features/detail/domain/repositories/pokemon_detail_repository.dart';
import 'package:dartz/dartz.dart';

class GetDetailPokemon {
  final PokemonDetailRepository pokemonDetailRepository;

  GetDetailPokemon({required this.pokemonDetailRepository});

  Future<Either<Failure, PokemonDetail>> getDetailPokemon(int id) async {
    return await pokemonDetailRepository.getDetailPokemon(id);
  }
}