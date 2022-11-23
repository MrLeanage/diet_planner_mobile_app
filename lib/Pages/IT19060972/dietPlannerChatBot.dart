import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:mobile_app/Pages/IT19204062/home.dart';
import 'package:mobile_app/Services/chatbot_api_service.dart';
import 'package:mobile_app/custom_widgets/dialogs.dart';
import 'package:mobile_app/models/BMI%20Analysis.dart';
import 'package:mobile_app/models/DietPlannerQuestion.dart';
import 'package:mobile_app/utility.dart';

import '../../constants.dart';
import '../../custom_widgets/appLoader.dart';
import '../../models/welcomeNote.dart';

class DietPlannerChatBot extends StatefulWidget{
  const DietPlannerChatBot({Key? key}) : super(key: key);

  @override
  _DietPlannerBotPageState createState() => _DietPlannerBotPageState();
}
class _DietPlannerBotPageState extends State<DietPlannerChatBot>{

  ScrollController _scrollController = new ScrollController();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  TextEditingController queryController = TextEditingController();
  List<String> _data = [];
  List<DietPlannerQuestion> dietPlannerQuestionList = [];
  String _lastInput = '';
  int lastCalledIndex = 0;
  late WelcomeNote welcomeNote;

  //initializing data
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchObservationInitialData();

  }

  fetchObservationInitialData() async {
    print("Init Called ");
    dietPlannerQuestionList.add(DietPlannerQuestion.initAll("age", "What is your age?", "0"));
    dietPlannerQuestionList.add(DietPlannerQuestion.initAll("height", "What is your height in Centimetres?", "0"));
    dietPlannerQuestionList.add(DietPlannerQuestion.initAll("weight", "What is your Weight in Kilograms?", "0"));
    dietPlannerQuestionList.add(DietPlannerQuestion.initAll("preference", "What kind of diet Plan You expect? Breakfast? Lunch? Dinner?", "Breakfast"));

    ChatBotAPIService chatBotAPIService = ChatBotAPIService();
    welcomeNote = await chatBotAPIService.retrieveWelcomeNote();

    setState(() {
      setData();
    });
  }

  setData() async {
    insertSingleItem(welcomeNote.greeting + "<bot>");
    print( welcomeNote.greeting + "<bot>");
    await Future.delayed(Duration(seconds: 5));
    insertSingleItem("Thanks for choosing us."+ "<bot>");
    await Future.delayed(Duration(seconds: 5));
    insertSingleItem(welcomeNote.welcomeNote_1+ "<bot>");
    await Future.delayed(Duration(seconds: 7));
    insertSingleItem("For that we will ask some Questions about you. <bot>");
    await Future.delayed(Duration(seconds: 5));
    insertSingleItem(welcomeNote.sentenceConnector+ "<bot>");
    await Future.delayed(Duration(seconds: 5));
    insertSingleItem(dietPlannerQuestionList.elementAt(0).dietPlannerQuestion+ "?..<bot>");

  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.34, left: size.width * 0.012, right:size.width * 0.012 ),

            child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.065),
              child: Container(
                height: size.height,
                color: Colors.white,
                padding: EdgeInsets.only(top : 20, bottom: 20),
                child: Stack(

                  children: <Widget>[
                    AnimatedList(
                      controller: _scrollController,
                      padding: EdgeInsets.only(top: 20, bottom: 150, left: 16, right: 16),
                      key: _listKey,
                      initialItemCount: _data.length,
                      itemBuilder: (BuildContext context, int index,
                          Animation<double> animation) {
                        if(index == _data.length){
                          return Container(
                            height: 250,
                          );
                        }
                        return buildItem(_data[index], animation, index);
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ColorFiltered(
                        colorFilter: ColorFilter.linearToSrgbGamma(),
                        child: Container(
                          color: Colors.grey,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: TextField(

                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500

                              ),
                              decoration: const InputDecoration(
                                  icon: Icon(
                                    Icons.message,
                                    color: Colors.black,
                                  ),
                                  hintText: "Type Your Message Here",
                                  fillColor: Colors.white70
                              ),
                              controller: queryController,
                              textInputAction: TextInputAction.send,
                              onSubmitted: (msg) {
                                this.getResponse(size);
                              },

                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.08),
            child: Container(
              height: size.height * 0.08,
              color: Colors.white.withOpacity(0.9),
              child: Row(

                children: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Spacer(),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image: AssetImage(APP_AVATAR_PATH),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(width: 15)
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.17),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.23,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.white70.withOpacity(0.8),
                  ),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              width: size.width * 0.95,
                              height: size.height * 0.15,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                                image: DecorationImage(image: AssetImage(APP_CHAT_BOT_COVER),
                                    fit: BoxFit.cover
                                ),
                              )
                          )
                        ],
                      ),

                      Padding(
                          padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                          child: Container(
                            padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
                            width: size.width ,
                            height: size.height * 0.05,
                            child: const Text('DIET PLANNER',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),
                            ),
                          )
                      ),
                      SizedBox(height: 5),

                    ],
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getResponse(Size size) async {

    if (queryController.text.length > 0) {
      this.insertSingleItem(queryController.text);

      _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 200), curve: Curves.easeOut);

      _lastInput = queryController.text;
      queryController.clear();

      if(lastCalledIndex < 3 &&  Utility.isContainNumber(_lastInput.toLowerCase())){


        dietPlannerQuestionList.elementAt(lastCalledIndex).dietPlannerAnswer = Utility.separateNumberFromText(_lastInput.toLowerCase());
        await Future.delayed(Duration(seconds: 5));
        insertSingleItem(dietPlannerQuestionList.elementAt(lastCalledIndex + 1).dietPlannerQuestion + "?..<bot>");
        lastCalledIndex ++;

        // if(dietPlannerQuestionList.length == lastCalledIndex + 1){
        //   dietPlannerQuestionList.forEach((element) {
        //     print(element.dietPlannerQuestion + " : " + element.dietPlannerAnswer);
        //   });
        //   // SmartDialog.showLoading(
        //   //     widget: AppLoader.popupLoader(size));
        //   await Future.delayed(Duration(seconds: 10));
        //   Navigator.of(context).push(MaterialPageRoute(
        //       builder: (context) => const Home()
        //     // builder: (context) => ObservationDetection()
        //   ));
        // }else{
        //
        // }

      }else if (lastCalledIndex == 3 && (_lastInput.toLowerCase() == 'breakfast'
          || _lastInput.toLowerCase() == 'lunch'
          || _lastInput.toLowerCase() == 'dinner')){
        dietPlannerQuestionList.elementAt(lastCalledIndex).dietPlannerAnswer = _lastInput.toLowerCase();


        ChatBotAPIService chatBotAPIService =  ChatBotAPIService();
        SmartDialog.showLoading(

          widget: AppLoader.popupLoader(size),
        );
        // SmartDialog.showLoading();
        // await Future.delayed(Duration(seconds: 10));

        BMIAnalysis bmiAnalysis = await chatBotAPIService.analyseBMI(BMIAnalysis.initData(dietPlannerQuestionList.elementAt(0).dietPlannerAnswer,
            dietPlannerQuestionList.elementAt(1).dietPlannerAnswer,
            dietPlannerQuestionList.elementAt(2).dietPlannerAnswer,
            dietPlannerQuestionList.elementAt(3).dietPlannerAnswer));
        String foodSuggestion = '';
        bmiAnalysis.suggestedFoodList.forEach((element) {
          if( bmiAnalysis.suggestedFoodList[0] == element){
            foodSuggestion = element;
          }else{
            foodSuggestion = foodSuggestion + ", " + element;
          }
        });
        String resultDescription = " Your Age : " + bmiAnalysis.age +"\n "
            + "Your Weight : " + bmiAnalysis.weight +"\n "
            + "Your Height : " + bmiAnalysis.weight +"\n "
            + "Selected Plan : " + bmiAnalysis.preference +"\n \n"
            + "Your " + bmiAnalysis.ageClass + ". \n "
            + bmiAnalysis.bmiMsg + ". \n"
            + bmiAnalysis.bmiStatus + ". \n \n"
            + "Food Suggestions : " + foodSuggestion;
        SmartDialog.dismiss();
        Dialogs.information(context, "BMI ANALYSIS REPORT", resultDescription , 2);
        lastCalledIndex ++;
      }else if (_lastInput.toLowerCase() == 'quit'  || _lastInput.toLowerCase() == 'exit') {
        Navigator.of(context).pop();
      }else{
        ChatBotAPIService chatBotAPIService = new ChatBotAPIService();
        String response = await chatBotAPIService.analyseUserInput(_lastInput);
        insertSingleItem(response + "<bot>");
      }

    }
  }

  void insertSingleItem(String message) {
    _data.add(message);
    _listKey.currentState!.insertItem(_data.length - 1);
  }

//Build widget which will take context animation and label
  Widget buildItem(String item, Animation<double> animation, int index) {
    bool mine = item.endsWith("<bot>");
    return
      SizeTransition(
        //sizeFactor: animation,
        sizeFactor: animation,
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Container(
            alignment: mine ? Alignment.topLeft : Alignment.topRight,
            child: Bubble(
                child: Text(
                  item.replaceAll("<bot>", ""),
                  style: TextStyle(
                      fontSize: 17,
                      color: mine? Colors.black : Colors.black
                  ),
                ),
                color: mine? Colors.blue[100] : Colors.grey[200],
                padding: BubbleEdges.all(10)
            ),
          ),

        ),

      );
  }
  
}