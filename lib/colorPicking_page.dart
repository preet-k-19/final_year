import 'package:aura_box/aura_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';





void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: aur_demo(),
    );
  }
}


// ignore: camel_case_types
class aur_demo extends StatefulWidget {
  const aur_demo({super.key});

  @override
  State<aur_demo> createState() => _aur_demoState();
}

// ignore: camel_case_types
class _aur_demoState extends State<aur_demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuraBox(
        spots: [
          // Places one blue spot in the center
          AuraSpot(
            color: Colors.blue,
            radius: 800.0,
            alignment: Alignment.topLeft,
            blurRadius: 25.0,
            stops: const [0.0, 0.5],
          ),
          // Places one red spot in the bottom right
          AuraSpot(
            color: Colors.red,
            radius: 650.0,
            alignment: Alignment.center,
            blurRadius: 10.0,
            stops: const [0.0, 0.5],
          ),
          AuraSpot(
            color: Colors.grey,
            radius: 650.0,
            alignment: Alignment.bottomRight,
            blurRadius: 10.0,
            stops: const [0.0, 0.5],
          ),
        ],
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const SizedBox(
          height: 1000,
          width: 500,
        ),
      ),
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
