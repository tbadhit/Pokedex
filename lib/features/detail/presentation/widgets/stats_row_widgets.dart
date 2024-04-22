
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_test_vokraf_pokedex/core/utils/constants/dimension_constants.dart';

import '../bloc/detail_bloc.dart';

class StatsRowWidget extends StatelessWidget {
  final String name;
  final double statNum;
  const StatsRowWidget({super.key, required this.name, required this.statNum});

  @override
  Widget build(BuildContext context) {
    final stateLoaded = (context.read<DetailBloc>().state as DetailStateLoaded);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(name,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold, color: stateLoaded.pokemon.color)),
              const SizedBox(
                width: DimensionConstants.pixel10,
              ),
              Container(
                width: 1.0,
                height: 20,
                color: Colors.grey,
              ),
              const SizedBox(
                width: DimensionConstants.pixel10,
              ),
              Text("${statNum}",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Colors.black)),
              const SizedBox(
                width: DimensionConstants.pixel10,
              ),
              Expanded(
                child: LayoutBuilder(builder: (_, constraints) {
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: stateLoaded.pokemon.color.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(200),
                        ),
                        height: 8,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.linear,
                        height: 8,
                        width: statNum,
                        decoration: BoxDecoration(
                          color: stateLoaded.pokemon.color,
                          borderRadius: BorderRadius.circular(200),
                        ),
                      ),
                    ],
                  );
                }),
              )
            ],
          ),
        ],
      ),
    );
  }
}
