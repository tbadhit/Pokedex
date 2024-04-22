part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState(this.pokemons);
  final List<Pokemon> pokemons;

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial(super.pokemons);
}

class HomeStateEmpty extends HomeState {
  const HomeStateEmpty(super.pokemons);
}

class HomeStateLoading extends HomeState {
  const HomeStateLoading(super.pokemons);
}

class HomeStateLoaded extends HomeState {
  const HomeStateLoaded(super.pokemons);
}

class HomeStateError extends HomeState {
  final String message;

  const HomeStateError(super.pokemons, {required this.message});

  @override
  List<Object> get props => [message];
}
