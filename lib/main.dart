// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tea_post/pages/home_page.dart';
import 'package:tea_post/pages/login_page.dart';
import 'package:tea_post/provider/dashboard_provider.dart';
import 'package:tea_post/provider/logout_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? token;
  @override
  void initState() {
    super.initState();
    getValidationData();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedphone = sharedPreferences.getString('token');
    // print(obtainedphone);
    setState(() {
      token = obtainedphone;
    });
  }

  getSharedPreferanceUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    // print('------------------current user------------------');
    // print(username);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DashboardProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LogoutProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => token == null ? LoginPage() : HomePage(),
          '/login': (context) => LoginPage(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}
