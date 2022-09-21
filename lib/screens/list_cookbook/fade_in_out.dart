import 'package:flutter/material.dart';

class FadeInAndOut extends StatefulWidget {
  const FadeInAndOut({Key? key}) : super(key: key);

  @override
  State<FadeInAndOut> createState() => _FadeInAndOutState();
}

class _FadeInAndOutState extends State<FadeInAndOut> {
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fade In Out"),),
      body: Center(
        child: AnimatedOpacity(
          opacity: _isVisible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _isVisible = !_isVisible;
          });
        },
        tooltip: "Toggle Opacity",
        child: Icon(Icons.flip),
      ),
    );
  }
}
