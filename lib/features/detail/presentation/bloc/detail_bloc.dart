import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tech_test_vokraf_pokedex/core/error/failure.dart';
import 'package:tech_test_vokraf_pokedex/features/detail/domain/entities/pokemon_detail.dart';
import 'package:tech_test_vokraf_pokedex/features/detail/domain/usecases/get_detail_pokemon.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final GetDetailPokemon getDetailPokemon;
  DetailBloc({required this.getDetailPokemon}) : super(DetailInitial()) {
    on<DetailEventGetPokemon>((event, emit) async {
      try {
        emit(DetailStateLoading());
        final resultGetPokemon =
            await getDetailPokemon.getDetailPokemon(event.id);
        resultGetPokemon.fold((failure) {
          if (failure is GeneralFailure) {
            emit(DetailStateError(message: failure.message));
          }
        }, (result) {
          emit(DetailStateLoaded(pokemon: result));
        });
      } catch (e) {
        print(e);
        emit(const DetailStateError(message: "Cannot get data pokemons"));
      }
    });
  }
}
