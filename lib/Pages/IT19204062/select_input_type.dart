import 'package:flutter/material.dart';
import 'package:mobile_app/Pages/IT19171920/textRecognition.dart';
import 'package:mobile_app/Pages/IT19204062/add_list_form.dart';
import 'package:mobile_app/Pages/IT19204062/add_list_speech.dart';

class SelectInputType extends StatefulWidget {
  final String serviceType;
  const SelectInputType({Key? key, required this.serviceType})
      : super(key: key);

  @override
  State<SelectInputType> createState() => _SelectInputTypeState();
}

class _SelectInputTypeState extends State<SelectInputType> {
  // Size size = MediaQuery.of(context).size;

  List<String> topics = [
    'Form Input',
    'Text Recognition',
    'Voice Recognition',
  ];

  List<Color> colorsList = [
    Color.fromARGB(255, 233, 228, 187).withOpacity(0.6),
    Color.fromARGB(255, 233, 230, 235).withOpacity(0.6),
    Color.fromARGB(255, 99, 182, 247).withOpacity(0.6),
  ];

  List<String> imageList = [
    "images/contact-form.png",
    "images/ocr.png",
    "images/voice-recognition.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // leading: const Icon(Icons.menu_rounded),
          title: Text('Add Grocery List'),
          toolbarHeight: 130,
          backgroundColor: Color(int.parse('0xff01C0BB')),
        ),
        body: buildListView());
  }

  Widget buildListView() => ListView.separated(
        padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
        separatorBuilder: (context, index) => const Divider(
          color: Colors.white,
        ),
        itemCount: topics.length,
        itemBuilder: (context, index) {
          final item = topics[index];
          return SizedBox(
              height: 100,
              child: ListTile(
                title: Text(
                  item,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                trailing: Image.asset(imageList[index]),
                tileColor: Color.fromRGBO(223, 235, 235, 100),
                contentPadding: EdgeInsets.only(top: 15, left: 10, right: 10),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 2, color: Color.fromRGBO(223, 235, 235, 100)),
                  borderRadius: BorderRadius.circular(10),
                ),
                onTap: () {
                  List<Widget> pageList = [
                    AddGroceryListByForm(
                      serviceType: widget.serviceType,
                    ),
                    TextRecognition(
                      serviceType: widget.serviceType,
                    ),
                    AddGroceryListBySpeechInput(
                      serviceType: widget.serviceType,
                    ),
                  ];
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => pageList[index],
                    ),
                  );
                },
              ));
        },
      );
}
