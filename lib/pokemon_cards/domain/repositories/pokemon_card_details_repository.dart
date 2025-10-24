import 'package:pokecard_dex/pokemon_cards/domain/entities/pokemon_card_details.dart';

abstract class PokemonCardDetailsRepository {
  Future<PokemonCardDetails> getPokemonCardDetails(String id);
}
