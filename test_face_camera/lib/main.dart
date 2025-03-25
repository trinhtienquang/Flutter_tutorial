import 'dart:io';
import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FaceCamera.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FaceCaptureScreen(),
    );
  }
}

class FaceCaptureScreen extends StatefulWidget {
  const FaceCaptureScreen({super.key});
  @override
  State<FaceCaptureScreen> createState() => _FaceCaptureScreenState();
}

class _FaceCaptureScreenState extends State<FaceCaptureScreen> {
  late FaceCameraController controller;

  @override
  void initState() {
    super.initState();
    controller = FaceCameraController(
      autoCapture: true,
      defaultCameraLens: CameraLens.front,
      onFaceDetected: (face) => print('Phát hiện khuôn mặt'),
      onCapture: (File? image) async {
        if (image != null) {
          print('Đường dẫn ảnh: ${image.path}');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
        SmartFaceCamera(
          controller: controller,
          message: 'Center your face in the square',
        ),
        ]
      ),
    );
  }
}
