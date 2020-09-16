import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:slidy_test2/app/modules/home/home_module.dart';
import 'package:slidy_test2/app/modules/home/home_page.dart';

void main() {
  initModule(HomeModule());
  testWidgets('HomePage has title', (tester) async {
    await tester.pumpWidget(buildTestableWidget(HomePage(title: 'Home')));
    final titleFinder = find.text('Home');
    expect(titleFinder, findsOneWidget);
  });
}
