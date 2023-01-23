import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Uri url = Uri.parse("http://localhost/test/conn.php");
  String data = '{"row1":"update in row1","row2":"this is data row2"}';
  String u_id = "1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () async {
                  var res = await http
                      .post(url, body: {"ac": "INSERT", "data": data});
                  if (res.statusCode == 200) {
                    print(res.body);
                  }
                },
                child: const Text("INSERT")),
            ElevatedButton(
                onPressed: () async {
                  var res = await http.post(url, body: {"ac": "SELECT"});
                  if (res.statusCode == 200) {
                    print(res.body);
                  }
                },
                child: const Text("SELECT")),
            ElevatedButton(
                onPressed: () async {
                  var res = await http
                      .post(url, body: {"ac": "SELECT_ID", "u_id": u_id});
                  if (res.statusCode == 200) {
                    print(jsonDecode(res.body));
                  }
                },
                child: const Text("SELECT_ID")),
            ElevatedButton(
                onPressed: () async {
                  var res = await http.post(url,
                      body: {"ac": "UPDATE", "data": data, "u_id": u_id});
                  if (res.statusCode == 200) {
                    print(res.body);
                  }
                },
                child: const Text("UPDATE")),
            ElevatedButton(
                onPressed: () async {
                  var res = await http
                      .post(url, body: {"ac": "DELETE", "u_id": u_id});
                  if (res.statusCode == 200) {
                    print(res.body);
                  }
                },
                child: const Text("DELETE")),
            ElevatedButton(
                onPressed: () async {
                  var res = await http
                      .post(url, body: {"ac": "SELECT", "u_id": u_id});
                  if (res.statusCode == 200) {
                    var resDe = jsonDecode(res.body);
                    print("ข้อมูลที่ได้รับ :$resDe");
                    print(
                        "แปลงข้อมูลแล้ว :${jsonDecode(resDe[0]['data'])['row1']}");
                  }
                },
                child: const Text("เข้าถึงข้อมูล Json")),
          ],
        ),
      ),
    );
  }
}
