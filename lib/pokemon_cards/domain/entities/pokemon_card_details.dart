class PokemonCardDetails {
  PokemonCardDetails({
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
}
