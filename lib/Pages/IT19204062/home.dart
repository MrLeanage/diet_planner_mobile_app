import 'package:flutter/material.dart';
import 'package:mobile_app/Pages/IT19060972/dietPlannerChatBot.dart';
import 'package:mobile_app/Pages/IT19204062/select_input_type.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Column(children: [
            // Row(
            //   children: const [
            //     Icon(Icons.menu_rounded),
            //   ],
            // ),
            const SizedBox(
              height: 10,
            ),
            Row(children: const [
              SizedBox(
                width: 10,
              ),
              Text('Hi Nirasha'),
            ]),
            const SizedBox(height: 10),
            Row(children: const [
              SizedBox(
                width: 8,
              ),
              Text('Welcome to iHealth', style: TextStyle(fontSize: 15)),
            ]),
            const SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Center(
                        child: Container(
                            width: 300,
                            height: 45,
                            child: Stack(children: <Widget>[
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: (const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(229, 229, 229, 50),
                                        ),
                                      )),
                                      focusedBorder: (const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                          borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                229, 229, 229, 50),
                                          ))),
                                      enabledBorder: (const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(229, 229, 229, 50),
                                        ),
                                      )),
                                      suffixIcon: Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              start: 0),
                                          child: Image.asset(
                                            "images/Icon.png",
                                            width: 50,
                                            height: 50,
                                          )),
                                      filled: true,
                                      fillColor: const Color.fromRGBO(
                                          229, 229, 229, 50),
                                      hintText: "Search"),
                                  style: const TextStyle(
                                      fontSize: 17, color: Colors.white),
                                  autofocus: false,
                                ),
                              ),
                            ])))),
              ],
            )
          ]),
          toolbarHeight: 220,
          backgroundColor: Color(int.parse('0xff01C0BB')),
        ),
        body: Column(children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          Row(
            children: const [
              SizedBox(
                width: 10,
              ),
              Text(
                "Services",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 5.0, right: 5.0),
            height: 160.0,
            alignment: Alignment.center,
            child: buildHorizontalListView(),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: const [
              SizedBox(
                width: 10,
              ),
              Text(
                "History",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 30.0, right: 30.0),
            height: 200,
            alignment: Alignment.center,
            child: buildListView(),
          ),
        ]));
  }

  Widget buildHorizontalListView() => ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
              width: 130,
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const SelectInputType(serviceType: 'healthiness'),
                      ),
                    );
                  },
                  child: Column(children: [
                    Row(
                      children: [
                        Center(
                            child: Image.asset("images/healthiness.png",
                                width: 100, height: 100)),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            "Healthiness Checker",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(int.parse('0xff01C0BB')),
                              // overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )
                  ]))),
          Container(
            width: 130,
            child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const SelectInputType(serviceType: 'diseases'),
                    ),
                  );
                },
                child: Column(children: [
                  Row(
                    children: [
                      Center(
                          child: Image.asset("images/diseases.png",
                              width: 100, height: 100)),
                    ],
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 100,
                        child: Text(
                          "Diseases Predictor",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            // overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )
                ])),
          ),
          Container(
              width: 130,
              child: InkWell(
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const SelectInputType(),
                  //     ),
                  //   );
                  // },
                  child: Column(children: [
                Row(
                  children: [
                    Center(
                        child: Image.asset("images/diet.png",
                            width: 100, height: 100)),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white
                        ),
                        child: const Text(
                          'Diet Planner',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const DietPlannerChatBot()
                            // builder: (context) => ObservationDetection()
                          ));
                        },
                      ),
                      // child: Text(
                      //   "Diet Planner",
                      //   style: TextStyle(
                      //     fontSize: 15,
                      //     fontWeight: FontWeight.bold,
                      //     color: Color(int.parse('0xff01C0BB')),
                      //     // overflow: TextOverflow.ellipsis,
                      //   ),
                      //   maxLines: 2,
                      //   textAlign: TextAlign.center,
                      // ),
                    ),
                  ],
                )
              ]))),
        ],
      );

  Widget buildListView() =>
      ListView(padding: const EdgeInsets.only(top: 15), children: [
        SizedBox(
          height: 60,
          child: ListTile(
            title: Text("Healthy Foods"),
            trailing: Image.asset("images/healthy.png"),
            tileColor: Color.fromRGBO(223, 235, 235, 100),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 2, color: Color.fromRGBO(223, 235, 235, 100)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 60,
          child: ListTile(
            title: Text("Diseases predictions"),
            trailing: Image.asset("images/diseaseshistory.png"),
            tileColor: Color.fromRGBO(223, 235, 235, 100),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 2, color: Color.fromRGBO(223, 235, 235, 100)),
              borderRadius: BorderRadius.circular(10),
            ),
            // onTap: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => const SelectInputType(),
            //     ),
            //   );
            // },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
            height: 60,
            child: ListTile(
              title: Text("Diet Plans"),
              trailing: Image.asset(
                "images/dietplans.png",
                width: 50,
                height: 40,
              ),
              tileColor: Color.fromRGBO(223, 235, 235, 100),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 2, color: Color.fromRGBO(223, 235, 235, 100)),
                borderRadius: BorderRadius.circular(10),
              ),
            )),
      ]);
}
