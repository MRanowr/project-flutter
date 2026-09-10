import 'package:flutter_test/flutter_test.dart';
import 'package:mens_store/main.dart';

void main() {
  testWidgets('App load test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
  });
}