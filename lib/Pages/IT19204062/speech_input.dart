import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stts;

class SpeechInput extends StatefulWidget {
  const SpeechInput({required this.addItemToList(String myString)});
  final Function(String myString) addItemToList;

  @override
  State<SpeechInput> createState() => _SpeechInputState();
}

class _SpeechInputState extends State<SpeechInput> {
  var _speechToText = stts.SpeechToText();
  bool islistening = false;
  String text = 'Please press the button';
  String selectedValue = 'English';

  void listen() async {
    if (!islistening) {
      bool available = await _speechToText.initialize(
        onStatus: (status) => print("$text"),
        onError: (errorNotification) => print("$errorNotification"),
      );
      if (available) {
        setState(() {
          islistening = true;
        });
        _speechToText.listen(
          localeId: selectedValue == 'Sinhala' ? "si-LK" : 'en-US',
          onResult: (result) => setState(() {
            text = ' ';
            textController.text = result.recognizedWords;
          }),
        );
      }
    } else {
      setState(() {
        islistening = false;
      });
      _speechToText.stop();
    }
  }

  @override
  void initState() {
    super.initState();
    _speechToText = stts.SpeechToText();
  }

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                      child: Column(children: [
                    Container(
                      child: DropdownButtonFormField<String>(
                        itemHeight: 50.0,
                        hint: const Text('English'),
                        value: selectedValue,
                        onChanged: (newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items:
                            <String>['English', 'Sinhala'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(27),
                            borderSide: BorderSide(
                              color: Color(int.parse('0xff01C0BB')),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(27),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Container(
                        child: text == 'Please press the button'
                            ? (Text(text,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)))
                            : TextFormField(
                                controller: textController,
                                // decoration:
                              )),
                    const SizedBox(height: 30.0),
                    Container(
                        child: text == 'Please press the button'
                            ? (Text(''))
                            : (ElevatedButton(
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text(
                                    "Add",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  widget.addItemToList(textController.text);
                                },
                              ))),
                  ]))))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: islistening,
        repeat: true,
        endRadius: 80,
        glowColor: Color(int.parse('0xff01C0BB')),
        duration: const Duration(milliseconds: 1000),
        child: FloatingActionButton(
          backgroundColor: Color(int.parse('0xff01C0BB')),
          onPressed: () {
            listen();
          },
          child: Icon(islistening ? Icons.mic : Icons.mic_none),
        ),
      ),
    );
  }
}
