import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class SavedFile extends StatelessWidget {
  final String imagePath;

  const SavedFile({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("Image Path: $imagePath");
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Your Painting ...",
            style: Theme.of(
                context).
            textTheme.bodyLarge),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.file(File(imagePath)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveImageToGallery(context);
          //_saveImageToLocalStorage(context);
        },
        // ignore: prefer_const_constructors
        child: Icon(Icons.save),
      ),
    );
  }

  Future<void> _saveImageToGallery(BuildContext context) async {
    try {
      // Read the image bytes
      Uint8List bytes = await File(imagePath).readAsBytes();

      // Save image to the gallery
      final result =
          await ImageGallerySaver.saveImage(Uint8List.fromList(bytes));

      // Check if the image was saved successfully
      if (result != null && result['isSuccess'] == true) {
        // Show a snackbar indicating the success
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Image saved to gallery"),
          ),
        );
      } else {
        // Show a snackbar indicating failure
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Failed to save image"),
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error saving image: $e");
      }
    }
  }
}

Future<void> _saveImageToLocalStorage(BuildContext context) async {
  try {
    // Use gallery_saver to save the image to the gallery
    //  await GallerySaver.saveImage(imagePath);

    // Show a snackbar indicating that the image has been saved
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Image saved to gallery"),
      ),
    );
  } catch (e) {
    print("Error saving image: $e");
  }
}

Future<void> _scanFile(String path) async {
  try {
    // Use platform channels to invoke native code for media scanning
    const MethodChannel channel = MethodChannel('gallery_scan');
    await channel.invokeMethod('scanFile', {'file_path': path});
  } catch (e) {
    print("Error scanning file: $e");
  }
}
