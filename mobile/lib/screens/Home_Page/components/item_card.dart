import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    this.color = Colors.grey,
    this.borderRadius = 30.32,
    this.paddingValue = 2.0,
    this.heightMultiplier = 0.13032,
    this.widthMultiplier = 0.28295,
    required this.routePage,
    required this.image,
    required this.widget,
    this.margin = const EdgeInsets.all(10),
  }) : super(key: key);
  final Color? color;
  final double? borderRadius;
  final double? paddingValue;
  final double? heightMultiplier;
  final double? widthMultiplier;
  final Widget routePage;
  final Image image;
  final Widget widget;
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        child: Container(
          margin: margin,
          padding: EdgeInsets.all(paddingValue!),
          height: size.height * heightMultiplier!,
          width: size.width * widthMultiplier!,
          decoration: BoxDecoration(
            color: color!,
            border: Border.all(style: BorderStyle.none),
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              image,
              const SizedBox(
                height: 10,
              ),
              widget,
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