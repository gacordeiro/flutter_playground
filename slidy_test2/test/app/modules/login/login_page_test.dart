import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:slidy_test2/app/modules/login/login_module.dart';
import 'package:slidy_test2/app/modules/login/login_page.dart';

void main() {
  initModule(LoginModule());
  testWidgets('LoginPage has title', (tester) async {
    await tester.pumpWidget(buildTestableWidget(LoginPage(title: 'Login')));
    final titleFinder = find.text('Login');
    expect(titleFinder, findsOneWidget);
  });
}
