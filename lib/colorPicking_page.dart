import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: color_picker(),
    );
  }
}

class color_picker extends StatefulWidget {
  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<color_picker> {
  Color mycolor = Colors.brown;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter "),
          backgroundColor: Colors.blue,
        ),
        body: Container(
            color: mycolor, //background color of app from color picker
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 35),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Pick a color!'),
                              content: SingleChildScrollView(
                                child: ColorPicker(
                                  pickerColor: mycolor, //default color
                                  onColorChanged: (Color color) {
                                    //on color picked
                                    setState(() {
                                      mycolor = color;
                                    });
                                  },
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('DONE'),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); //dismiss the color picker
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    child: Text("Default Color Picker"),
                  ),
                  SizedBox(height: 35),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Pick a color!'),
                              content: SingleChildScrollView(
                                child: MaterialPicker(
                                  pickerColor: mycolor, //default color
                                  onColorChanged: (Color color) {
                                    //on color picked
                                    setState(() {
                                      mycolor = color;
                                    });
                                  },
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('DONE'),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); //dismiss the color picker
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    child: Text("Material Color Picker"),
                  ),
                  SizedBox(height: 35),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Pick a color!'),
                              content: SingleChildScrollView(
                                child: BlockPicker(
                                  pickerColor: mycolor, //default color
                                  onColorChanged: (Color color) {
                                    //on color picked
                                    setState(() {
                                      mycolor = color;
                                    });
                                  },
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('DONE'),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); //dismiss the color picker
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    child: Text("Block Color Picker"),
                  ),
                  SizedBox(height: 35),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Pick a color!'),
                              content: SingleChildScrollView(
                                child: MultipleChoiceBlockPicker(
                                  pickerColors: [Colors.red, Colors.orange],
                                  //default color
                                  onColorsChanged: (List<Color> colors) {
                                    //on colors picked
                                    print(colors);
                                  },
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('DONE'),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); //dismiss the color picker
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    child: Text("Multiple Choice Color Picker"),
                  ),
                ])));
  }
}
