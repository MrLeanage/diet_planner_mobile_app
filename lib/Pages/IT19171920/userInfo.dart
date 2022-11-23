import 'package:flutter/material.dart';
import 'package:mobile_app/Pages/IT19171920/healthyUnhealthyPrediction.dart';
import 'package:mobile_app/Pages/IT19171920/textRecognition.dart';

class UserInfo extends StatefulWidget {
  final List items;
  const UserInfo({Key? key, required this.items}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final consumersController = TextEditingController();
  final consumptionController = TextEditingController();
  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color(int.parse('0xff01C0BB')),
        title: const Text("Consumption Information"),
        // leading: IconButton(
        //   icon: const Icon(Icons.menu),
        //   onPressed: () {},
        // ),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25.0,
              ),
              buildConsumers(),
              const SizedBox(
                height: 25.0,
              ),
              buildConsumption(),
              const SizedBox(
                height: 25.0,
              ),
              buildDate(),
              const SizedBox(
                height: 25.0,
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
                                  const HealthyUnhealthyPrediction()),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 5,
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
    );
  }

  Widget buildConsumers() => TextField(
        controller: consumersController,
        decoration: InputDecoration(
          hintText: 'Number of Consumers',
          labelText: 'Consumers',
          icon: const Icon(
            Icons.people_alt_rounded,
            size: 35,
            color: Color.fromRGBO(1, 192, 187, 1),
          ),
          border: const OutlineInputBorder(),
          suffixIcon: consumersController.text.isEmpty
              ? Container(
                  width: 0,
                )
              : IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => consumersController.clear(),
                ),
        ),
        cursorColor: Colors.teal,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
      );

  Widget buildConsumption() => TextField(
        controller: consumptionController,
        decoration: InputDecoration(
          hintText: 'Number of Days of Consumption',
          labelText: 'Consumption',
          icon: const Icon(
            Icons.date_range_rounded,
            size: 35,
            color: Color.fromRGBO(1, 192, 187, 1),
          ),
          border: const OutlineInputBorder(),
          suffixIcon: consumptionController.text.isEmpty
              ? Container(
                  width: 0,
                )
              : IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => consumptionController.clear(),
                ),
        ),
        cursorColor: Colors.teal,
        textInputAction: TextInputAction.done,
      );

  Widget buildDate() => TextField(
        controller: dateController,
        decoration: InputDecoration(
          hintText: 'DD/MM/YYYY',
          labelText: 'Purchased Date',
          icon: const Icon(
            Icons.store_mall_directory_rounded,
            size: 35,
            color: Color.fromRGBO(1, 192, 187, 1),
          ),
          border: const OutlineInputBorder(),
          suffixIcon: dateController.text.isEmpty
              ? Container(
                  width: 0,
                )
              : IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => dateController.clear(),
                ),
        ),
        cursorColor: Colors.teal,
        textInputAction: TextInputAction.done,
      );
}
