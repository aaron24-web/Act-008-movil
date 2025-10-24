import 'package:equatable/equatable.dart';
import 'package:pokecard_dex/pokemon_cards/domain/entities/pokemon_card_details.dart';

abstract class CardDetailsState extends Equatable {
  const CardDetailsState();

  @override
  List<Object> get props => [];
}

class CardDetailsInitial extends CardDetailsState {}

class CardDetailsLoading extends CardDetailsState {}

class CardDetailsLoaded extends CardDetailsState {
  const CardDetailsLoaded(this.cardDetails);

  final PokemonCardDetails cardDetails;

  @override
  List<Object> get props => [cardDetails];
}

class CardDetailsError extends CardDetailsState {
  const CardDetailsError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
