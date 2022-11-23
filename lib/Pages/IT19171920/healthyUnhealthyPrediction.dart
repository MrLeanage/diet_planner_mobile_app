import 'package:flutter/material.dart';
import 'package:mobile_app/Pages/IT19171920/UserInfo.dart';

class HealthyUnhealthyPrediction extends StatefulWidget {
  const HealthyUnhealthyPrediction({Key? key}) : super(key: key);

  @override
  State<HealthyUnhealthyPrediction> createState() =>
      _HealthyUnhealthyPredictionState();
}

class _HealthyUnhealthyPredictionState
    extends State<HealthyUnhealthyPrediction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color(int.parse('0xff01C0BB')),
        title: const Text("Prediction"),
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
                      onPressed: () {},
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
}
