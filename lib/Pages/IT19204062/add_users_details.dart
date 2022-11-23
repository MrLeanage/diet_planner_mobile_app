import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_app/Pages/IT19204062/display_predicted_diseases.dart';

class AddUsersDetails extends StatefulWidget {
  final List items;
  const AddUsersDetails({Key? key, required this.items}) : super(key: key);

  @override
  State<AddUsersDetails> createState() => _AddUsersDetailsState();
  addUsersToList(String text, String subText) {}
}

class _AddUsersDetailsState extends State<AddUsersDetails> {
  int index = 0;
  List users = [];
  String numDays = '';

  @override
  void initState() {
    super.initState();
  }

  void Function()? addUsersToList(
      name, gender, age, nameController, textController, subTextController) {
    setState(() {
      var object = {
        "name": name,
        "gender": gender,
        "age": age,
      };
      users.add(object);
      nameController.clear();
      textController.clear();
      subTextController.clear();
    });
    return null;
  }

  final nameController = TextEditingController();
  final textController = TextEditingController();
  final subTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        // leading: const Icon(Icons.menu_rounded),
        title: Column(children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text('Add Users Deatails'),
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
                              height: 300.0,
                              width: 300.0,
                              child: Column(children: [
                                const SizedBox(height: 20),
                                const Center(
                                  child: Text(
                                    "Add User Details",
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
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: TextFormField(
                                    controller: nameController,
                                    style: const TextStyle(fontSize: 17),
                                    decoration:
                                        const InputDecoration(hintText: "Name"),
                                    autofocus: false,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: TextFormField(
                                    controller: textController,
                                    style: const TextStyle(fontSize: 17),
                                    decoration: const InputDecoration(
                                        hintText: "Gender"),
                                    autofocus: false,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: subTextController,
                                    decoration: const InputDecoration(
                                        hintText: "Age in years"),
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
                                          addUsersToList(
                                              nameController.text,
                                              textController.text,
                                              subTextController.text,
                                              nameController,
                                              textController,
                                              subTextController);
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
                                          Fluttertoast.showToast(
                                              msg: "User Detail Added",
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
                  onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DisplayDiseases(
                                users: users,
                                items: widget.items,
                                numDays: numDays),
                          ),
                        ),
                        print(users)
                      }),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 230,
                            height: 45,
            padding: const EdgeInsets.only(right: 10),
            child: TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (String? newValue) {
                setState(() {
                  numDays = newValue!;
                });
              },
              decoration: const InputDecoration(
                  border: (OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(229, 229, 229, 50),
                    ),
                  )),
                  focusedBorder: (OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(229, 229, 229, 50),
                      ))),
                  enabledBorder: (OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(229, 229, 229, 50),
                    ),
                  )),
                  prefixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(start: 0),
                      child:Icon(Icons.calendar_month)),
                  filled: true,
                  fillColor: Color.fromRGBO(229, 229, 229, 50),
                  hintText: "Enter Number of Days"),
              style: const TextStyle(fontSize: 17, color: Colors.black),
              autofocus: false,
            ),
          ),
        ]),

        toolbarHeight: 180,
        backgroundColor: Color(int.parse('0xff01C0BB')),
      ),
      body: Column(children: [
        Container(
            margin: const EdgeInsets.only(left: 30.0, right: 30.0),
            height: 420,
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
                        builder: (context) => DisplayDiseases(
                            users: users,
                            items: widget.items,
                            numDays: numDays)));
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
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user['name']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user['gender']),
                Text(user['age'] + ' years'),
              ],
            ),
            trailing: const Icon(Icons.delete, color: Colors.red),
          );
        },
      );
}
