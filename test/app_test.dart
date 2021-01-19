
import 'package:coran/Screens/Parametres/Parametres.dart';
import 'package:flutter_test/flutter_test.dart';

void main(List<String> args) {
  testWidgets('teser main', (WidgetTester tester)async{
    tester.pumpWidget(new Parametres());
  });
}