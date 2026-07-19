import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  XFile? selectedImage;

  Future<void> _uploadImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      selectedImage = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade900,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                color: Colors.grey.withValues(
                  red: 0.5,
                  green: 0.5,
                  blue: 0.5,
                  alpha: 0.5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: selectedImage != null
                  ? Image.file(File(selectedImage!.path), fit: BoxFit.cover)
                  : null,
            ),
           
            SizedBox(height: 10),
            GestureDetector(
              onTap: _uploadImage,
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
                    selectedImage == null ? "Upload Image" : "Change Image",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 10),
            if (selectedImage != null)
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedImage = null;
                  });
                },
                child: Container(
                  height: 40,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(
                      red: 1.7,
                      green: 0.5,
                      blue: 0.5,
                      alpha: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      selectedImage == null ? "Upload Image" : "Change Image",
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
