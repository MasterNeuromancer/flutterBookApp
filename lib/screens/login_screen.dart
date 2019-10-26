import 'package:flutter/material.dart';
import 'package:flutter_book_app/screens/signup_screen.dart';
import 'package:flutter_book_app/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  static final String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;

  // _LoginScreenState(this._email, this._password);
  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_email);
      print(_password);
      AuthService.login(_email, _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      appBar: AppBar(title: Center(child: Text('Book App'))),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Book App",
                style: TextStyle(fontSize: 50.0),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 20.0,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: (input) => !input.contains('@')
                            ? 'Please enter a valid email'
                            : null,
                        onSaved: (input) => _email = input,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 20.0,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Password'),
                        validator: (input) => input.length < 6
                            ? 'Password must be at least 6 characters'
                            : null,
                        onSaved: (input) => _password = input,
                        obscureText: true,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    FlatButton(
                      onPressed: _submit,
                      color: Colors.amberAccent,
                      child: Text('Login'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    FlatButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, SignupScreen.id),
                      color: Colors.amberAccent,
                      child: Text('Signup'),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
