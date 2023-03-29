import 'package:bloc_architecture/main.dart' as app;
import 'package:bloc_architecture/src/module/products/view/product_details/product_details.dart';
import 'package:bloc_architecture/src/module/products/view/product_list/product_list.dart';
import 'package:bloc_architecture/src/util/service/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('app - ', () {
    testWidgets('start app and load products', (WidgetTester tester) async {
      await app.main();
      await tester.pumpAndSettle();
      expect(find.byType(ProductList), findsOneWidget);
      locator.reset();
    });

    testWidgets('app - end to end', (WidgetTester tester) async {
      await app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(GestureDetector).at(0));
      await tester.pumpAndSettle();
      expect(find.byType(ProductDetails), findsOneWidget);
    });
  });


}
