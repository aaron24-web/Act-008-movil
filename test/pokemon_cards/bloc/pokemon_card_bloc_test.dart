
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokecard_dex/pokemon_cards/bloc/pokemon_card_bloc.dart';
import 'package:pokecard_dex/pokemon_cards/domain/entities/pokemon_card.dart';
import 'package:pokecard_dex/pokemon_cards/domain/repositories/pokemon_card_repository.dart';

class MockPokemonCardRepository extends Mock implements PokemonCardRepository {}

class MockPokemonCard extends Mock implements PokemonCard {}

void main() {
  group('PokemonCardBloc', () {
    late PokemonCardRepository pokemonCardRepository;
    late PokemonCardBloc pokemonCardBloc;

    setUp(() {
      pokemonCardRepository = MockPokemonCardRepository();
      pokemonCardBloc = PokemonCardBloc(pokemonCardRepository: pokemonCardRepository);
    });

    test('initial state is correct', () {
      expect(pokemonCardBloc.state, const PokemonCardState());
    });

    group('CardsFetched', () {
      final mockCards = List.generate(
        3,
        (i) => PokemonCard(
          id: 'id_$i',
          name: 'name_$i',
          imageUrl: 'imageUrl_$i',
        ),
      );

      blocTest<PokemonCardBloc, PokemonCardState>(
        'emits [success] when getCards succeeds',
        build: () {
          when(() => pokemonCardRepository.getCards(page: 1, pageSize: 20))
              .thenAnswer((_) async => mockCards);
          return pokemonCardBloc;
        },
        act: (bloc) => bloc.add(CardsFetched()),
        expect: () => [
          PokemonCardState(
            status: PokemonCardStatus.success,
            cards: mockCards,
            hasReachedMax: false,
          ),
        ],
        verify: (_) {
          verify(() => pokemonCardRepository.getCards(page: 1, pageSize: 20)).called(1);
        },
      );

      blocTest<PokemonCardBloc, PokemonCardState>(
        'emits [failure] when getCards fails',
        build: () {
          when(() => pokemonCardRepository.getCards(page: 1, pageSize: 20))
              .thenThrow(Exception('oops'));
          return pokemonCardBloc;
        },
        act: (bloc) => bloc.add(CardsFetched()),
        expect: () => [
          const PokemonCardState(status: PokemonCardStatus.failure),
        ],
        verify: (_) {
          verify(() => pokemonCardRepository.getCards(page: 1, pageSize: 20)).called(1);
        },
      );
    });
  });
}
