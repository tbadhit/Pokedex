class PokemonDetailModel {
    final List<AbilityModel> abilities;
    final int height;
    final int id;
    final List<MoveModel> moves;
    final String name;
    final int order;
    final Species species;
    final List<StatModel> stats;
    final List<TypeModel> types;
    final int weight;
    String? flavorText;
    String? color;

    PokemonDetailModel({
        required this.abilities,
        required this.height,
        required this.id,
        required this.moves,
        required this.name,
        required this.order,
        required this.species,
        required this.stats,
        required this.types,
        required this.weight,
        this.flavorText,
        this.color,
    });

    factory PokemonDetailModel.fromJson(Map<String, dynamic> json) => PokemonDetailModel(
        abilities: List<AbilityModel>.from(json["abilities"].map((x) => AbilityModel.fromJson(x))),
        height: json["height"],
        id: json["id"],
        moves: List<MoveModel>.from(json["moves"].map((x) => MoveModel.fromJson(x))),
        name: (json["name"] as String)
            .replaceRange(0, 1, (json["name"] as String)[0].toUpperCase()),
        order: json["order"],
        species: Species.fromJson(json["species"]),
        stats: List<StatModel>.from(json["stats"].map((x) => StatModel.fromJson(x))),
        types: List<TypeModel>.from(json["types"].map((x) => TypeModel.fromJson(x))),
        weight: json["weight"],
    );
}

class AbilityModel {
    final Species ability;
    final bool isHidden;
    final int slot;

    AbilityModel({
        required this.ability,
        required this.isHidden,
        required this.slot,
    });

    factory AbilityModel.fromJson(Map<String, dynamic> json) => AbilityModel(
        ability: Species.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
    );
}

class Species {
    final String name;
    final String url;

    Species({
        required this.name,
        required this.url,
    });

    factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
    );
}

class MoveModel {
    final Species move;

    MoveModel({
        required this.move,
    });

    factory MoveModel.fromJson(Map<String, dynamic> json) => MoveModel(
        move: Species.fromJson(json["move"]),
    );
}



class StatModel {
    final int baseStat;
    final int effort;
    final Species stat;

    StatModel({
        required this.baseStat,
        required this.effort,
        required this.stat,
    });

    factory StatModel.fromJson(Map<String, dynamic> json) => StatModel(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: Species.fromJson(json["stat"]),
    );
}

class TypeModel {
    final int slot;
    final Species type;

    TypeModel({
        required this.slot,
        required this.type,
    });

    factory TypeModel.fromJson(Map<String, dynamic> json) => TypeModel(
        slot: json["slot"],
        type: Species.fromJson(json["type"]),
    );
}
