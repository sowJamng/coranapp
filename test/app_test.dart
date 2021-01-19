

import 'package:flutter_test/flutter_test.dart';
import 'package:coran/Model/ReadPdf/Readpdf.dart';
void main(List<String> args) {
  testWidgets('teser main', (WidgetTester tester)async{
    tester.pumpWidget(new ReadChapitre(title:'',chap: 'assets/invocations/Debutdelacreation.pdf'));
  });
}