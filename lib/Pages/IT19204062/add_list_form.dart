import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_app/Pages/IT19171920/userInfo.dart';
import 'package:mobile_app/Pages/IT19204062/add_users_details.dart';

class AddGroceryListByForm extends StatefulWidget {
  final String serviceType;
  const AddGroceryListByForm({Key? key, required this.serviceType})
      : super(key: key);

  @override
  State<AddGroceryListByForm> createState() => _AddGroceryListByFormState();
  addItemToList(String text, String subText) {}
}

class _AddGroceryListByFormState extends State<AddGroceryListByForm> {
  int index = 0;
  List items = [];

  @override
  void initState() {
    super.initState();
  }

  void Function()? addItemToList(
      value, subValue, textController, subTextController) {
    setState(() {
      var object = {
        "foodName": value,
        "quantityType": "Grams",
        "quantity": subValue,
      };
      items.add(object);
      textController.clear();
      subTextController.clear();
    });
    return null;
  }

  final textController = TextEditingController();
  final subTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Add Grocery List'),
            IconButton(
              icon: const Icon(Icons.add_circle),
              onPressed: () => {
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
                                  "Add Items",
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: TextFormField(
                                  controller: textController,
                                  style: const TextStyle(fontSize: 17),
                                  decoration: const InputDecoration(
                                      hintText: "Item Name"),
                                  autofocus: false,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: subTextController,
                                  decoration: const InputDecoration(
                                      hintText: "Quantity in grams"),
                                  style: const TextStyle(fontSize: 17),
                                  autofocus: false,
                                ),
                              ),
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
                                        addItemToList(
                                            textController.text,
                                            subTextController.text,
                                            textController,
                                            subTextController);
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                        Fluttertoast.showToast(
                                            msg: "Item Added",
                                            toastLength: Toast.LENGTH_SHORT,
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
                  },
                )
              },
            ),
            IconButton(
              icon: const Icon(Icons.ondemand_video),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => widget.serviceType == "healthiness"
                          ? UserInfo(items: items)
                          : AddUsersDetails(items: items),
                    ));
              },
            ),
          ],
        ),
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
        padding: const EdgeInsets.only(top: 15),
        separatorBuilder: (context, index) => const Divider(
          color: Colors.black,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item['foodName']),
            subtitle: Text(item['quantity'] + ' grams'),
            trailing: const Icon(Icons.delete, color: Colors.red),
          );
        },
      );
}
