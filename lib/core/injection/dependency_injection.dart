import 'package:get_it/get_it.dart';
import 'package:tech_test_vokraf_pokedex/features/detail/data/datasources/pokemon_detail_remote_data_source.dart';
import 'package:tech_test_vokraf_pokedex/features/detail/data/repositories/pokemon_detail_repository_implementation.dart';
import 'package:tech_test_vokraf_pokedex/features/detail/domain/repositories/pokemon_detail_repository.dart';
import 'package:tech_test_vokraf_pokedex/features/detail/domain/usecases/get_detail_pokemon.dart';
import 'package:tech_test_vokraf_pokedex/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:tech_test_vokraf_pokedex/features/home/data/datasources/remote_datasource.dart';
import 'package:tech_test_vokraf_pokedex/features/home/data/repositories/pokemon_repository_implementation.dart';
import 'package:tech_test_vokraf_pokedex/features/home/domain/repositories/pokemon_repository.dart';
import 'package:tech_test_vokraf_pokedex/features/home/domain/usecases/get_pokemons.dart';
import 'package:tech_test_vokraf_pokedex/features/home/presentation/bloc/home_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencyInjection() async {
  // HOME
  serviceLocator.registerFactory(
    () => HomeBloc(
      getPokemons: serviceLocator.call(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => GetPokemons(
      pokemonRepository: serviceLocator.call(),
    ),
  );

  serviceLocator.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImplementation(
      pokemonRemoteDataSource: serviceLocator.call(),
    ),
  );

  serviceLocator.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonRemoteDataSourceImplementation(),
  );

  // DETAIL
  serviceLocator.registerFactory(
    () => DetailBloc(
      getDetailPokemon: serviceLocator.call(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => GetDetailPokemon(
      pokemonDetailRepository: serviceLocator.call(),
    ),
  );
  serviceLocator.registerLazySingleton<PokemonDetailRepository>(
    () => PokemonDetailRepositoryImplementation(
      pokemonDetailRemoteDataSource: serviceLocator.call(),
    ),
  );
  serviceLocator.registerLazySingleton<PokemonDetailRemoteDataSource>(
    () => PokemonDetailRemoteDataSourceImplementation(),
  );
}
