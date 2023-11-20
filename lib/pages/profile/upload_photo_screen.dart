import 'dart:io';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:sizer/sizer.dart';
import '../../util/constants.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/icon_container.dart';
import '../../widgets/text_button.dart';
import 'upload_photo.dart'; // Replace with your actual next screen import

class UploadPhotoScreen extends StatefulWidget {
  const UploadPhotoScreen({super.key});

  @override
  _UploadPhotoScreenState createState() => _UploadPhotoScreenState();
}

class _UploadPhotoScreenState extends State<UploadPhotoScreen> {
  CameraController? _cameraController;

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  Future<void> takePicture(BuildContext context) async {
    try {
      final cameras = await availableCameras();
      final firstCamera = cameras.first;

      _cameraController = CameraController(
        firstCamera,
        ResolutionPreset.medium,
      );

      await _cameraController!.initialize();

      final file = await _cameraController!.takePicture();
      if (file != null) {
        uploadImageToFirebaseStorage(File(file.path), context);
      }
    } catch (e) {
      print(e); // Consider showing this error to the user
    } finally {
      await _cameraController?.dispose();
    }
  }

  Future<void> pickImageFromGallery(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();

    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      uploadImageToFirebaseStorage(File(image.path), context);
    } else {
      // User canceled the picker
    }
  }

  Future<void> uploadImageToFirebaseStorage(
      File image, BuildContext context) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;

    // Showing a loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(child: CircularProgressIndicator());
      },
    );

    try {
      // Create a reference to the location you want to upload to in Firebase Storage

      Reference ref = FirebaseStorage.instance
          .ref()
          .child('users/$userId/${path.basename(image.path)}');

      // Upload the file
      await ref.putFile(image);

      // Get the URL
      String downloadURL = await ref.getDownloadURL();

      // Save the URL to Firestore
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'photoURL': downloadURL,
      });

      Navigator.pop(context); // Close the loading indicator

      // Navigate to next screen or update UI
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  UploadPhotoS())); // Replace with your actual next screen
    } catch (e) {
      Navigator.pop(context); // Close the loading indicator
      print(e); // Handle error

      // Show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to upload image: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          leadIcon: Icon(Icons.arrow_back_ios_new_rounded),
          title: kProfileScreenTitle,
          bgColor: kScaffoldColor,
        ),
        body: Container(
          padding: EdgeInsets.all(5.w),
          margin: EdgeInsets.only(bottom: 5.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(kProfileScreenText),
                  SizedBox(height: 4.h),
                  GestureDetector(
                    onTap: () => takePicture(context),
                    child: IconContainer(
                        icon: Icons.camera_alt_rounded, text: 'Take photo'),
                  ),
                  SizedBox(height: 4.h),
                  GestureDetector(
                    onTap: () => pickImageFromGallery(context),
                    child:
                        IconContainer(icon: Icons.folder, text: 'From gallery'),
                  ),
                ],
              ),
              CustomTextButton(
                  text: 'Next',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                UploadPhotoS())); // Replace with your actual next screen
                  })
            ],
          ),
        ),
      ),
    );
  }
}
