import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Insert extends StatefulWidget {
  Insert({Key? key}) : super(key: key);

  @override
  _InsertState createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  final TextEditingController _textController = TextEditingController();
  List<Map<String, dynamic>> dataResponseBody = [];

  void handleInsert(String text) async {
    try {
      final response = await http.post(
        Uri.parse("http://localhost:8080/api/v1/insert/insert-data"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"text": text}),
      );

      final responseBody = jsonDecode(response.body);
      print('Response body: ${responseBody["message"]}');
    } catch (e) {
      print(e);
    }
  }

  void handleGetData() async {
    try {
      final data = await http.get(
        Uri.parse("http://localhost:8080/api/v1/get/get-data"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      final decodedData = jsonDecode(data.body);
      print(decodedData);

      List<Map<String, dynamic>> newDataResponseBody =
          List<Map<String, dynamic>>.from(decodedData["data"]);

      setState(() {
        dataResponseBody = newDataResponseBody;
      });
    } catch (e) {
      print(e);
    }
  }

  void handleDeleteData() async {
    try {
      final response = await http.delete(
        Uri.parse("http://localhost:8080/api/v1/delete/delete-data"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      final responseBody = jsonDecode(response.body);

      // After deleting data, refresh the screen by fetching updated data
      handleGetData();

      print('Response body: ${responseBody["message"]}');
      
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  labelText: 'Enter text',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                String inputValue = _textController.text;
                print(inputValue);
                handleInsert(inputValue);
              },
              child: const Text("Submit"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                handleGetData();
              },
              child: const Text("Get Data"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                handleDeleteData();
              },
              child: const Text("Delete Data"),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dataResponseBody.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(dataResponseBody[index]["text"]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
