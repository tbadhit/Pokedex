class PokemonSpeciesModel {
    final Color color;
    final List<FlavorTextEntry> flavorTextEntries;

    PokemonSpeciesModel({
        required this.color,
        required this.flavorTextEntries,
    });

    factory PokemonSpeciesModel.fromJson(Map<String, dynamic> json) => PokemonSpeciesModel(
        color: Color.fromJson(json["color"]),
        flavorTextEntries: List<FlavorTextEntry>.from(json["flavor_text_entries"].map((x) => FlavorTextEntry.fromJson(x))),
    );
}

class Color {
    final String name;
    final String url;

    Color({
        required this.name,
        required this.url,
    });

    factory Color.fromJson(Map<String, dynamic> json) => Color(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}

class FlavorTextEntry {
    final String flavorText;

    FlavorTextEntry({
        required this.flavorText,
    });

    factory FlavorTextEntry.fromJson(Map<String, dynamic> json) => FlavorTextEntry(
        flavorText: json["flavor_text"],
    );
}
