import 'package:flutter/material.dart';
import 'package:wedding_management/screens/banquet_detail/banquet_detail.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wedding_management/screens/home/home.dart';
import 'package:wedding_management/screens/register/register.dart';
import 'routes.dart';
import './theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        // We use routeName so that we dont need to remember the name
        initialRoute: Register.routeName,
        routes: routes,
    );
  }
}