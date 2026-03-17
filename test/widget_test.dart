// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:app_1_widgets/main.dart';

void main() {
  testWidgets('App loads and shows fundamentals content', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MiAppFlutter());

    // Verify that the app shows the main title.
    expect(find.text('Fundamentos Flutter'), findsOneWidget);

    // Verify that the Submit button (composition example) is present.
    expect(find.text('Submit'), findsOneWidget);
  });
}
