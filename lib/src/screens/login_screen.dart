import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            SizedBox(height: 10.0),
            passwordField(),
            SizedBox(height: 10.0),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      validator: (String value) {
        if (!value.contains('@')) {
          return 'input valid email';
        }
      },
      onSaved: (String value) {
        email = value;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: 'Email Address', hintText: 'you@example.com'),
    );
  }

  Widget passwordField() {
    return TextFormField(
      validator: (value) {
        if (value.length < 4) {
          return 'password should be more than 4 charecters';
        }
      },
      onSaved: (String value) {
        password = value;
      },
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.amber,
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('saved credential $email and $password');
        }
      },
      child: Text('Login'),
    );
  }
}
