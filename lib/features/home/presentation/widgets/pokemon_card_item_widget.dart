import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tech_test_vokraf_pokedex/core/routes/app_path.dart';
import 'package:tech_test_vokraf_pokedex/core/utils/navigator_helper/navigator_helper.dart';
import 'package:tech_test_vokraf_pokedex/features/home/domain/entities/pokemon.dart';

class PokemonCardItemWidget extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCardItemWidget({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Di tap");
        push(AppPath.detail, arguments: pokemon.id);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: LayoutBuilder(builder: (context, constranits) {
                final parentHeight = constranits.maxHeight;
                return Container(
                  height: parentHeight / 2,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              }),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          Text(
                            pokemon.idString,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    CachedNetworkImage(
                      imageUrl: pokemon.imageUrl,
                      width: 150,
                    ),
                    Expanded(
                      child: Text(
                        "${pokemon.name}",
                        maxLines: null,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
