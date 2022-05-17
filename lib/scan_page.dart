import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter/material.dart';

class ScanScreen extends StatefulWidget {
  ScanScreen({Key key}) : super(key: key);

  @override
  ScanScreenState createState() => ScanScreenState();
}

class ScanScreenState extends State<ScanScreen> {
  bool _loading = false;

  List _outputs;
  File _image;

  @override
  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  Future<void> loadModel() async {
    String res = await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
      // useGpuDelegate: true,
    );
    print(res);
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator.adaptive(),
            )
          : Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _image == null
                      ? Container()
                      : Image.file(
                          _image,
                          width: 200,
                          height: 200,
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  _outputs != null
                      ? Text(
                          "Result: ${_outputs[0]["label"]}\nAccuracy: ${(_outputs[0]["confidence"] * 100).toStringAsFixed(1)}%",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                          textAlign: TextAlign.center,
                        )
                      : Text(
                          'Waiting scan image',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                          ),
                        ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImage,
        child: Icon(Icons.photo_camera_outlined),
        backgroundColor: Colors.pink,
      ),
    );
  }

  void pickImage() async {
    try {
      ImagePicker picker = ImagePicker();
      var image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      setState(() {
        _loading = true;
        _image = File(image.path);
      });
      await classifyImage(_image);
      setState(() {
        _loading = false;
      });
    } catch (error) {
      setState(() {
        _loading = false;
      });
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
        ),
      );
    }
  }

  Future<void> classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    print('output: $output');
    setState(() {
      _outputs = output;
    });
  }
}
