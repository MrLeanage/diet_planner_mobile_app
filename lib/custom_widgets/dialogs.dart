import 'package:flutter/material.dart';

class Dialogs{
  static information(BuildContext context, String title, String description, int popCount){
    return  showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context){
          return AlertDialog(
            title: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.amber[200],
              child: Text(
                  title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    fontWeight: FontWeight.w400
                  ),
              ),
            ),

            content: SingleChildScrollView(
              child: ListBody(

                children: <Widget>[
                  Text(
                    description,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400
                    ),)
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text('OK'),
                  onPressed: (){
                for(var i = 0; i < popCount; i ++){
                  Navigator.of(context).pop(context);
                }
              },
              ),
              // TextButton(
              //   style: ButtonStyle(
              //     backgroundColor: MaterialColo,
              //   ),
              //     onPressed: () => {
              //       for(var i = 0; i < popCount; i ++){
              //         Navigator.of(context).pop(context)
              //       }
              //
              //     },
              //     child: Text('OK'))
            ],

          );
        }
    );
  }
  static waiting(BuildContext context, String title, String description){
    return  showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text(
                title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400
              ),
            ),

            content: SingleChildScrollView(
              child: ListBody(

                children: <Widget>[
                  Text(description)
                ],
              ),
            ),

          );
        }
    );
  }

  _confirmAction(bool isConfirmed, BuildContext context){
    if(isConfirmed){

    }else{
      print('No');
      Navigator.pop(context);
    }
  }
  static confirm(BuildContext context, String title, String description, Function function){
    return  showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context){
          return AlertDialog(
            title: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
              color: Colors.amber[200],
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400
                ),
              ),
            ),

            content: SingleChildScrollView(
              child: ListBody(

                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      description,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400
                      ),),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text('Yes'),
                onPressed: (){
                  function();
                  Navigator.of(context).pop(context);
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                primary: Colors.redAccent
                ),
                child: Text('Cancel'),
                onPressed: (){
                  Navigator.of(context).pop(context);
                },
              ),
            ],

          );
        }
    );
  }
}