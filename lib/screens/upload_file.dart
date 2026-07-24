import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_file/open_file.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class UploadFile extends StatefulWidget {
  const UploadFile({super.key});

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  String? _fileName;
  String? _filePath;

  Future<void> _pickFile() async {
    final file = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'docx', 'doc'],
    );

    if (file != null && file.files.single.name.isNotEmpty) {
      setState(() {
        _fileName = file.files.single.name;
        _filePath = file.files.single.path;
      });
    }
  }

  String _isLong(String text) {
    if (text.length <= 20) {
      return text;
    } else {
      return "${text.substring(0, 20)}...";
    }
  }

  void _openFile(String? path) {
    OpenFile.open(path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Container(
              height: 60,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.black12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    SvgPicture.asset(width: 30, "assets/Svgs/file.svg"),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _fileName == null
                              ? "Upload File"
                              : _isLong("$_fileName"),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('pdf, docx, doc ', style: TextStyle(fontSize: 11)),
                      ],
                    ),
                    Spacer(),
                    PopupMenuButton(
                      color: Colors.white,
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            onTap: _pickFile,
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.upload_circle,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 5),
                                Text("Upload"),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            onTap: () => _openFile(_filePath),
                            child: Row(
                              children: [
                                Icon(CupertinoIcons.eye, color: Colors.black),
                                SizedBox(width: 5),
                                Text('View'),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            onTap: _pickFile,
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.refresh,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 5),
                                Text('Change'),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            onTap: () {
                              setState(() {
                                _fileName = null;
                                _filePath = null;
                              });
                            },
                            child: Row(
                              children: [
                                Icon(CupertinoIcons.delete, color: Colors.red),
                                SizedBox(width: 5),
                                Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ];
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            if (_filePath != null && _filePath!.endsWith('pdf'))
              SizedBox(
                width: 230,
                height: 400,
                child: SfPdfViewer.file(File(_filePath!)),
              ),
          ],
        ),
      ),
    );
  }
}
