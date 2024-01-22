import 'package:duration_button/duration_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:threemodel/lists/List.dart';
import 'package:threemodel/lists/listcontroller.dart';

class Scene3D extends StatefulWidget {
  const Scene3D({Key? key, required this.models}) : super(key: key);

  final List<String> models;

  @override
  State<Scene3D> createState() => _Scene3DState();
}

class _Scene3DState extends State<Scene3D> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/images.jpeg'), fit: BoxFit.cover),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.models.length,
        itemBuilder: (context, index) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Flutter3DViewer(
                    controller: widget.models[index] == astronaut
                        ? astController
                        : widget.models[index] == dance
                            ? danController
                            : unController,
                    src: widget.models[index],
                  ),
                ),
                DurationButton(
                    onPressed: () {},
                    onComplete: () {
                      danController.setCameraOrbit(-60, 70, 200);
                      unController.setCameraOrbit(60, 70, 200);
                      astController.setCameraOrbit(60, 70, 200);
                      unController.playAnimation(
                          animationName: 'Armature|mixamo.com|Layer0');
                      danController.playAnimation();
                      astController.playAnimation();

                      //controller.setCameraOrbit(-80, 70, 200);
                    },
                    duration: const Duration(seconds: 2),
                    child: const Text('')),
              ],
            ),
          );
        },
      ),
    );
  }
}
