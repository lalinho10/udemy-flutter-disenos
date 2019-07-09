import 'package:flutter/material.dart';

import 'package:disenos/src/pages/basic_page.dart';
import 'package:disenos/src/pages/complex_page.dart';
import 'package:disenos/src/pages/scroll_page.dart';

void main() => runApp( MyApp() );

class MyApp extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños',
      initialRoute: 'complex',
      routes: {
        'basic'   : ( BuildContext context ) => BasicPage(),
        'complex' : ( BuildContext context ) => ComplexPage(),
        'scroll'  : ( BuildContext context ) => ScrollPage()
      }
    );
  }
}