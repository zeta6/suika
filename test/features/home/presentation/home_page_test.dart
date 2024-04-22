import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:suika/core/utils/routes.dart';
import 'package:suika/features/home/presentation/home_page.dart';
import 'package:suika/features/game/presentation/game_page.dart';

void main() {
  testWidgets(
      'HomePage should contain ElevatedButton and navigate to GamePage on press',
      (WidgetTester tester) async {
    // Mock the Navigator
    MockNavigatorObserver mockNavigatorObserver = MockNavigatorObserver();

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: const HomePage(),
        navigatorObservers: [mockNavigatorObserver],
        routes: Routes.main,
      ),
    );

    // Verify that HomePage contains ElevatedButton with 'Game Start' text.
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('Game Start'), findsOneWidget);

    // Tap the 'Game Start' button and trigger a frame.
    await tester.tap(find.text('Game Start'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 2));

    // TODO Create a didPush test
    // Verify that GamePage was pushed.
    // verify(
    // verify(mockNavigatorObserver.didPush(any, any));
    expect(find.byType(GamePage), findsOneWidget);
  });
}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}
