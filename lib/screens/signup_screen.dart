import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  static final String id = 'signup_screen';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name, _email, _password;

  // _LoginScreenState(this._email, this._password);
  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_name);
      print(_email);
      print(_password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      appBar: AppBar(title: Center(child: Text('Book App'))),
      body: Center(
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
                      decoration: InputDecoration(labelText: 'Name'),
                      validator: (input) => input.trim().isEmpty
                          ? 'Please enter a valid name'
                          : null,
                      onSaved: (input) => _name = input,
                    ),
                  ),
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
                    onPressed: () => Navigator.pop(context),
                    color: Colors.amberAccent,
                    child: Text('Back to login'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
