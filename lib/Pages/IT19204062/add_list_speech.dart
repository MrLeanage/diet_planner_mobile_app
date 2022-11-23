import 'package:flutter/material.dart';
import 'package:mobile_app/Pages/IT19204062/add_users_details.dart';
import 'package:mobile_app/Pages/IT19204062/speech_input.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../IT19171920/UserInfo.dart';

class AddGroceryListBySpeechInput extends StatefulWidget {
  final String serviceType;
  const AddGroceryListBySpeechInput({Key? key, required this.serviceType})
      : super(key: key);

  @override
  State<AddGroceryListBySpeechInput> createState() =>
      _AddGroceryListBySpeechInputState();

  addItemToList(String text) {}
}

class _AddGroceryListBySpeechInputState
    extends State<AddGroceryListBySpeechInput> {
  int index = 0;
  List items = [];
  List subItems = [];
  List types = [];

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Kg"), value: "Kg"),
      const DropdownMenuItem(child: Text("grams"), value: "grams"),
      const DropdownMenuItem(child: Text("pieces"), value: "pieces"),
      const DropdownMenuItem(child: Text("litre"), value: "litre"),
      const DropdownMenuItem(child: Text("packets"), value: "packets"),
    ];
    return menuItems;
  }

  String selectedValue = "Kg";

  @override
  void initState() {
    super.initState();
  }

  void Function()? addItemToList(value) {
    setState(() {
      items.add(value);
      subItems.add(' ');
      types.add('');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // leading: const Icon(Icons.menu_rounded),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Add Grocery List'),
            IconButton(
              icon: const Icon(Icons.mic),
              onPressed: () => {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        elevation: 16,
                        child: SizedBox(
                          height: 380.0,
                          width: 360.0,
                          child: SpeechInput(addItemToList: addItemToList),
                        ));
                  },
                )
              },
            ),
            IconButton(
                icon: const Icon(Icons.check_circle_outline_rounded),
                onPressed: () => {})
          ],
        ),
        // toolbarHeight: 145,
        toolbarHeight: 100,
        backgroundColor: Color(int.parse('0xff01C0BB')),
      ),
      body: Column(children: [
        Container(
            margin: const EdgeInsets.only(left: 30.0, right: 30.0),
            height: 500,
            child: buildListView()),
        Expanded(
            child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: Container(
            padding: EdgeInsets.only(bottom: 15),
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
                      builder: (context) => widget.serviceType == "healthiness"
                          ? UserInfo(items: items)
                          : AddUsersDetails(items: items),
                    ));
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
                          fontSize: 13, color: Color(int.parse('0xff01C0BB'))),
                    )
                  ],
                ),
              ),
            ),
          ),
        ))
      ]),
    );
  }

  Widget buildListView() => ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          color: Colors.black,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
              title: Text(item),
              subtitle: Text(subItems[index] + ' ' + types[index]),
              trailing: const Icon(Icons.delete, color: Colors.red),
              onTap: () => {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              elevation: 16,
                              child: Container(
                                  height: 250.0,
                                  width: 300.0,
                                  child: Column(children: [
                                    const SizedBox(height: 20),
                                    const Center(
                                      child: Text(
                                        "Add Quantity",
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    // Row(
                                    //   children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: TextFormField(
                                        style: const TextStyle(fontSize: 17),
                                        autofocus: false,
                                        onChanged: (value) =>
                                            subItems[index] = value,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    DropdownButton(
                                        value: selectedValue,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedValue = newValue!;
                                            types[index] = newValue;
                                          });
                                        },
                                        items: dropdownItems),
                                    //   ],
                                    // ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              // setState(() => subItems[index] =
                                              //     subItems[index]);
                                              types[index] = selectedValue;
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .pop();
                                              Fluttertoast.showToast(
                                                  msg: "Quantity Added",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                          255, 61, 59, 59),
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
                                            },
                                            child: const Text(
                                              'Add',
                                              style: TextStyle(fontSize: 24.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ])));
                        }),
                  });
        },
      );
}
