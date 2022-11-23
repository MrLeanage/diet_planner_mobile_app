import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app/Pages/IT19171920/UserInfo.dart';
import 'package:mobile_app/Pages/IT19204062/add_users_details.dart';

class TextRecognition extends StatefulWidget {
  final String serviceType;
  const TextRecognition({Key? key, required this.serviceType})
      : super(key: key);

  @override
  State<TextRecognition> createState() => _TextRecognitionState();
}

class _TextRecognitionState extends State<TextRecognition> {
  bool textScanning = false;

  XFile? imageFile;

  String scannedText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Color(int.parse('0xff01C0BB')),
          title: const Text("Text Recognition"),
          // leading: IconButton(
          //   icon: const Icon(Icons.menu),
          //   onPressed: () {},
          // ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (textScanning) const CircularProgressIndicator(),
                  if (!textScanning && imageFile == null)
                    Container(
                      width: 300,
                      height: 300,
                      color: Colors.grey[300]!,
                    ),
                  if (imageFile != null) Image.file(File(imageFile!.path)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.grey,
                            shadowColor: Colors.grey[400],
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          onPressed: () {
                            getImage(ImageSource.gallery);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 5,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.image,
                                  size: 35,
                                  color: Color(int.parse('0xff01C0BB')),
                                ),
                                Text(
                                  "Gallery",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Color(int.parse('0xff01C0BB'))),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.grey,
                              shadowColor: Colors.grey[400],
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                          onPressed: () {
                            getImage(ImageSource.camera);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 5,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  size: 35,
                                  color: Color(int.parse('0xff01C0BB')),
                                ),
                                Text(
                                  "Camera",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Color(int.parse('0xff01C0BB'))),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    child: Text(
                      scannedText,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        padding: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.grey,
                              shadowColor: Colors.grey[400],
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      widget.serviceType == "healthiness"
                                          ? UserInfo(items: [])
                                          : AddUsersDetails(items: [])),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Next",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Color(int.parse('0xff01C0BB'))),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        textScanning = true;
        imageFile = pickedImage;
        setState(() {});
        getRecognisedText(pickedImage);
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
      scannedText = "Error occured while scanning";
      setState(() {});
    }
  }

  void getRecognisedText(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();

    RecognizedText recognizedText = await textDetector.processImage(inputImage);

    await textDetector.close();
    scannedText = "";

    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        scannedText = scannedText + line.text + "\n";
      }
    }
    textScanning = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }
}
