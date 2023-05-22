// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, avoid_web_libraries_in_flutter



import 'package:flutter/material.dart';




class Camera_Access extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}


class InitState extends State<Camera_Access>{
   @override
  Widget build(BuildContext context) => initWidget();

}


 Widget initWidget(){

  return Scaffold(
    appBar: AppBar(
        title: Text('Cameras'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             Container(
              width: 200,
              height: 200,
              margin: EdgeInsets.only(top: 20, left: 100),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 10, color: Colors.black),
                  borderRadius: BorderRadius.circular(15)),
              
            ),


            Container(
              width: 200,
              height: 200,
              margin: EdgeInsets.only(top: 140, left: 100),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 10, color: Colors.black),
                  borderRadius: BorderRadius.circular(15)),
              
            ),

             GestureDetector(
              onTap: () {
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


            /*Container(
              width: 200,
              height: 200,
              margin: EdgeInsets.only(top: 60, left: 100),

              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 10, color: Colors.black),
                  borderRadius: BorderRadius.circular(15)),
              
            ),*/



            
            

        ],

        


        )

      ),
  );
  
 }



