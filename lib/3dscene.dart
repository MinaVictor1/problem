import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class Scene3D extends StatefulWidget {
  Scene3D({super.key, required this.controller, required this.model3d});

  Flutter3DController controller;
  String model3d;
  @override
  State<Scene3D> createState() => _Scene3DState();
}

class _Scene3DState extends State<Scene3D> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Flutter3DViewer(
        controller: widget.controller,

        src: widget.model3d,
        //src: 'assets/sheen_chair.glb',
      ),
    );
  }
}
