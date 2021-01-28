import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class note_Screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return note_State();
  }
}

class note_State extends State<note_Screen> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var dropDownValue;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add note"),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: SingleChildScrollView(
        child: SafeArea(
            bottom: false,
      child:Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          color: Colors.white30,
          child:  Column(
            children: [
              DropdownButton<String>(
                value: dropDownValue,
                hint: Text('Chose',style: TextStyle(color: Colors.white),),
                dropdownColor: Colors.teal,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropDownValue = newValue;
                  });
                },
                items: <String>['Low', 'High',]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,style: TextStyle(color: Colors.white),),
                  );
                }).toList(),
              ),
              SizedBox(height: 2.0.h,),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.1.w)),
                    contentPadding: EdgeInsets.fromLTRB(3.0.w, 3.0.w, 3.0.h, 3.0.h),
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: "Title",
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0.w)),
                  ),
                ),),

              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child:   TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.1.w)),
                    contentPadding: EdgeInsets.fromLTRB(3.0.w, 3.0.w, 3.0.h, 3.0.h),
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: "Description",
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0.w)),
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                        color: Colors.teal,
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        padding:
                        EdgeInsets.only(left: 0.10.w, right: 0.10.w, top: 0.10.h, bottom: 0.10.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          side: BorderSide(
                              color: Colors.amberAccent,
                              width: 2,
                              style: BorderStyle.solid),
                        ),
                        splashColor: Colors.amberAccent,
                        onPressed: () {

                        },
                        child: Text(
                          "Save",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                        color: Colors.teal,
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        padding:
                        EdgeInsets.only(left: 0.10.w, right: 0.10.w, top: 0.10.h, bottom: 0.10.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          side: BorderSide(
                              color: Colors.amberAccent,
                              width: 2,
                              style: BorderStyle.solid),
                        ),
                        splashColor: Colors.amberAccent,
                        onPressed: () {

                        },
                        child: Text(
                          "Delete",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ],
                  ),




                ],
              ),
            ],
          ),

          padding: EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 3.0.h),
        ),

      ],
      ),
        ),
      ),
        ),
      ),




    );
  }
}
