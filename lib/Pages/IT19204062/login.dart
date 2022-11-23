import 'package:flutter/material.dart';
import 'package:mobile_app/Pages/IT19204062/home.dart';
import 'package:mobile_app/Pages/IT19204062/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    "images/login.png",
                    height: 330,
                    width: 330,
                  ),
                ),
                Container(
                    child: const Text(
                  "Login",
                  style: TextStyle(
                      color: Color.fromARGB(255, 35, 9, 104),
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Theme(
                      child: TextFormField(
                        // controller: textController,
                        style: const TextStyle(fontSize: 17),
                        decoration: const InputDecoration(
                          border: (OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(229, 229, 229, 50),
                            ),
                          )),
                          hintText: "Username",
                          prefixIcon: Icon(Icons.person),
                        ),
                        autofocus: false,
                      ),
                      data: ThemeData().copyWith(
                        colorScheme: ThemeData().colorScheme.copyWith(
                              primary: Color(int.parse('0xff01C0BB')),
                            ),
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Theme(
                    child: TextFormField(
                      // controller: textController,
                      style: const TextStyle(fontSize: 17),
                      decoration: const InputDecoration(
                        border: (OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(229, 229, 229, 50),
                          ),
                        )),
                        hintText: "Password",
                        prefixIcon: Icon(Icons.key),
                      ),
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      autofocus: false,
                    ),
                    data: ThemeData().copyWith(
                      colorScheme: ThemeData().colorScheme.copyWith(
                            primary: Color(int.parse('0xff01C0BB')),
                          ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(int.parse('0xff01C0BB')),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 130, vertical: 15),
                        ),
                        onPressed: () {
                          // addItemToList(
                          //     textController.text,
                          //     subTextController.text,
                          //     textController,
                          //     subTextController);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              ));
                          // Fluttertoast.showToast(
                          //     msg: "Item Added",
                          //     toastLength: Toast.LENGTH_SHORT,
                          //     gravity: ToastGravity.BOTTOM,
                          //     timeInSecForIosWeb: 1,
                          //     backgroundColor:
                          //         const Color.fromARGB(
                          //             255, 61, 59, 59),
                          //     textColor: Colors.white,
                          //     fontSize: 16.0);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()),
                          );
                        },
                        child: Text(
                          "Don't have an account? Sign Up",
                          style: TextStyle(
                              color: Color(int.parse('0xff01C0BB')),
                              fontSize: 15),
                        )))
              ],
            )));
  }
}
