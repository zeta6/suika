import 'package:suika/features/game/presentation/game_page.dart';
import 'package:suika/features/home/presentation/home_page.dart';

class Routes {
  Routes._();
  static get main {
    return {
      '/home': (context) => const HomePage(),
      '/game': (context) => const GamePage(),
    };
  }
}
