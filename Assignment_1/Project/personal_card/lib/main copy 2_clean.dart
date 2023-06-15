import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

/// main application widget
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

/// stateless widget that the main application instantiates
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            children: <Widget>[
              ClipOval(
                child: Image.asset(
                  ('assets/images/_E_R0553_edit.jpg'),
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                ('Roger Johansson'),
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
                style: GoogleFonts.greatVibes(fontSize: 34),
              ),
              Card(
                //margin: const EdgeInsets.symmetric(horizontal: 8.0),
                color: Colors.redAccent,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
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
            ],
          ),
        ),
      ],
    );
  }
}
