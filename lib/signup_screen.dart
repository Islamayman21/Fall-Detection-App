// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, use_key_in_widget_constructors, duplicate_ignore, empty_catches, unused_import, unrelated_type_equality_checks, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_screen.dart';
import 'package:http/http.dart' as http;
import 'api_connection.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'user.dart';


class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
  
}

class InitState extends State<SignUpScreen> {


  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPassController = TextEditingController();
  
 // var isObsecure = true.obs; 

  validateUserEmail() async
  {

     
    try
    {
      var res = await http.post
      (
        Uri.parse(API.validateEmail),
        body:  
        {
          'email' : emailController.text.trim(),

        },

      );

      if(res.statusCode == 200)
      {
        var resBodyOfValidateEmail = jsonDecode(res.body);

        if(resBodyOfValidateEmail['emailFound'] == true)
        {
          Fluttertoast.showToast(msg: 'Email already exists. Try another email');


        } 
        else 
        {
          registerAndSaveUserRecord();

        }

      }

    }

    catch(e)
    {
      Fluttertoast.showToast(msg: e.toString());

    }

   

  }


  registerAndSaveUserRecord() async
    {
      User userModel = User
      (
        1,
        nameController.text.trim(),
        emailController.text.trim(),
        phoneController.text.trim(),
        passwordController.text.trim(),
        confirmPassController.text.trim()
        
        

      );

      try
      {
        var res = await http.post
        (
          Uri.parse(API.signUp),
          body: userModel.toJson(),
        );

        if(res.statusCode == 200)
        {
          var resBodyOfSignUp =jsonDecode(res.body);
          if(resBodyOfSignUp['success'] == true)
          {
            Fluttertoast.showToast(msg: 'SignUp Successfully');

            setState(() {
              nameController.clear();
              emailController.clear();
              phoneController.clear();
              passwordController.clear();
              confirmPassController.clear();
            });

          }
          else
          {
            Fluttertoast.showToast(msg: 'Error Occurred. Try Again!');
          }
        }

      }

      catch(e)
      {

        Fluttertoast.showToast(msg: e.toString());

      }

    }
    


  @override
  Widget build(BuildContext context) => initWidget();

  Widget initWidget() {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 250,
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
                              "Register",
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
                  key: formKey,
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
                    controller: nameController,
                    validator: (val) => val == "" ? "Please enter a name!" : null,
                    cursorColor: Color(0xFF01579B),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Color(0xFF01579B),
                      ),
                      hintText: "Full Name",
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
                      hintText: "Email",
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
                    controller: phoneController,
                    validator: (val) => val == "" ? "Please enter a valid phone number!" : null,

                    cursorColor: Color(0xFF01579B),
                    decoration: InputDecoration(
                      focusColor: Color(0xFF01579B),
                      icon: Icon(
                        Icons.phone,
                        color: Color(0xFF01579B),
                      ),
                      hintText: "Phone Number",
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
                    validator: (val) => val == "" ? "Please enter a password!" : null,

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
                    controller: confirmPassController,
                    validator: (val) {
                if (val!.isEmpty) {
                  return 'Please confirm your password';
                }
                    
                 (Val) => val == passwordController ? "Password doesn't match" : null;
                 return null;

                 },
                    


                    cursorColor: Color(0xFF01579B),
                    decoration: InputDecoration(
                      focusColor: Color(0xFF01579B),
                      icon: Icon(
                        Icons.vpn_key,
                        color: Color(0xFF01579B),
                      ),
                      hintText: "Confirm Password",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),


                    ],
                  ),
                ),

                
                GestureDetector(
                  onTap: () {

                    if(formKey.currentState!.validate())
                    {
                      validateUserEmail();

                    }
                    
                    
                    
                    // Write Click Listener Code Here.
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
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
                      "REGISTER",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                ),

                
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already Have An Account ?  "),
                      GestureDetector(
                        // ignore: prefer_const_constructors
                        child: Text(
                          "Login Now",
                          style: TextStyle(
                              color: Color(0xFF01579B)
                          ),
                        ),
                        onTap: () {
                          // Write Tap Code Here.
                          Navigator.pop(context);
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


