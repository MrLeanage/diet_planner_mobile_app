import 'dart:convert';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DisplayDiseases extends StatefulWidget {
  final List users;
  final List items;
  final String numDays;
  const DisplayDiseases({Key? key, required this.users, required this.items, required this.numDays})
      : super(key: key);

  @override
  State<DisplayDiseases> createState() => _DisplayDiseasesState();
}

class _DisplayDiseasesState extends State<DisplayDiseases> {
  List displayResult = [];
  bool loading = false;

  void initState() {
    super.initState();
    // getNutrientsAmount();
    getResult();
  }

  // Future<void Function()?> getNutrientsAmount() async {
  //   loading = true;
  //   var url1 = Uri.https('ihealth-backend.herokuapp.com', '/api/get');
  //   var nutrientsResponse = await http.post(url1,
  //       headers: {
  //         "Content-Type": "application/json",
  //         'Accept': 'application/json',
  //       },
  //       body: json.encode({"groceryItems": widget.items}));

  //   var nutrientsResults;
  //   nutrientsResults = json.decode(nutrientsResponse.body);
  //   print(nutrientsResults);
  //   loading = false;
  // }

  Future<void Function()?> getResult() async {
    loading = true;

    var numUsers = widget.users.length;

    var url1 = Uri.https('ihealth-backend.herokuapp.com', '/api/get');
    var nutrientsResponse = await http.post(url1,
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
        },
        body: json.encode({"groceryItems": widget.items}));

    var nutrientsResults;
    nutrientsResults = json.decode(nutrientsResponse.body);
    print(nutrientsResults);

    var perUserProtein = nutrientsResults['protein'] / numUsers;
    var perUserCarbs = nutrientsResults['carbs'] / numUsers;
    var perUserFiber = nutrientsResults['fiber'] / numUsers;
    var perUserFat = nutrientsResults['fat'] / numUsers;

    var url = Uri.https('diseases-prediction-api.herokuapp.com', '/predict');

    for (var i = 0; i < widget.users.length; i++) {
      print(perUserProtein);
      print(numUsers);
      var response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
            'Accept': 'application/json',
          },
          body: json.encode({
            "protein": perUserProtein,
            "carbs": perUserCarbs,
            "fiber": perUserFiber,
            "fat": perUserFat,
            "gender": widget.users[i]['gender'].toLowerCase() == 'male'? 1 : 2,
            "dage": int.parse(widget.users[i]['age']),
            "cage": int.parse(widget.users[i]['age'])
          }));

      var results;
      results = json.decode(response.body);

      List list = [];
      if (results['prediction'][0][0] == 1.0) list.add("High Blood Pressure");
      if (results['prediction'][0][1] == 1.0) list.add("Cholesterol");
      if (results['prediction'][0][2] == 1.0) list.add("Diabetes");

      var object = {"name": widget.users[i]['name'], "diseases": list};

      setState(() {
        displayResult.add(object);
      });
    }
    loading = false;
    print(displayResult);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // leading: const Icon(Icons.menu_rounded),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              Text('Result'),
            ],
          ),
          toolbarHeight: 100,
          backgroundColor: Color(int.parse('0xff01C0BB')),
        ),
        body: loading
            ? Center(
                child: LoadingAnimationWidget.discreteCircle(
                  color: Color.fromARGB(255, 216, 57, 57),
                  size: 50,
                ),
              )
            : Center(child: buildListView()));
  }

  Widget buildListView() => ListView.separated(
        padding: const EdgeInsets.only(top: 15),
        separatorBuilder: (context, index) => const Divider(
          color: Colors.black,
        ),
        itemCount: displayResult.length,
        itemBuilder: (context, index) {
          print(displayResult);
          final item = displayResult[index];
          return ListTile(
            // title: Text(item['name']),
            title: item['diseases']?.length != 0
                ? Text(item['name'] +
                    ' is at risk of getting ' +
                    item['diseases'].toString())
                : Text(item['name'] +
                    ' is not at risk of getting diabetes, high blood pressure or cholesterol'),
            trailing: item['diseases']?.length != 0
                ? const Icon(Icons.dangerous_rounded, color: Colors.red)
                : const Icon(Icons.check_circle_outline_sharp,
                    color: Color.fromARGB(255, 15, 141, 46)),
            tileColor: item['diseases']?.length != 0
                ? Color.fromARGB(255, 243, 198, 195)
                : Color.fromARGB(255, 178, 240, 193),
          );
        },
      );
}
