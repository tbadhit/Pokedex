
import 'package:flutter/material.dart';
import 'package:tech_test_vokraf_pokedex/core/utils/constants/image_constants.dart';

class BackgroundDetailWidget extends StatelessWidget {
  const BackgroundDetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Image.asset(
                ImageConstants.logo,
                fit: BoxFit.contain,
                height: MediaQuery.sizeOf(context).width / 1.5,
                opacity: const AlwaysStoppedAnimation(0.1),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height / 1.6,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
          ),
        ],
      ),
    );
  }
}
