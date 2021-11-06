import 'package:flutter/material.dart';
import 'package:practica5/src/screen/RandM_screen.dart';
import 'package:practica5/src/screen/moreinformation_screen.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/moredetail'           : (BuildContext context) => MoreInformationScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: RickAndMorty(),
    );
  }
}
