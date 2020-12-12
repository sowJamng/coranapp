import 'package:flutter/material.dart';
import 'Screens/Home.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    locale:  Locale("ar"),
    debugShowCheckedModeBanner:false,
    title: 'Coran',
    theme:  new ThemeData(
    primaryColor: new Color(0xff075E54),
    accentColor: new Color(0xff250366),
    ),
    home: Home(),
   
    );
  }
}