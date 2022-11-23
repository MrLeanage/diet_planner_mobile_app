import 'package:mobile_app/models/BMI%20Analysis.dart';

import '../custom_widgets/toastMessage.dart';
import '../models/welcomeNote.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatBotAPIService{
  static const String _chatBotServerName = 'dietplanner';

  Future<WelcomeNote> retrieveWelcomeNote() async {
    print("called Function retrieveWelcomeNote");
    WelcomeNote welcomeNote = WelcomeNote();
    var url = Uri.parse('http://'+_chatBotServerName+ '.pythonanywhere.com/welcome_chat_user/');
    //encode Map to JSON

    try{
      var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
      );

      if(response.statusCode == 200){
        var decodedBody = json.decode(response.body);

        if(decodedBody['status'] == 200){
          print(decodedBody['response']['response'].toString());
          welcomeNote = WelcomeNote.fromJson(decodedBody['response']['response']);

          // ToastMessage.showSuccessToast(imageAnalysis.analysis.toString());
        }else {
          ToastMessage.showErrorToast("Error Occurred while Processing your Diet Analysing data. Please Try again");
        }

      }else{
        ToastMessage.showErrorToast("Error Occurred while Retrieving Diet Analysing data. Please Try again");
      }

    } on Exception catch(ignoredException){
      ToastMessage.showErrorToast("Error Occurred while Retrieving Diet Analysing data. Please Try again");
    }
    print(welcomeNote.greeting + " " + welcomeNote.welcomeNote_1);
    return welcomeNote;
  }

  Future<String> analyseUserInput(String userInput) async {
    late String serverResponse;
    var url = Uri.parse('http://'+_chatBotServerName+ '.pythonanywhere.com/analyse_user_input/');
    //encode Map to JSON

    Map data = {
      "user-input" : userInput
    };
    //encode Map to JSON
    var body = json.encode(data);

    try{
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: body
      );

      if(response.statusCode == 200){
        var decodedBody = json.decode(response.body);

        if(decodedBody['status'] == 200){
          serverResponse = decodedBody['response']['response'];

          // ToastMessage.showSuccessToast(imageAnalysis.analysis.toString());
        }else {
          ToastMessage.showErrorToast("Error Occurred while Processing your data. Please Try again");
        }

      }else{
        ToastMessage.showErrorToast("Error Occurred while Retrieving  data. Please Try again");
      }

    } on Exception catch(ignoredException){
      ToastMessage.showErrorToast("Error Occurred while Retrieving data. Please Try again");
    }
    return serverResponse;
  }

  Future<BMIAnalysis> analyseBMI(BMIAnalysis bmiAnalysis) async {

    late BMIAnalysis responseBMIAnalysis = BMIAnalysis();
    var url = Uri.parse('http://'+_chatBotServerName+ '.pythonanywhere.com/getBMIAnalysis/');

    Map data = {
      "age" : bmiAnalysis.age,
      "weight" : bmiAnalysis.weight,
      "height" : bmiAnalysis.height,
      "preference" : bmiAnalysis.preference
    };
    //encode Map to JSON
    var body = json.encode(data);

    try{
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: body
      );

      if(response.statusCode == 200){
        var decodedBody = json.decode(response.body);

        if(decodedBody['status'] == 200){
          // print(decodedBody['response']['suggested-food-list'].toString());
          responseBMIAnalysis = BMIAnalysis.fromJson(decodedBody['response']);

          // ToastMessage.showSuccessToast(imageAnalysis.analysis.toString());
        }else {
          ToastMessage.showErrorToast("Error Occurred while Processing your Analysing Habitual Examine data. Please Try again");
        }

      }else{
        ToastMessage.showErrorToast("Error Occurred while Retrieving Analysing Habitual Examine data. Please Try again");
      }

    } on Exception catch(ignoredException){
      ToastMessage.showErrorToast("Error Occurred while Retrieving Analysing Habitual Examine data. Please Try again");
    }

    return responseBMIAnalysis;
  }
}