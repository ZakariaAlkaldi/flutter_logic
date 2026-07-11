import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadMultiImgs extends StatefulWidget {
  const UploadMultiImgs({super.key});

  @override
  State<UploadMultiImgs> createState() => _UploadMultiImgsState();
}

class _UploadMultiImgsState extends State<UploadMultiImgs> {
  List<XFile?> selectedImages = [null, null, null];

  Future<void> _uploadImages() async {
    List<XFile> pickedImages = await ImagePicker().pickMultiImage(limit: 3);

    for (int i = 0; i < pickedImages.length; i++) {
      setState(() {
        selectedImages[i] = i < pickedImages.length ? pickedImages[i] : null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade900,

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  selectedImages.length,
                  (index) => Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.withValues(
                        red: 0.5,
                        green: 0.5,
                        blue: 0.5,
                        alpha: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: selectedImages[index] != null
                        ? Image.file(
                            File(selectedImages[index]!.path),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            GestureDetector(
              onTap: _uploadImages,
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
                    selectedImages.any((image) => image != null)
                        ? "Upload More Images"
                        : "Upload Images",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            selectedImages.any((image) => image != null)
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedImages = [null, null, null];
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
                          "Remove Images",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
