
import 'package:json_annotation/json_annotation.dart';
import 'package:pokecard_dex/pokemon_cards/domain/entities/pokemon_card_details.dart';

part 'pokemon_card_details_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonCardDetailsModel {
  PokemonCardDetailsModel({
    required this.id,
    required this.name,
    this.imageUrl,
    this.hp,
    this.supertype,
    this.subtypes,
    this.level,
    this.abilities,
    this.attacks,
    this.weaknesses,
    this.resistances,
    this.retreatCost,
    this.convertedRetreatCost,
    this.set,
    this.number,
    this.artist,
    this.rarity,
    this.flavorText,
    this.nationalPokedexNumbers,
    this.legalities,
    this.images,
    this.tcgplayer,
    this.cardmarket,
  });

  final String id;
  final String name;
  @JsonKey(fromJson: _imageUrlFromJson)
  final String? imageUrl;
  final String? hp;
  final String? supertype;
  final List<String>? subtypes;
  final String? level;
  final List<dynamic>? abilities;
  final List<dynamic>? attacks;
  final List<dynamic>? weaknesses;
  final List<dynamic>? resistances;
  final List<String>? retreatCost;
  final int? convertedRetreatCost;
  final dynamic set;
  final String? number;
  final String? artist;
  final String? rarity;
  final String? flavorText;
  final List<int>? nationalPokedexNumbers;
  final dynamic legalities;
  final dynamic images;
  final dynamic tcgplayer;
  final dynamic cardmarket;

  factory PokemonCardDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonCardDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonCardDetailsModelToJson(this);

  PokemonCardDetails toEntity() => PokemonCardDetails(
        id: id,
        name: name,
        imageUrl: imageUrl,
        hp: hp,
        supertype: supertype,
        subtypes: subtypes,
        level: level,
        abilities: abilities,
        attacks: attacks,
        weaknesses: weaknesses,
        resistances: resistances,
        retreatCost: retreatCost,
        convertedRetreatCost: convertedRetreatCost,
        set: set,
        number: number,
        artist: artist,
        rarity: rarity,
        flavorText: flavorText,
        nationalPokedexNumbers: nationalPokedexNumbers,
        legalities: legalities,
        images: images,
        tcgplayer: tcgplayer,
        cardmarket: cardmarket,
      );
}

String? _imageUrlFromJson(Map<String, dynamic>? json) {
  return json?['large'] as String?;
}
