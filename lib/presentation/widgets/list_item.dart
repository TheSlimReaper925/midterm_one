import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem(
      {Key? key,
      required this.imageUrl,
      required this.brand,
      required this.year})
      : super(key: key);

  final String imageUrl;
  final String brand;
  final int year;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          FadeInImage(
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
            image: NetworkImage(imageUrl),
            placeholder: const AssetImage("assets/images/car_placeholder.png"),
          ),
          Text(brand),
          Text(year.toString()),
        ],
      ),
    ));
  }
}
