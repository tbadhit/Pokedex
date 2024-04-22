import 'package:flutter/material.dart';
import 'package:tech_test_vokraf_pokedex/core/utils/constants/color_constants.dart';
import 'package:tech_test_vokraf_pokedex/core/utils/constants/image_constants.dart';
import 'package:tech_test_vokraf_pokedex/features/home/presentation/widgets/search_widget.dart';

class AppBarHomeWidget extends StatelessWidget {
  const AppBarHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverAppBar(
        expandedHeight: 130,
        backgroundColor: ColorConstants.primaryColor,
        elevation: 0,
        pinned: false,
        floating: true,
        automaticallyImplyLeading: false,
        flexibleSpace: FlexibleSpaceBar(
          background: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    ImageConstants.logo,
                    width: 40,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Pokédex",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SearchWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
