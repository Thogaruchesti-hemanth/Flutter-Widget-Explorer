import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AddImage extends StatefulWidget {
  const AddImage({super.key});

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  File? _selectedImage;
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Images Demo")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Asset Image",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            //Asset Image
            Image.asset(
              'assets/images/sample_image.jpg',
              width: 100,
              height: 100,
            ),
            SizedBox(height: 16),
            Text(
              "network image",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            //Network Image
            Image.network(
              'https://picsum.photos/200/300',
              width: 100,
              height: 100,
            ),
            SizedBox(height: 10),
            Text(
              "File Image",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: pickImage,
                  child: Text("Pick Image from Gallery"),
                ),
                SizedBox(height: 16),
                _selectedImage != null
                    ? Image.file(
                      _selectedImage!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                    : Text("no Image selected", style: TextStyle(fontSize: 16)),
              ],
            ),
            Text(
              "Memory image",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Image.memory(sampleImageBytes(), width: 100, height: 100),
            Image.memory(sampleImageBytes(), width: 100, height: 100),
          ],
        ),
      ),
    );
  }

  Uint8List sampleImageBytes() {
    return Uint8List.fromList([
      137,
      80,
      78,
      71,
      13,
      10,
      26,
      10,
      0,
      0,
      0,
      13,
      73,
      72,
      68,
      82,
      0,
      0,
      0,
      1,
      0,
      0,
      0,
      1,
      8,
      6,
      0,
      0,
      0,
      31,
      21,
      196,
      89,
      0,
      0,
      0,
      12,
      73,
      68,
      65,
      84,
      8,
      29,
      99,
      0,
      1,
      0,
      0,
      5,
      0,
      1,
      231,
      106,
      96,
      38,
      0,
      0,
      0,
      0,
      73,
      69,
      78,
      68,
      174,
      66,
      96,
      130,
    ]);
  }

  Uint8List sampleBase64Image() {
    String base64String =
        "iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAAOXRFWHRTb2Z0d2FyZQBNYWNpbnRvc2ggSEQgdjcuNy42LCBsaWtlIEdlY2tvIHY1Ljg5lxKZAAAACXBIWXMAAB7CAAAewgFu0HU+AAABNElEQVR4nO3bwWnFMBAG4DdRhhvSaHT/UxDoG7FB9bPgfYZ7pHY4EfqhtbwGSfn3Xt+t5uk1gRQAAAAAAAAAAAAAAAFyPsgZsPb4TmaPf7JMmY74UpjvuXaHjO+I5jPmOyDOe25aFP+5pFP+7plE/72mUj/vWcU8cZ70swfGdRx69vxaVrQzqke0oOhdrQxpUehfbRxoQehfbhxXlKw16uZhYXh/cpbGbHNcL8Z3HFcL8a1nscVwvzbnmOF+Z7RxoSOhdbRxoUOhdrQxpUehfbhxfrP+Hz/pmE8wTmbn+Ndm8sz4nGHed34/pmE8wTmbn+Ndm8sz4nGHed34/pmE8wTmbn+Ndm8sz4nGHed34/g98deQL1HAsAAAAAElFTkSuQmCC";
    return base64Decode(base64String);
  }
}
