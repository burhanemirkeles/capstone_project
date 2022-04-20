import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        child: Container(
      height: size.height * 0.30,
      width: size.width * 0.5,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(15),
      ),
    ));
  }
}

//TODO: design an item card for homepage that will direct to user to relevant page
//itemcard will return a gestureDetector