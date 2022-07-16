import 'package:datademo/pages/home_page.dart';
import 'package:datademo/pages/sign_in.dart';
import 'package:datademo/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async {
  await Hive.initFlutter();
  await Hive.openBox('pdp_online');
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
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const SignIn(),
      routes: {
        SignUp.id:(context)=> const SignUp(),
        SignIn.id:(context)=>const SignIn(),
        HomePage.id:(context)=>const HomePage(),
      },
    );
  }
}

