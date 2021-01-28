import 'package:flutter/material.dart';
import 'package:sql_information/db_provider/dart/note_helper.dart';
import 'package:sizer/sizer.dart';

class MyDataPage extends StatelessWidget {
  final dbHelper = DatabaseHelper.instance;
  final name_c = TextEditingController();
  final age_c = TextEditingController();
  final id_c = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sqlight'),
        ),
        body: Center(
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black, width: 0.1.w)),
                    contentPadding:
                        EdgeInsets.fromLTRB(3.0.w, 3.0.w, 3.0.h, 3.0.h),
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: "Name",
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0.w)),
                  ),
                  controller: name_c,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.010),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black, width: 0.1.w)),
                    contentPadding:
                        EdgeInsets.fromLTRB(3.0.w, 3.0.w, 3.0.h, 3.0.h),
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: "Age",
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0.w)),
                  ),
                  controller: age_c,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.29,
                child: RaisedButton(
                  onPressed: () {
                    _insert();
                  },
                  color: Colors.green,
                  child: Text(
                    "Insert",
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.29,
                child: RaisedButton(
                  onPressed: () {
                    _delete();
                    return showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        backgroundColor: Colors.teal,
                        title: Text(
                          "Alert ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontStyle: FontStyle.italic),
                        ),
                        content: TextField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 0.1.w)),
                            contentPadding:
                                EdgeInsets.fromLTRB(3.0.w, 3.0.w, 3.0.h, 3.0.h),
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: "Id",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0.w)),
                          ),
                          controller: id_c,
                        ),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {
                              _delete();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          MyDataPage()));
                            },
                            child: Text(
                              "okay",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  color: Colors.red,
                  child: Text(
                    "Delete",
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.29,
                child: RaisedButton(
                  onPressed: () {
                    _query();
                  },
                  color: Colors.green,
                  child: Text(
                    "Query",
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.29,
                child: RaisedButton(
                  onPressed: () {
                    return showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Input"),
                        content: Container(
                          child:  ListView(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: TextField(
                                      decoration: new InputDecoration(
                                        labelText: 'Enter Id',
                                        border: new OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(10.0),
                                          ),
                                          borderSide: new BorderSide(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                      controller: id_c,
                                    ),
                                    width: 190,
                                    height: 60.0,
                                    padding: const EdgeInsets.all(10),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: TextField(
                                      decoration: new InputDecoration(
                                        labelText: 'Enter Name',
                                        border: new OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(10.0),
                                          ),
                                          borderSide: new BorderSide(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                      controller: name_c,
                                    ),
                                    width: 190,
                                    height: 60.0,
                                    padding: const EdgeInsets.all(10),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: TextField(
                                      decoration: new InputDecoration(
                                        labelText: 'Enter Age',
                                        border: new OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(10.0),
                                          ),
                                          borderSide: new BorderSide(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                      controller: age_c,
                                    ),
                                    width: 190,
                                    height: 60.0,
                                    padding: const EdgeInsets.all(10),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          height: 200,
                          width: 200,
                        ),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {
                              _update();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyDataPage(),
                                ),
                              );
                            },
                            child: Text("Update"),
                          ),
                        ],
                      ),
                    );
                  },
                  color: Colors.red,
                  child: Text(
                    "Update",
                  ),
                ),
              ),
            ])));
  }

  void _insert() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: name_c.text,
      DatabaseHelper.columnAge: age_c.text,
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('Query all rows');
    allRows.forEach((row) => print(row));
  }

  void _update() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: int.parse(id_c.text),
      DatabaseHelper.columnName: name_c.text,
      DatabaseHelper.columnAge: age_c.text,
    };
    final rowAffected = await dbHelper.update(row);
    print('updated $rowAffected row(s)');
  }

  void _delete() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: int.parse(id_c.text),
    };
    // final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(row);
    print('deleted $rowsDeleted row(s).row $row');
  }
}
