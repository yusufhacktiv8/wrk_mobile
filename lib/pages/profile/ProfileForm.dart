import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:dashboard/Constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dashboard/pages/login/LoginScreen.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

// Create a Form Widget
class ProfileForm extends StatefulWidget {
  @override
  ProfileFormState createState() {
    return ProfileFormState();
  }
}

class _PasswordData {
  String currentPassword = '';
  String newPassword = '';
  String newPassword2 = '';
}

// Create a corresponding State class. This class will hold the data related to
// the form.
class ProfileFormState extends State<ProfileForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();
  _PasswordData _data = new _PasswordData();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Current Password",
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter current password';
                }
              },
              onSaved: (String value) {
                this._data.currentPassword = value;
              }
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "New Password",
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter new password';
                }
              },
              onSaved: (String value) {
                this._data.newPassword = value;
              }
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Retype New Password",
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please retype new password';
                }
              },
              onSaved: (String value) {
                this._data.newPassword2 = value;
              }
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, we want to show a Snackbar
                    _formKey.currentState.save();
                    if (_data.newPassword == _data.newPassword2) {
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text('Processing Data')));
                      login(_data.currentPassword, _data.newPassword);
                    } else {
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text('New password is not same with retype password')));
                    }
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> _getMobileToken() async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getString(MOBILE_TOKEN_KEY) ?? '';
  }

  Future<void> login(String _currentPassword, String _newPassword) async{
    try {
      String token = await _getMobileToken();
      var httpClient = new HttpClient();
      var request = await httpClient.putUrl(Uri.parse('$URL/changemypassword'));
      request.headers.set('Authorization', 'Bearer $token');
      request.headers.set('content-type', 'application/json');
      Map map = {
        'currentPassword': _currentPassword,
        'newPassword': _newPassword,
      };
      request.add(utf8.encode(json.encode(map)));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        _formKey.currentState.reset();
        _setMobileToken('');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      } else if (response.statusCode == HttpStatus.forbidden) {
        _showDialog("Invalid Credentials");
      } else {
        _showDialog("Connection Error");
      }
    } catch (exception) {
      _showDialog("Connection Error");
    }
  }

  Future<bool> _setMobileToken(String token) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.setString(MOBILE_TOKEN_KEY, token);
  }

  void _showDialog(String message) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Login Error"),
          content: new Text(message),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}