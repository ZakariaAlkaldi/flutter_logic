import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class UploadVideo extends StatefulWidget {
  const UploadVideo({super.key});

  @override
  State<UploadVideo> createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  XFile? selectedVideo;
  VideoPlayerController? _controller;

  Future<void> _uploadVideo() async {
    final pickedVideo = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );
    if (pickedVideo != null) {
      _controller = VideoPlayerController.file(File(pickedVideo.path));

      await _controller!.initialize();
    }

    setState(() {
      selectedVideo = pickedVideo;
    });

    _controller!.play();
    _controller!.setLooping(true);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade900.withRed(9),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Container(
              height: 170,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey.withValues(
                  red: 0.5,
                  green: 0.5,
                  blue: 0.5,
                  alpha: 0.5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: _controller != null && _controller!.value.isInitialized
                  ? ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(12),
                      child: AspectRatio(
                        aspectRatio: _controller!.value.aspectRatio,
                        child: VideoPlayer(_controller!),
                      ),
                    )
                  : null,
            ),

            SizedBox(height: 20),

            GestureDetector(
              onTap: _uploadVideo,
              child: Container(
                height: 40,
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(
                    red: 0.5,
                    green: 0.9,
                    blue: 0.5,
                    alpha: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Upload Video",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
