part of 'detail_bloc.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailInitial extends DetailState {}

class DetailStateLoading extends DetailState {}

class DetailStateLoaded extends DetailState {
  final PokemonDetail pokemon;

  const DetailStateLoaded({required this.pokemon});
}

class DetailStateEmpty extends DetailState {}

class DetailStateError extends DetailState {
  final String message;

  const DetailStateError({required this.message});

  @override
  List<Object> get props => [message];
}
