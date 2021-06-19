import 'package:flutter/material.dart';
import 'package:loginfire/Provider/auth_provider.dart';
import 'package:loginfire/Screens/AuthScreen/login.dart';

const color = const Color(0xffCACACC);
const colorTwo = const Color(0xff397EF6);

class ResetPage extends StatefulWidget {
  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  TextEditingController _email = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == false
          ? SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 40.0, top: 80.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Reset',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.0),
                            ),
                            SizedBox(height: 20.0),
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
                                          builder: (context) => LoginPage(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Log In',
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
                      Container(
                        padding: const EdgeInsets.only(
                            left: 40.0, right: 40.0, top: 70.0),
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
                                  suffixIcon:
                                      Icon(Icons.visibility, color: colorTwo),
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
                                        .resetPassword(
                                      email: _email.text.trim(),
                                    )
                                        .then((value) {
                                      if (value == 'Email sent') {
                                        setState(() {
                                          isLoading = false;
                                        });

                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()),
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
                                          'Reset account',
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
