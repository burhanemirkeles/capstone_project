// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:capstone_project/components/assets.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Container(
        color: const Color.fromRGBO(207, 227, 252, 1),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            _mainTopPositionedImage(size),
            _mainBottomPositionedImage(size),
            child,
          ],
        ),
      ),
    );
  }
}

Positioned _mainTopPositionedImage(Size size) {
  String _imageAsset = ImageAssets().mainTop;
  return Positioned(
    top: 0,
    left: 0,
    width: size.width * 0.2,
    child: Image.asset(_imageAsset),
  );
}

Positioned _mainBottomPositionedImage(Size size) {
  String _imageAsset = ImageAssets().mainBottom;
  return Positioned(
    child: Image.asset(_imageAsset),
    bottom: 0,
    left: 0,
    width: size.width * 0.2,
  );
}
