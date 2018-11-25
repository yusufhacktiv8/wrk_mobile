import 'package:flutter/material.dart';
import 'styles.dart';
import 'dart:io';
import 'dart:async';

import 'dart:convert';
import 'loginAnimation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';
import 'components/SignUpLink.dart';
import 'components/Form.dart';
import 'components/SignInButton.dart';
import 'components/WhiteTick.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:dashboard/Constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);
  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  AnimationController _loginButtonController;
  var animationStatus = 0;
  @override
  void initState() {
    super.initState();
    _loginButtonController = new AnimationController(
        duration: new Duration(milliseconds: 3000), vsync: this);
  }

  @override
  void dispose() {
    _loginButtonController.dispose();
    super.dispose();
  }

  Future<Null> _playAnimation() async {
    try {
      await _loginButtonController.forward();
      await _loginButtonController.reverse();
    } on TickerCanceled {}
  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      child: new AlertDialog(
        title: new Text('Are you sure?'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, "/home"),
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.4;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return (new WillPopScope(
        onWillPop: _onWillPop,
        child: new Scaffold(
          body: new Container(
              decoration: new BoxDecoration(
                image: backgroundImage,
              ),
              child: new Container(
                color: Colors.blueAccent,
//                  decoration: new BoxDecoration(
//                      gradient: new LinearGradient(
//                        colors: <Color>[
//                          const Color.fromRGBO(162, 146, 199, 0.8),
//                          const Color.fromRGBO(51, 51, 63, 0.9),
//                        ],
//                        stops: [0.2, 1.0],
//                        begin: const FractionalOffset(0.0, 0.0),
//                        end: const FractionalOffset(0.0, 1.0),
//                      )),
                  child: new ListView(
                    padding: const EdgeInsets.all(0.0),
                    children: <Widget>[
                      new Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: <Widget>[
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new Tick(image: tick),
                              new FormContainer(),
                              new SignUp()
                            ],
                          ),
                          animationStatus == 0
                              ? new Padding(
                            padding: const EdgeInsets.only(bottom: 50.0),
                            child: new InkWell(
                                onTap: () {
//                                  setState(() {
//                                    animationStatus = 1;
//                                  });
//                                  _playAnimation();
                                  login();
                                },
                                child: new SignIn()),
                          )
                              : new StaggerAnimation(
                              buttonController:
                              _loginButtonController.view),
                        ],
                      ),
                    ],
                  ))),
        )));
  }

  Future<void> login() async{
    try {
      var httpClient = new HttpClient();
      var request = await httpClient.postUrl(Uri.parse('$URL/security/signin'));
      request.headers.set('content-type', 'application/json');
      Map map = {
        'username': 'yusuf',
        'password': 'Admin12#',
      };
      request.add(utf8.encode(json.encode(map)));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var dataString = await response.transform(utf8.decoder).join();
        var data = json.decode(dataString);
        var token = data["token"];
        await _setMobileToken(token);
        setState(() {
          animationStatus = 1;
        });
        _playAnimation();
      }
      else{
        await _setMobileToken('');
      }
    } catch (exception) {
      await _setMobileToken('');
    }
  }

  Future<bool> _setMobileToken(String token) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.setString(MOBILE_TOKEN_KEY, token);
  }

}