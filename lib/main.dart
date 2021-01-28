import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:sql_information/addNote.dart';
import 'package:sql_information/view/mynote.dart';

import 'db_provider/dart/note_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizerUtil().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Sizer',
              theme: ThemeData.light(),
              // home: MyHomePage(
              //   title: 'Notes',
              // ),
              home: MyDataPage(),
            );
          },
        );
      },
    );
  }
}
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   // int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // _counter++;
//     });
//   }
//
//   final dbHelper = DatabaseHelper.instance;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               width: MediaQuery.of(context).size.width * 0.9,
//               child: TextField(
//                 style: TextStyle(color: Colors.black),
//                 decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                       borderSide:
//                           BorderSide(color: Colors.black, width: 0.1.w)),
//                   contentPadding:
//                       EdgeInsets.fromLTRB(3.0.w, 3.0.w, 3.0.h, 3.0.h),
//                   labelStyle: TextStyle(color: Colors.black),
//                   hintText: "Id",
//                   hintStyle: TextStyle(color: Colors.black),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5.0.w)),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.02,
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width * 0.9,
//               child: TextField(
//                 style: TextStyle(color: Colors.black),
//                 decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                       borderSide:
//                           BorderSide(color: Colors.black, width: 0.1.w)),
//                   contentPadding:
//                       EdgeInsets.fromLTRB(3.0.w, 3.0.w, 3.0.h, 3.0.h),
//                   labelStyle: TextStyle(color: Colors.black),
//                   hintText: "Name",
//                   hintStyle: TextStyle(color: Colors.black),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5.0.w)),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.02,
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width * 0.9,
//               child: TextField(
//                 style: TextStyle(color: Colors.black),
//                 decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                       borderSide:
//                           BorderSide(color: Colors.black, width: 0.1.w)),
//                   contentPadding:
//                       EdgeInsets.fromLTRB(3.0.w, 3.0.w, 3.0.h, 3.0.h),
//                   labelStyle: TextStyle(color: Colors.black),
//                   hintText: "Age",
//                   hintStyle: TextStyle(color: Colors.black),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5.0.w)),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.02,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.29,
//                   child: RaisedButton(
//                     onPressed: () {
//                       _insert();
//                     },
//                     color: Colors.green,
//                     child: Text(
//                       "Insert",
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.29,
//                   child: RaisedButton(
//                     onPressed: () {
//                       _query();
//                     },
//                     color: Colors.red,
//                     child: Text(
//                       "Query",
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.02,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.29,
//                   child: RaisedButton(
//                     onPressed: () {
//                       _delete();
//                     },
//                     color: Colors.green,
//                     child: Text(
//                       "Delete",
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.29,
//                   child: RaisedButton(
//                     onPressed: () {
//                       _update();
//                     },
//                     color: Colors.red,
//                     child: Text(
//                       "Update",
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => note_Screen()),
//           );
//         },
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
//
//   void _insert() async {
//     Map<String, dynamic> row = {
//       DatabaseHelper.columnName: 'Devil',
//       DatabaseHelper.columnAge: 26,
//     };
//     final id = await dbHelper.insert(row);
//     print('inserted row id: $id');
//   }
//
//   void _query() async {
//     final allRows = await dbHelper.queryAllRows();
//     print('Query all rows');
//     allRows.forEach((row) => print(row));
//   }
//
//   void _update() async {
//     Map<String, dynamic> row = {
//       DatabaseHelper.columnId: 1,
//       DatabaseHelper.columnName: 'rocky',
//       DatabaseHelper.columnAge: 28
//     };
//     final rowAffected = await dbHelper.update(row);
//     print('updated $rowAffected row(s)');
//   }
//
//   void _delete() async {
//     final id = await dbHelper.queryRowCount();
//     final rowsDeleted = await dbHelper.delete(id);
//     print('deleted $rowsDeleted row(s).row $id');
//   }
// }
