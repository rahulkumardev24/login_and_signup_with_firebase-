import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadScreen extends StatefulWidget {
  const ImageUploadScreen({super.key});

  @override
  State<ImageUploadScreen> createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File? imagePicked;
  ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Upload "),
      ),
      body: Center(
        child: Column(
          children: [
            /// image show here
            /// if image is not selected then user image show if image is selected then image is showing
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: imagePicked != null
                      ? DecorationImage(
                          image: FileImage(imagePicked!), fit: BoxFit.cover)
                      : const DecorationImage(
                          image: NetworkImage(
                              "https://cdn-icons-png.flaticon.com/512/8345/8345328.png"))),
            ),

            /// here we picked image using image picker
            /// ---------------CAMERA BUTTON -----------------///
            IconButton(
                onPressed: () async {
                  /// here we option camera and gallery also
                  final pickedFile =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() {
                      imagePicked = File(pickedFile!.path);
                    });
                  }
                },
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  size: 30,
                  color: Colors.blue,
                )),

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),

                /// here we upload image on firebase
                onPressed: () {
                  /// upload image on firebase
                },
                child: const Text(
                  "Upload Image",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}

/// IN THIS VIDEO IMAGE UPLOAD ON FIREBASE AND GET IMAGE
/// FIREBASE STORAGE USE
/// STEP 1
/// ADD DEPENDENCY --> IMAGE PICKER , FIRE storage
/// step 2
/// firebase storage start
