import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class AnimateWidgetByPhysics extends StatelessWidget {
  const AnimateWidgetByPhysics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AnimateWidgetByPhysics"),),
      body: DraggableCard(
        child: FlutterLogo(size: 128,),
      ),
    );
  }
}

class DraggableCard extends StatefulWidget {
  final Widget child;
  const DraggableCard({Key? key, required this.child}) : super(key: key);

  @override
  State<DraggableCard> createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<Alignment> _animation;
  Alignment _dragAligment = Alignment.center;

  void _runAnimation(Offset pixelPerSecond,Size size){
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAligment,
        end: Alignment.center
      )
    );
    final unitPerSecondX = pixelPerSecond.dx / size.width;
    final unitPerSecondY = pixelPerSecond.dy / size.height;
    final unitPerSecond = Offset(unitPerSecondX, unitPerSecondY);
    final unitVelocity = unitPerSecond.distance;

    const spring = SpringDescription(mass: 30, stiffness: 1, damping: 1);
    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);
    _controller.animateWith(simulation);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: const Duration(seconds: 1));
    _controller.addListener(() {
      setState(() {
        _dragAligment = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onPanDown: (detail){
        _controller.stop();
      },
      onPanUpdate: (detail){
        setState(() {
          _dragAligment += Alignment(
          detail.delta.dx / (size.width / 2),
          detail.delta.dy / (size.height / 2));
        });
      },
      onPanEnd: (detail){
        _runAnimation(detail.velocity.pixelsPerSecond,size);
      },
      child: Align(
        alignment: _dragAligment,
        child: Card(
          child: widget.child,
        ),
      ),
    );
  }
}

