import 'dart:math';

import 'package:flutter/material.dart';

class AnimatePropertiesContainer extends StatefulWidget {
  const AnimatePropertiesContainer({Key? key}) : super(key: key);

  @override
  State<AnimatePropertiesContainer> createState() =>
      _AnimatePropertiesContainerState();
}

class _AnimatePropertiesContainerState
    extends State<AnimatePropertiesContainer> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadiusGeometry = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("AnimatedContainer Demo"),
        ),
        body: Center(
          child: AnimatedContainer(
            width: _width,
            height: _height,
            decoration:
                BoxDecoration(color: _color, borderRadius: _borderRadiusGeometry),
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              final random = Random();

              _width = random.nextInt(300).toDouble();
              _height = random.nextInt(300).toDouble();

              _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
              _borderRadiusGeometry = BorderRadius.circular(random.nextInt(100).toDouble());

            });
          },
          child: const Icon(Icons.play_arrow),
        ),
      );
  }
}
