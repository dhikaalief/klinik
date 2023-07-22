import 'package:flutter/material.dart';
import 'package:nyoba2/helpers/user_info.dart';
import 'package:nyoba2/ui/beranda.dart';
import 'package:nyoba2/ui/login.dart';
import 'ui/poli_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var token = await UserInfo().getToken();
  print(token);
  runApp(MaterialApp(
    title: "Klinik APP",
    debugShowCheckedModeBanner: false,
    home: token == null ? Login() : Beranda(),
  ));
}
