import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("FERUZI"),
          ),
          backgroundColor: Colors.cyan[300],
        ),
        body: const Center(
          child: Text("Hello world!"),
        ),
        backgroundColor: Colors.grey[400],
      ),
    );
  }
}
