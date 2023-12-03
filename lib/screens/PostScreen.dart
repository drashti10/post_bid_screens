import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class PostScreen extends StatefulWidget {
  static const routeName = '/post';

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late CameraController _cameraController;
  late List<CameraDescription> cameras;
  late String imagePath;

  TextEditingController captionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      _cameraController = CameraController(cameras[0], ResolutionPreset.medium);
      await _cameraController.initialize();
      if (mounted) {
        // Ensure the widget is still mounted before calling setState
        setState(() {});
      }
    } else {
      print('No cameras available');
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController == null || !_cameraController.value.isInitialized) {
      return Scaffold(
        
           
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      
      appBar: AppBar(


        title: Text('What is your issue'),
      ),
     
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: _cameraPreviewWidget(),
            ),
            SizedBox(height: 16),
            TextField(
              controller: captionController,
              decoration: InputDecoration(
                hintText: 'Add a caption...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _takePicture();
              },
              child: Text('Take Picture'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _postImage();
              },
              child: Text('Post'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cameraPreviewWidget() {
    return AspectRatio(
      aspectRatio: _cameraController.value.aspectRatio,
      child: CameraPreview(_cameraController),
    );
  }

  Future<void> _takePicture() async {
    try {
      final XFile picture = await _cameraController.takePicture();
      imagePath = picture.path;
      if (mounted) {
      
        setState(() {});
      }
    } catch (e) {
      print('Error taking picture: $e');
    }
  }

  void _postImage() {

    String caption = captionController.text;
    print('Caption: $caption');
    if (imagePath != null && File(imagePath).existsSync()) {
      print('Image Path: $imagePath');

    } else {
      print('No picture taken.');
    }
  }
}
