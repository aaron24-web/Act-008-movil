// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_card_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonCardDetailsModel _$PokemonCardDetailsModelFromJson(
  Map<String, dynamic> json,
) => PokemonCardDetailsModel(
  id: json['id'] as String,
  name: json['name'] as String,
  imageUrl: _imageUrlFromJson(json['image_url'] as Map<String, dynamic>?),
  hp: json['hp'] as String?,
  supertype: json['supertype'] as String?,
  subtypes: (json['subtypes'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  level: json['level'] as String?,
  abilities: json['abilities'] as List<dynamic>?,
  attacks: json['attacks'] as List<dynamic>?,
  weaknesses: json['weaknesses'] as List<dynamic>?,
  resistances: json['resistances'] as List<dynamic>?,
  retreatCost: (json['retreat_cost'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  convertedRetreatCost: (json['converted_retreat_cost'] as num?)?.toInt(),
  set: json['set'],
  number: json['number'] as String?,
  artist: json['artist'] as String?,
  rarity: json['rarity'] as String?,
  flavorText: json['flavor_text'] as String?,
  nationalPokedexNumbers: (json['national_pokedex_numbers'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  legalities: json['legalities'],
  images: json['images'],
  tcgplayer: json['tcgplayer'],
  cardmarket: json['cardmarket'],
);

Map<String, dynamic> _$PokemonCardDetailsModelToJson(
  PokemonCardDetailsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image_url': instance.imageUrl,
  'hp': instance.hp,
  'supertype': instance.supertype,
  'subtypes': instance.subtypes,
  'level': instance.level,
  'abilities': instance.abilities,
  'attacks': instance.attacks,
  'weaknesses': instance.weaknesses,
  'resistances': instance.resistances,
  'retreat_cost': instance.retreatCost,
  'converted_retreat_cost': instance.convertedRetreatCost,
  'set': instance.set,
  'number': instance.number,
  'artist': instance.artist,
  'rarity': instance.rarity,
  'flavor_text': instance.flavorText,
  'national_pokedex_numbers': instance.nationalPokedexNumbers,
  'legalities': instance.legalities,
  'images': instance.images,
  'tcgplayer': instance.tcgplayer,
  'cardmarket': instance.cardmarket,
};
