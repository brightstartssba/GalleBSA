import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ios_gallery_app/main.dart';

void main() {
  testWidgets('Gallery app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the Photos title is displayed
    expect(find.text('Photos'), findsOneWidget);
    
    // Verify that the main screen elements are present
    expect(find.text('Photos Access Required'), findsOneWidget);
  });
}