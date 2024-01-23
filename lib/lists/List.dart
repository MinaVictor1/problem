import '../3dmodel.dart';

String astronaut = "assets/3d/listen.glb";
String untitled = "assets/3d/listening.glb";
String dance = "assets/3d/ImageToStl.com_talking.glb";

List<Model> models = [
  Model(
    models: [
      dance,
      astronaut,
      untitled,
    ],
    action: 'Death',
    backGround: 'assets/background1.jpg',
  ),
  Model(
    models: [
      astronaut,
      dance,
      untitled,
    ],
    action: 'Death',
    backGround: 'assets/background2.jpg',
  ),
  Model(
    models: [
      untitled,
      dance,
      astronaut,
    ],
    action: 'Death',
    backGround: 'assets/background1.jpg',
  ),
];
