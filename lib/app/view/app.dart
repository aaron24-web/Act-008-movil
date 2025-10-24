import 'package:flutter/material.dart';
import 'package:pokecard_dex/l10n/l10n.dart';
// Importa la página que creamos
import 'package:pokecard_dex/pokemon_cards/view/cards_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // Aquí está el cambio: reemplaza la página de contador por defecto
      // con la nueva página de la lista de cartas.
      home: const CardsPage(),
    );
  }
}
