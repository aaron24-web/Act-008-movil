import 'package:bloc/bloc.dart';
import 'package:pokecard_dex/pokemon_cards/cubit/card_details_state.dart';
import 'package:pokecard_dex/pokemon_cards/data/repositories/pokemon_card_details_repository_impl.dart';

class CardDetailsCubit extends Cubit<CardDetailsState> {
  CardDetailsCubit(this._pokemonCardDetailsRepositoryImpl)
    : super(CardDetailsInitial());

  final PokemonCardDetailsRepositoryImpl _pokemonCardDetailsRepositoryImpl;

  Future<void> fetchCardDetails(String id) async {
    try {
      emit(CardDetailsLoading());
      final cardDetails = await _pokemonCardDetailsRepositoryImpl
          .getPokemonCardDetails(id);
      emit(CardDetailsLoaded(cardDetails));
    } on Exception catch (e) {
      emit(CardDetailsError(e.toString()));
    }
  }
}
