import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  _Todo? _todo;
  Exception? _exception;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            try {
              final response = await http.get(Uri.parse('http://localhost:57247/todos/1'));

              if (response.statusCode == 200) {
                setState(() {
                  _todo = _Todo.fromJson(jsonDecode(response.body));
                });
              } else {
                setState(() {
                  _exception = Exception('Oops, status code was ${response.statusCode}');
                });
              }
            } on Exception catch (e) {
              setState(() {
                _exception = e;
              });
            }
          },
          child: const Icon(Icons.add),
        ),
        body: Center(
          child: Text(
            _todo != null
                ? _todo!.title
                : _exception != null
                    ? _exception.toString()
                    : 'Press the button',
          ),
        ),
      ),
    );
  }
}

class _Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  _Todo(
    this.userId,
    this.id,
    this.title,
    this.completed,
  );

  factory _Todo.fromJson(Map<String, dynamic> json) {
    return _Todo(
      json['userId'],
      json['id'],
      json['title'],
      json['completed'],
    );
  }
}
