import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    this.color = Colors.grey,
    this.borderRadius = 15.0,
    this.paddingValue = 15.0,
    this.heightMultiplier = 0.30,
    this.widthMultiplier = 0.50,
    required this.routePage,
    required this.image,
    required this.text,
  }) : super(key: key);
  final Color? color;
  final double? borderRadius;
  final double? paddingValue;
  final double? heightMultiplier;
  final double? widthMultiplier;
  final Widget routePage;
  final Image image;
  final Text text;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        child: Container(
          padding: EdgeInsets.all(paddingValue!),
          height: size.height * heightMultiplier!,
          width: size.width * widthMultiplier!,
          decoration: BoxDecoration(
            color: color!,
            border: Border.all(style: BorderStyle.none),
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
          child: Column(
            children: [
              image,
              SizedBox(
                height: 10,
              ),
              text,
            ],
          ),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return routePage;
          }));
        });
  }
}

//TODO: design an item card for homepage that will direct to user to relevant page
//itemcard will return a gestureDetector