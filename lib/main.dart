
import 'package:flutter/material.dart';
import "currency_converter_material.dart";
// import "package:flutter/cupertino.dart";
void main() {
  runApp( const App());
}





class App extends StatelessWidget {

  const App({super.key});

  @override
  Widget build (BuildContext context) {

    return MaterialApp(
      home: CurrencyConverterMaterialPage()
    );
  }

}
