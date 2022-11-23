import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:mobile_app/Pages/IT19204062/add_list_form.dart';
import 'package:mobile_app/Pages/IT19204062/add_list_speech.dart';
import 'package:mobile_app/Pages/IT19204062/home.dart';
import 'package:mobile_app/Pages/IT19204062/select_input_type.dart';
import 'package:mobile_app/Pages/IT19171920/textRecognition.dart';
import 'package:mobile_app/Pages/IT19204062/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const SplashScreen()
    );
  }
}
