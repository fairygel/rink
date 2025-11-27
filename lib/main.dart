import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(Rink());
}

class Rink extends StatelessWidget {
  const Rink({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: UploadedText(), title: 'Rink');
  }
}

class UploadedText extends StatefulWidget {
  const UploadedText({super.key});

  @override
  State<UploadedText> createState() => _UploadedTextState();
}

class _UploadedTextState extends State<UploadedText> {
  String uploadedText = '';

  void updateText() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['txt'],
      withData: true
    );
    setState(() {
      if (result == null) return;
      final file = result.files.first;
      uploadedText = utf8.decode(file.bytes!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          uploadedText,
          style: const TextStyle(fontSize: 16.0),
          textAlign: TextAlign.justify,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: updateText,
        child: const Icon(Icons.upload_file),
      ),
    );
  }
}