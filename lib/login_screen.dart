// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unused_import, unnecessary_new, unused_local_variable, avoid_print, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_proj/user_preferences.dart';
import 'signup_screen.dart';
import 'forgot_my_password_screen.dart';
import 'camera_access_screen.dart';
import 'package:http/http.dart' as http;
import 'api_connection.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'user.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<LoginScreen> {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();


  loginUserNow() async 
  {
    try
    {

      var res = await http.post
        (
          Uri.parse(API.login),
          body: 
          {
            "email": emailController.text.trim(),
            "user_password": passwordController.text.trim(),


          },
        );

         if(res.statusCode == 200)
        {
          var resBodyOfLogin =jsonDecode(res.body);
          if(resBodyOfLogin['success'] == true)

          {
            Fluttertoast.showToast(msg: 'Login Successfully');
            User userInfo = User.fromJson(resBodyOfLogin["userData"]);
            await RememberUserPrefs.saveRememberUser(userInfo);

          }

          else
          {
            Fluttertoast.showToast(msg: 'Invalid credentials!\n please write correct password and email and try again');
          }
        }

    }

    catch(errorMsg)
    {
      print("Error :: " + errorMsg.toString());

    }
  }












  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  initWidget() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
                color: new Color(0xFF01579B),
                gradient: LinearGradient(colors: [(new  Color(0xFF01579B)), new Color(0xFF1565C0)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Image.asset(
                          "images/fall.png",
                          height: 90,
                          width: 90,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20, top: 20),
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                          ),
                        ),
                      )
                    ],
                  )
              ),
            ),

            Form
            (
              key:formKey,
              child: Column
              (
                children: 
                [
                  Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 70),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)
                  ),
                ],
              ),

                
                 child: TextFormField(
                  controller: emailController,
                  validator: (val) => val == "" ? "Please enter a valid email!" : null,

                cursorColor: Color(0xFF01579B),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Color(0xFF01579B),
                  ),
                  hintText: "Enter Email",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            
              ),
             

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xffEEEEEE),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 100,
                      color: Color(0xffEEEEEE)
                  ),
                ],
              ),
              
                child: TextFormField(
                  controller: passwordController,
                  validator: (val) => val == "" ? "Please enter a vaild password!" : null,

                cursorColor: Color(0xFF01579B),
                decoration: InputDecoration(
                  focusColor: Color(0xFF01579B),
                  icon: Icon(
                    Icons.vpn_key,
                    color: Color(0xFF01579B),
                  ),
                  hintText: "Enter Password",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            


              ),

                ],

              ),
            ),
             
              
            /*Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xffEEEEEE),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 100,
                      color: Color(0xffEEEEEE)
                  ),
                ],
              ),
              child: TextField(
                cursorColor: Color(0xFF01579B),
                decoration: InputDecoration(
                  focusColor: Color(0xFF01579B),
                  icon: Icon(
                    Icons.phonelink_lock,
                    color: Color(0xFF01579B),
                  ),
                  hintText: "Enter Special Password",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),*/

            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: ()
                 {

                  // Write Click Listener Code Here
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Forgot_My_Password_Screen(),
                        )
                      );
                },
                child: Text("Forgot Password?"),
              ),
            ),

            GestureDetector(
              onTap: () {

                if(formKey.currentState!.validate()) 

                {
                  loginUserNow();

                }

                
                
                // Write Click Listener Code Here.
                /*Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Camera_Access(),
                        )
                      );*/

              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [(new  Color(0xFF01579B)), new Color(0xFF1565C0)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight
                  ),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)
                    ),
                  ],
                ),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),

            
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have An Account ?  "),
                  GestureDetector(
                    child: Text(
                      "Register Now",
                      style: TextStyle(
                          color: Color(0xFF01579B)
                      ),
                    ),
                    onTap: () {
                      // Write Tap Code Here.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        )
                      );
                    },
                  )
                ],
              ),
            )
          ],
        )
      )
    );
  }
}