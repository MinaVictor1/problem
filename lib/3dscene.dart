import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:o3d/o3d.dart';

class Scene3D extends StatefulWidget {
  const Scene3D({Key? key, required this.models, required this.xyz})
      : super(key: key);

  final List<String> models;
  final List<List<int>> xyz;

  @override
  State<Scene3D> createState() => _Scene3DState();
}

class _Scene3DState extends State<Scene3D> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/background.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized
        _controller.play();
        _controller.setLooping(true);

        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.6,
      child: Stack(
        children: [
          // Video background
          _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(), // You can customize the loading indicator here

          // Your 3D models
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.models.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: O3D(
                          animationName: 'Armature|Take 001|BaseLayer',
                          autoPlay: true,
                          disableZoom: false,
                          autoRotate: false,
                          cameraOrbit: CameraOrbit(
                            widget.xyz[index][0].toDouble(),
                            widget.xyz[index][1].toDouble(),
                            widget.xyz[index][2].toDouble(),
                          ),
                          animationCrossfadeDuration: 4,
                          cameraControls: false,
                          src: widget.models[index],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
