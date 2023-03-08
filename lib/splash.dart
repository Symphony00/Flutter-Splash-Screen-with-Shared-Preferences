import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_sh_preferences/home_screen.dart';
import 'package:splash_sh_preferences/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 3), () {
      loadData();
    });
  }

  loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final val = prefs.getBool("isLogin");
    if (val == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
          height: double.infinity,
          fit: BoxFit.cover,
          image: NetworkImage(
              "https://images.pexels.com/photos/1645668/pexels-photo-1645668.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")),
    );
  }
}
