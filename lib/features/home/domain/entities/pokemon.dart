import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final int id;
  final String idString;
  final String name;
  final String imageUrl;

  const Pokemon(
      {required this.id,
      required this.idString,
      required this.name,
      required this.imageUrl});

  @override
  List<Object?> get props => [
        id,
        idString,
        name,
        imageUrl,
      ];
}
