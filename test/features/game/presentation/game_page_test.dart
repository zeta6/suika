import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:suika/features/game/presentation/game_page.dart';

void main() {
  testWidgets('GamePage Widget Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: GamePage(),
      ),
    );

    // Verify that GamePage widget is displayed.
    expect(find.byType(GamePage), findsOneWidget);
  });
}
