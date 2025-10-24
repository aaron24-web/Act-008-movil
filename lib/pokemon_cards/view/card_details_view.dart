import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokecard_dex/pokemon_cards/cubit/card_details_cubit.dart';
import 'package:pokecard_dex/pokemon_cards/cubit/card_details_state.dart';

class CardDetailsView extends StatelessWidget {
  const CardDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Details'),
      ),
      body: BlocBuilder<CardDetailsCubit, CardDetailsState>(
        builder: (context, state) {
          if (state is CardDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CardDetailsError) {
            return Center(child: Text(state.message));
          }
          if (state is CardDetailsLoaded) {
            final card = state.cardDetails;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: card.imageUrl != null
                          ? Image.network(
                              card.imageUrl!,
                              height: 300,
                              fit: BoxFit.contain,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const SizedBox(
                                  height: 300,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.error, size: 100),
                            )
                          : const SizedBox(
                              height: 300,
                              child: Center(child: Text('No Image')),
                            ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      card.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (card.supertype != null)
                      Text('Supertype: ${card.supertype}'),
                    if (card.hp != null) Text('HP: ${card.hp}'),
                    if (card.subtypes != null && card.subtypes!.isNotEmpty)
                      Text(
                        'Subtypes: ${card.subtypes!.join(', ')}',
                      ),
                    if (card.level != null) Text('Level: ${card.level}'),
                    if (card.artist != null) Text('Artist: ${card.artist}'),
                    if (card.rarity != null) Text('Rarity: ${card.rarity}'),
                    if (card.flavorText != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          card.flavorText!,
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    // You can add more details here as needed
                  ],
                ),
              ),
            );
          }
          return const Center(child: Text('Select a card to see details'));
        },
      ),
    );
  }
}
