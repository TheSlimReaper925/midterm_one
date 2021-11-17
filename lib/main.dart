import 'package:flutter/material.dart';
import 'package:midterm_one/presentation/screens/add_car_screen.dart';
import 'package:midterm_one/presentation/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cars App',
      routes: {
        AddCarPage.routeName: (context) => AddCarPage(),
        editCarPage.routeName: (context) => editCarPage(),
        DetailedCarPage.routeName: (context) => DetailedCarPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
