import 'package:flutter/material.dart';

class BottomLoadingBarWidget extends StatelessWidget {
  const BottomLoadingBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(children: const [
      SizedBox(height: 32),
      Center(
          child: CircularProgressIndicator(
              color: Colors.white)),
      SizedBox(height: 32),
    ]));
  }
  }