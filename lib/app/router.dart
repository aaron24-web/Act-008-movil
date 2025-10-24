import 'package:go_router/go_router.dart';
import 'package:pokecard_dex/pokemon_cards/view/card_details_page.dart';
import 'package:pokecard_dex/pokemon_cards/view/cards_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const CardsPage(),
    ),
    GoRoute(
      path: '/card/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return CardDetailsPage(id: id);
      },
    ),
  ],
);
