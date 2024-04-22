import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class PokemonDetail extends Equatable {
  final String name;
  final int id;
  final String idString;
  final String imageURL;
  final List<String> types;
  final double weight;
  final double height;
  final List<String> moves;
  final String flavorText;
  final Stats stats;
  final Color color;

  const PokemonDetail(
      {required this.name,
      required this.id,
      required this.idString,
      required this.imageURL,
      required this.types,
      required this.weight,
      required this.height,
      required this.moves,
      required this.flavorText,
      required this.stats,
      required this.color});

  @override
  List<Object?> get props => [
        name,
        id,
        idString,
        imageURL,
        types,
        weight,
        height,
        moves,
        flavorText,
        stats,
        color
      ];
}

class Stats extends Equatable {
  final double hp;
  final double atk;
  final double def;
  final double satk;
  final double sdef;
  final double spd;

  const Stats(
      {required this.hp,
      required this.atk,
      required this.def,
      required this.satk,
      required this.sdef,
      required this.spd});

  @override
  List<Object?> get props => [
        hp,
        atk,
        def,
        satk,
        sdef,
        spd,
      ];
}
