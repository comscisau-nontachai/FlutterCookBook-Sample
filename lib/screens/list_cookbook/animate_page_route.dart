import 'package:flutter/material.dart';

class AnimatePageRoute extends StatelessWidget {
  const AnimatePageRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatePageRoute Transition."),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          },
          child: Text("Go!!"),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => const AnimatePageRoute2(),
  transitionsBuilder: (context,animation,secondaryAnimation, child){
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    var curve = Curves.ease;
    final tween = Tween(begin: begin,end: end).chain(CurveTween(curve: curve));
    final offsetAnim = animation.drive(tween);
    
    return SlideTransition(position: animation.drive(tween),child: child,);
  });
}


class AnimatePageRoute2 extends StatelessWidget {
  const AnimatePageRoute2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Page 2'),
      ),
    );
  }
}
