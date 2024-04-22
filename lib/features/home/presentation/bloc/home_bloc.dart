import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tech_test_vokraf_pokedex/core/error/failure.dart';
import 'package:tech_test_vokraf_pokedex/features/home/domain/usecases/get_pokemons.dart';

import '../../domain/entities/pokemon.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetPokemons getPokemons;
  HomeBloc({
    required this.getPokemons,
  }) : super(HomeInitial( [])) {
    on<HomeEventGetPokemons>((event, emit) async {
      try {
        emit(HomeStateLoading(state.pokemons));
        final resultGetPokemons = await getPokemons.execute(limit: event.limit, offset: event.offset);
        resultGetPokemons.fold((failure) {
          if (failure is GeneralFailure) {
            emit(HomeStateError(state.pokemons,message: failure.message));
          }
        }, (result) {
          if (result.isEmpty) emit(HomeStateEmpty(state.pokemons));
          for (var pokemon in result) {
            state.pokemons.add(pokemon);
          }
          emit(HomeStateLoaded(state.pokemons));
        });
      } catch (e) {
        print(e);
        emit( HomeStateError(state.pokemons, message: "Cannot get data pokemons"));
      }
    });
  }
}
