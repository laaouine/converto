import 'package:flutter/material.dart';
import 'package:monalisa/artwork.dart';

class MuseumApp extends StatelessWidget {
  const MuseumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Museum",
      home: const ArtWork(),
      theme: ThemeData(
        primaryColor: Colors.grey,
      ),
    );
  }
}


/*

*/
