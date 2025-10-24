import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokecard_dex/pokemon_cards/cubit/card_details_cubit.dart';
import 'package:pokecard_dex/pokemon_cards/data/repositories/pokemon_card_details_repository_impl.dart';
import 'package:pokecard_dex/pokemon_cards/view/card_details_view.dart';

class CardDetailsPage extends StatelessWidget {
  const CardDetailsPage({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CardDetailsCubit(PokemonCardDetailsRepositoryImpl())
        // The cubit's fetchCardDetails method is intentionally not awaited
        // as it's a fire-and-forget operation to initiate data loading.
        // ignore: discarded_futures
        ..fetchCardDetails(id),
      child: const CardDetailsView(),
    );
  }
}
