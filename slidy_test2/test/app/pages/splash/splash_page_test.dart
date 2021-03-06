import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:slidy_test2/app/pages/splash/splash_page.dart';

void main() {
  testWidgets('SplashPage has title', (tester) async {
    await tester.pumpWidget(buildTestableWidget(
      SplashPage(shouldDelay: false),
    ));
    final titleFinder = find.text('Splash');
    expect(titleFinder, findsOneWidget);
  });
}
