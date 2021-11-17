// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:midterm_one/data/dummy_data.dart';
import 'package:midterm_one/data/models/car_model.dart';
import 'package:midterm_one/data/repository/car_helper.dart';
import 'package:midterm_one/presentation/screens/screens.dart';
import 'package:midterm_one/presentation/widgets/list_item.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Car> CarList = DUMMY_DATA;

  get direction => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cars App"),
        centerTitle: true,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AddCarPage.routeName)
                      .then((_) => setState(() {}));
                },
                child: const Icon(
                  Icons.add,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          final currentCar = CarList[index];
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: const Padding(
                padding: EdgeInsets.only(right: 30),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
            child: GestureDetector(
              onLongPress: () => Navigator.pushNamed(
                      context, editCarPage.routeName,
                      arguments: {"car": currentCar, 'index': index})
                  .then((_) => setState(() {})),
              onTap: () => Navigator.pushNamed(
                  context, DetailedCarPage.routeName,
                  arguments: {"car": currentCar}),
              child: ListItem(
                imageUrl: currentCar.imageUrl,
                brand: currentCar.brand,
                year: currentCar.year,
              ),
            ),
            confirmDismiss: (direction) => showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text("Are you sure?"),
                content: const Text("Do you really want "),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("no")),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          CarRepository().removeCar(currentCar.id);
                          Navigator.pop(context);
                        });
                      },
                      child: const Text("Yes"))
                ],
              ),
            ),
          );
        },
        itemCount: CarList.length,
      ),
    );
  }
}
