// ignore: file_names
// ignore_for_file: unused_import, file_names, duplicate_ignore, unused_element, prefer_const_constructors, unnecessary_new
import 'dart:convert' show utf8;
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ratemyfood/Pages/Model.dart';
import 'package:ratemyfood/Pages/Network.dart';
import 'package:cool_alert/cool_alert.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<pointdb> pointDB = List();
  var childimg = [
    'img/icon.png',
    'img/icon.png',
    'img/icon.png',
    'img/icon.png',
    'img/icon.png',
    'img/icon.png',
    'img/icon.png',
    'img/icon.png',
    'img/icon.png',
    'img/icon.png',
    'img/icon.png',
    'img/icon.png',
    'img/icon.png',
    'img/icon.png',
    'img/icon.png',
  ];
  var a, b, c, d, e;
  void calculate(a, b, c, d, e) {
    d = (a * 10 / 100) + (b * 15 / 100) + (c * 15 / 100);
    return d;
  }

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
              'Quản lý điểm học phần',
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
                    itemCount: pointDB.length,
                    itemBuilder: (context, index) {
                      return new Card(
                        color: Colors.blue[100],
                        child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return new AlertDialog(
                                    content: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Card(
                                            child: Image.asset(
                                              '${childimg[index]}',
                                              height: 50,
                                            ),
                                          ),
                                          Text(
                                            'Điểm chuyên cần: ${pointDB[index].diemchuyencan}',
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 17,
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17.0,
                                              ),
                                              text:
                                                  'Điểm kiểm tra 1 :${pointDB[index].diemkiemtra1}',
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17.0,
                                              ),
                                              text:
                                                  'Điểm kiểm tra 2:${pointDB[index].diemkiemtra2}',
                                            ),
                                          ),
                                          Text(
                                            'Điểm thi: ${pointDB[index].diemthi}',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                          Text(
                                            'Điểm tổng kết: ${pointDB[index].diemtongket}',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: SizedBox(
                              width: 50,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    '${childimg[index]}',
                                    height: 50,
                                  ),
                                  Text(
                                    '${pointDB[index].id}. ${pointDB[index].tensinhvien}',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    '${pointDB[index].masinhvien}',
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
