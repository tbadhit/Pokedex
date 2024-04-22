import 'dart:core';

extension XString on String {
  String getPokemonIdFromURL() {
    RegExp regex =
        RegExp(r'/(\d+)/'); // Raw string literal for regular expression

    Match? match = regex.firstMatch(this);
    if (match != null) {
      String pokemonId = match
          .group(1)!; // Access captured group using "!" for non-null assertion
      return pokemonId;
    } else {
      throw Exception("No Pokemon ID found in the URL");
    }
  }
}
