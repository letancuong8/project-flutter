// ignore: file_names
// ignore_for_file: unused_import, file_names, duplicate_ignore, unused_element, prefer_const_constructors, unnecessary_new
import 'dart:convert' show utf8;
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ratemyfood/Pages/Model.dart';
import 'package:ratemyfood/Pages/Network.dart';
import 'package:cool_alert/cool_alert.dart';

class Subject extends StatefulWidget {
  const Subject({Key key}) : super(key: key);

  @override
  _SubjectState createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  List<pointdb> pointDB = List();
  var hocphan = [
    'Lập trình ứng dụng trên thiết bị di động',
  ];
  var mahocphan = [
    'Tin0123',
  ];
  @override
  void initState() {
    super.initState();
    NetworkRequest.fetchProducts().then(
      (dataFromServer) {
        setState(() {
          pointDB = dataFromServer;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              'Xin chào thầy Nguyễn Văn A',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart_outlined, color: Colors.black)),
          ],
        ),
        body: Container(
          color: Colors.grey[300],
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: hocphan.length,
                    itemBuilder: (context, index) {
                      return new Card(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/MainPage');
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: SizedBox(
                              width: 50,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${hocphan[index]}',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    '${mahocphan[index]}',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
