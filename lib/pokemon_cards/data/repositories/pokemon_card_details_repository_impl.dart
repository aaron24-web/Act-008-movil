import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokecard_dex/pokemon_cards/data/models/pokemon_card_details_model.dart';
import 'package:pokecard_dex/pokemon_cards/domain/entities/pokemon_card_details.dart';
import 'package:pokecard_dex/pokemon_cards/domain/repositories/pokemon_card_details_repository.dart';

class PokemonCardDetailsRepositoryImpl implements PokemonCardDetailsRepository {
  PokemonCardDetailsRepositoryImpl({http.Client? httpClient})
    : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  @override
  Future<PokemonCardDetails> getPokemonCardDetails(String id) async {
    final uri = Uri.parse('https://api.pokemontcg.io/v2/cards/$id');
    final response = await _httpClient.get(uri);

    if (response.statusCode == 200) {
      final body = json.decode(response.body) as Map<String, dynamic>;
      final data = body['data'] as Map<String, dynamic>;
      return PokemonCardDetailsModel.fromJson(data).toEntity();
    } else {
      throw Exception('Failed to load card details');
    }
  }
}
