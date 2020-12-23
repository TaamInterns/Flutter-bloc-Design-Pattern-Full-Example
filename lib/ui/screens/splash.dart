import 'dart:async';

import 'package:flutter/material.dart';

import '../../data/resources/storage.dart';
import 'home/home.dart';
import 'login.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  startTime(_function) => Timer(new Duration(seconds: 2), _function);

  @override
  void initState() {
    super.initState();
    navigationPage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: new BoxDecoration(
        color: Theme.of(context).accentColor,
      ),
      child: Center(
        child: Image.asset("assets/images/logo.jpg"),
      ),
    );
  }

  navigationPage() async {
    if (await Storage.getApiToken() == null)
      startTime(_goToLogIn());
    else
      startTime(_goToApp());
  }

  _goToLogIn() {
    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(
        builder: (context) => LogIn(),
      ),
    );
  }

  Future _goToApp() async {
    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(
        builder: (context) => Home(),
      ),
    );
  }
}
