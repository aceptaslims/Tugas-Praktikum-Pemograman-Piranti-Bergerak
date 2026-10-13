import 'package:flutter/material.dart';
import 'package:tgsp2/KartuNama.dart';

void main() {
  runApp(const KartuNamaP());
}

class KartuNamaP extends StatelessWidget {
  const KartuNamaP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KartuNama(),
    );
  }
}
