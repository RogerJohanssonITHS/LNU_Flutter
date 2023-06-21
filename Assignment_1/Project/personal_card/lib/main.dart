import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Personal Card';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatelessWidget(),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        // set the width of this Container to 100% screen width
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.purple),

        child: Column(
          // Vertically center the widget inside the column
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(color: Colors.purple),
              child: ClipOval(
                child: Image.asset(
                  ('assets/images/_E_R0553_edit.jpg'),
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                ('Roger Johansson'),
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
                style: GoogleFonts.greatVibes(fontSize: 38),
              ),
            ),
            SizedBox(
              height: 135,
              width: 380,
              child: Card(
                color: Colors.purple,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            ('Flutter student'),
                            style: GoogleFonts.bitter(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.email_rounded),
                          Text(
                            (' Email: rj222rs@student.lnu.se'),
                            style: GoogleFonts.bitter(fontSize: 22),
                          ),
                        ],
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.phone_outlined),
                          Text(
                            (' Phone: 0709-729000'),
                            style: GoogleFonts.bitter(fontSize: 22),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.web_outlined),
                          Text(
                            (' Web: https://lnu.se'),
                            style: GoogleFonts.bitter(fontSize: 22),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
