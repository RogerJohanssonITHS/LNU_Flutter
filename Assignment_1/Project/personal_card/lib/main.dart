import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Flutter',
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Personal Card'),
            leading: const Icon(Icons.flutter_dash)),
        body: Center(
          child: Text(
            'Hello Flutter!',
            textDirection: TextDirection.ltr,
            style: GoogleFonts.acme(fontSize: 32),
          ),
        ),
      ),
    );
  }
}
