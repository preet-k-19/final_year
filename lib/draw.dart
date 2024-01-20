import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_painter/image_painter.dart';
import 'package:open_file/open_file.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'open_image.dart';

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Painter Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ImagePainterExample(),
    );
  }
}

class ImagePainterExample extends StatefulWidget {
  const ImagePainterExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ImagePainterExampleState createState() => _ImagePainterExampleState();
}

class _ImagePainterExampleState extends State<ImagePainterExample> {
  final _imageKey = GlobalKey<ImagePainterState>();

  void saveImage() async {
    final image = await _imageKey.currentState?.exportImage();
    final directory = (await getApplicationDocumentsDirectory()).path;
    await Directory('$directory/sample').create(recursive: true);
    final fullPath =
        '$directory/sample/${DateTime.now().millisecondsSinceEpoch}.png';
    final imgFile = File(fullPath);
    if (image != null) {
      imgFile.writeAsBytesSync(image);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.grey[700],
          padding: const EdgeInsets.only(left: 10),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Image Exported successfully.",
                  style: TextStyle(color: Colors.white)),
              TextButton(
                onPressed: () => OpenFile.open(fullPath),
                child: Text(
                  "Open",
                  style: TextStyle(
                    color: Colors.blue[200],
                  ),
                ),
              )
            ],
          ),
        ),
      );
      // to add animations
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              SavedFile(imagePath: fullPath),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.decelerate;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 500),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Paint Your Design",
          style: Theme.of(
              context).
          textTheme.bodyLarge),
        actions: [
          IconButton(
            icon: const Icon(Icons.download_for_offline),
            onPressed: saveImage,
          )
        ],
      ),
      body: Stack(
        children: [
          const Text("hellow", style: TextStyle(fontSize: 30)),
          // Background square image
          Image.asset(
            "assets/images/img_ellipse_3.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          // Drawable canvas on top
          ImagePainter.asset(
            "assets/images/123.png",
            key: _imageKey,
            scalable: true,
            initialStrokeWidth: 2,
            textDelegate: TextDelegate(),
            initialColor: Colors.green,
            initialPaintMode: PaintMode.line,
          ),
        ],
      ),
    );
  }
}
