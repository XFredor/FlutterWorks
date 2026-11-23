import 'package:flutter_test/flutter_test.dart';

import 'package:homework5/main.dart';

void main() {
  testWidgets('Feed shows Instagram posts', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Instagram'), findsOneWidget);
    expect(find.text('azamat_travel'), findsOneWidget);
    expect(find.text('Бишкек, Кыргызстан'), findsOneWidget);
    expect(find.text('Нравится: 1 254'), findsOneWidget);
    expect(find.byType(PostCard), findsWidgets);
  });
}
