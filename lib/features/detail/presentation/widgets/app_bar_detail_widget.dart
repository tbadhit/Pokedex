
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_test_vokraf_pokedex/core/utils/constants/dimension_constants.dart';
import 'package:tech_test_vokraf_pokedex/core/utils/navigator_helper/navigator_helper.dart';
import 'package:tech_test_vokraf_pokedex/features/detail/presentation/bloc/detail_bloc.dart';

class AppBarDetailWidget extends StatelessWidget {
  const AppBarDetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final stateLoaded = (context.read<DetailBloc>().state as DetailStateLoaded);
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: DimensionConstants.pixel20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 35,
                    )),
                const SizedBox(
                  width: DimensionConstants.pixel10,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 2,
                  child: Text(
                    stateLoaded.pokemon.name,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 60,
            child: Text(
              stateLoaded.pokemon.idString,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
