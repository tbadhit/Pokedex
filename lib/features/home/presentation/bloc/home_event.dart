part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeEventGetPokemons extends HomeEvent {
  final int limit;
  final int offset;

  const HomeEventGetPokemons({this.limit = 8, this.offset = 0});
}
