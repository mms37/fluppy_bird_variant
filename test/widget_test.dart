// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:untitled20/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// Uygulamanızın ana dosyasının yolunu buraya ekleyin.

void main() {
  testWidgets('Game start and bird jumps', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(FlappyBirdGame()); // Uygulamanızın ana widget'ını buraya geçin.

    // Verify that the "TAP TO START" text is displayed.
    expect(find.text('TAP TO START'), findsOneWidget);

    // Tap on the screen to start the game.
    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    // Verify that the "TAP TO START" text disappears and "TAP TO JUMP" text is displayed.
    expect(find.text('TAP TO START'), findsNothing);
    expect(find.text('TAP TO JUMP'), findsOneWidget);

    // Tap on the screen to make the bird jump.
    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    // Here, you can add more tests to check the behavior of your game.
    // For example, you can test if the bird's position changes after jumping,
    // if the game ends correctly when the bird hits an obstacle, etc.
    // These tests will depend on the specific implementation of your game.

    // Uncomment the lines below to see the widget tree printed in the console.
    // This can be useful for debugging and understanding the widget hierarchy.
    // final finder = find.byType(FlappyBirdGame);
    // final widget = tester.widget(finder);
    // print(widget);

  });
}
