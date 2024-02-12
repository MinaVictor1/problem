import '../3dmodel.dart';

String astronaut = "assets/3d/listen.glb";
String untitled = "assets/3d/listening.glb";
String talk = "assets/3d/woman.glb";

List<Model> models = [
  Model(
    models: [talk, talk],
    xyz: [
      [-60, 70, 200],
      [60, 70, 200],
    ],
    action: 'Armature|Take 001|BaseLayer',
    backGround: 'assets/background1.jpg',
  ),
  Model(
    models: [talk, talk],
    xyz: [
      [-60, 70, 200],
      [60, 70, 200],
    ],
    action: 'Armature|Take 001|BaseLayer',
    backGround: 'assets/background1.jpg',
  ),
  Model(
    models: [talk, talk],
    xyz: [
      [-60, 70, 200],
      [60, 70, 200],
    ],
    action: 'Armature|Take 001|BaseLayer',
    backGround: 'assets/background1.jpg',
  ),
];
