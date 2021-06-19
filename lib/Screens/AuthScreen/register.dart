import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loginfire/Provider/auth_provider.dart';
import 'package:loginfire/Screens/AuthScreen/login.dart';

import '../home.dart';

const color = const Color(0xffCACACC);
const colorTwo = const Color(0xff397EF6);

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == false
          ? SafeArea(
              bottom: true,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                          left: 40.0, right: 40.0, top: 50.0),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: SvgPicture.asset(
                                  'assets/illustrationOne.svg',
                                  height: 200.0,
                                  width: 200.0),
                            ),
                          ),
                          Text(
                            'Start to free',
                            style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            'Sign Up',
                            style: TextStyle(
                                color: colorTwo,
                                fontWeight: FontWeight.bold,
                                fontSize: 40.0),
                          ),
                          Text(
                            'to get started!',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 40.0),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 40.0, right: 40.0, top: 50.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 20,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: _email,
                              autofocus: false,
                              style: TextStyle(fontSize: 16.0),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 20.0),
                                hintText: 'Email address',
                                suffixIcon: Icon(Icons.email, color: colorTwo),
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.black.withOpacity(0.4),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 20,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: _password,
                              autofocus: false,
                              style: TextStyle(fontSize: 16.0),
                              obscureText: true,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 20.0),
                                hintText: 'Password',
                                suffixIcon: Icon(
                                  Icons.visibility,
                                  color: colorTwo,
                                ),
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.black.withOpacity(0.4),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: colorTwo,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  AuthClass()
                                      .createAccount(
                                          email: _email.text.trim(),
                                          password: _password.text.trim())
                                      .then((value) {
                                    if (value == 'Account created') {
                                      setState(() {
                                        isLoading = false;
                                      });

                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => HomePage()),
                                          (route) => false);
                                    } else {
                                      setState(() {
                                        isLoading = false;
                                      });

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                              SnackBar(content: Text(value)));
                                    }
                                  });
                                },
                                child: Ink(
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 20.0),
                                      child: Text(
                                        'Create account',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: <Widget>[
                              Text(
                                'Already a member?',
                                style: TextStyle(
                                    color: color,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()));
                                  },
                                  child: Text(
                                    'Log in',
                                    style: TextStyle(
                                      color: colorTwo,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
