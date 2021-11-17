import 'package:flutter/material.dart';
import 'package:midterm_one/data/models/car_model.dart';
import 'package:midterm_one/data/repository/car_helper.dart';

class AddCarPage extends StatelessWidget {
  AddCarPage({Key? key}) : super(key: key);

  static const routeName = '/add-car-screen';

  final _formkey = GlobalKey<FormState>();

  TextEditingController carId = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController imageUrl = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Car'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Card(
                  child: TextFormField(
                    controller: carId,
                    decoration: const InputDecoration(hintText: "Enter car ID"),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter valid ID";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: brand,
                    decoration:
                        const InputDecoration(hintText: "Enter car brand"),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter valid text";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: model,
                    decoration:
                        const InputDecoration(hintText: "Enter car model"),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter valid model";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: imageUrl,
                    decoration:
                        const InputDecoration(hintText: "Enter car image URL"),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter valid URL";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: year,
                    decoration:
                        const InputDecoration(hintText: "Enter car year"),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter valid year";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: description,
                    decoration: const InputDecoration(
                        hintText: "Enter car description"),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter valid description";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            Car car = Car(
                              id: int.parse(carId.text),
                              brand: brand.text,
                              model: model.text,
                              imageUrl: imageUrl.text,
                              year: int.parse(year.text),
                              description: description.text,
                            );
                            CarRepository().addCar(car);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('done')),
                            );
                            Navigator.pop(context);
                          }
                        },
                        child: const Text("submit"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('back'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
