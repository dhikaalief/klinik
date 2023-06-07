import 'package:flutter/material.dart';
import 'package:nyoba2/ui/beranda.dart';
import 'ui/poli_page.dart';

void main() => runApp(const dhika());

class dhika extends StatelessWidget {
  const dhika({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Klinik APP',
      home: Beranda(),
    );
  }
}
