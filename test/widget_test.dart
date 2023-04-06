// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:social_doge/infrastructure/social_doge_api/core.dart';

void main() {
  testWidgets('getFollowers', (WidgetTester tester) async {
    final session = SocialDogeAPI();
    final users = await session.getFollowers(userId: "900282258736545792");
    expect(users.isEmpty, false);
  });
}
