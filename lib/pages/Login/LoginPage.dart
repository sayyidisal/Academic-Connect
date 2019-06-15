import 'package:acadamicConnect/Components/CustomLoginTypeBtn.dart';
import 'package:acadamicConnect/Components/LoginRoundedButton.dart';
import 'package:acadamicConnect/Components/ReusableRoundedButton.dart';
import 'package:acadamicConnect/Components/TopBar.dart';
import 'package:acadamicConnect/Utility/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ProfilePage.dart';
import 'MobileLoginPage.dart';

class LoginPage extends StatefulWidget {
  static String loginTypeSelected = 'S';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String idHint = 'Student Id';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: TopBar(
        title: 'Login',
        child: kBackBtn,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextField(
                  onChanged: (id) {},
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'One which school gave',
                    labelText: idHint,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomLoginTypeBtn(
                  onPressed: () {
                    if (LoginPage.loginTypeSelected == 'S') {
                      setState(() {
                        idHint = 'Student Id';
                      });
                    }
                    if (LoginPage.loginTypeSelected == 'PT') {
                      setState(() {
                        idHint = 'Student 0r Teacher Id';
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (email) {},
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'you@example.com',
                    labelText: 'Email',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  obscureText: true,
                  onChanged: (password) {},
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: '*@*s*#ls',
                    labelText: 'Password',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Hero(
                  tag: 'otpForget',
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ReusableRoundedButton(
                        child: Text(
                          "Forgot Pass?",
                          style: TextStyle(
                            // color: kmainColorTeacher,
                            fontSize: 15,
                          ),
                        ),
                        onPressed: () {},
                        height: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          LoginRoundedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ProfilePage(),
                ),
              );
            },
          ),
          Positioned(
            bottom: 50,
            left: 30,
            width: MediaQuery.of(context).size.width,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Hero(
                tag: 'mobile',
                transitionOnUserGestures: true,
                child: ReusableRoundedButton(
                  child: Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                  // text: 'Mobile',
                  onPressed: () {
                    kopenPageBottom(
                      context,
                      MobileLoginPage(),
                    );
                  },
                  height: 50,
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}