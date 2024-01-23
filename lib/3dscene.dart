import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';
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
                  child: O3D(
                    animationName: 'Armature|mixamo.com|Layer0',
                    autoPlay: true,
                    disableZoom: false,
                    autoRotate: false,
                    cameraOrbit: CameraOrbit(60, 70, 200),
                    animationCrossfadeDuration: 4,
                    cameraControls: false,
                    controller: widget.models[index] == astronaut
                        ? astController
                        : widget.models[index] == dance
                            ? danController
                            : unController,
                    src: widget.models[index],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
/*
O3D(
                controller: controller,
                src: 'assets/glb/materials_variants_shoe.glb',
                // variantName: 'street',
              ),
 */