import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_test_vokraf_pokedex/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:tech_test_vokraf_pokedex/features/detail/presentation/widgets/app_bar_detail_widget.dart';
import 'package:tech_test_vokraf_pokedex/features/detail/presentation/widgets/background_detail_widget.dart';
import 'package:tech_test_vokraf_pokedex/features/detail/presentation/widgets/content_detail_widget.dart';

class DetailPage extends StatelessWidget {
  final int? id;
  const DetailPage({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    final detailBloc = context.read<DetailBloc>();
    detailBloc.add(DetailEventGetPokemon(id: id!));
    return BlocBuilder<DetailBloc, DetailState>(
      builder: (context, state) {
        if (state is DetailStateLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white,),
          );
        }
        if (state is DetailInitial) {
          return Container();
        }
        if (state is DetailStateEmpty) {
          return const Center(
            child: Text("Empty"),
          );
        }
        if (state is DetailStateError) {
          return  Center(
            child: Text(state.message),
          );
        }
        final stateLoad = (detailBloc.state as DetailStateLoaded);
        return Scaffold(
          backgroundColor: stateLoad.pokemon.color,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  // BACKGROUND
                  BackgroundDetailWidget(),

                  // APP BAR
                  AppBarDetailWidget(),

                  // DETAIL
                  ContentDetailWidget(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
