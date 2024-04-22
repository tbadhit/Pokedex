part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class DetailEventGetPokemon extends DetailEvent {
  final int id;

  const DetailEventGetPokemon({required this.id});
}
