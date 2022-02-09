import 'package:ecommerce_app/screens/home_screen.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top:size.width*0.05,left: size.width*0.03, right: size.width*0.03),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter Email',
                hintStyle: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: size.width*0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
            ),
          ),

          Container(
            margin: EdgeInsets.only(top:size.width*0.05,left: size.width*0.03, right: size.width*0.03),
            child: TextField(
              decoration: InputDecoration(
                hintText: ' Enter User Name',
                hintStyle: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: size.width*0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
            ),
          ),


          Container(
            margin: EdgeInsets.only(top:size.width*0.05,left: size.width*0.03, right: size.width*0.03),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: size.width*0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
            ),
          ),

          Container(
            margin: EdgeInsets.only(top:size.width*0.05,left: size.width*0.03, right: size.width*0.03),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter Your Name',
                hintStyle: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: size.width*0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
            ),
          ),
          InkWell(
            onTap: (){

                
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context)=>HomePage(),
                    )
                  );
              },

             

            child: Container(
              margin: EdgeInsets.only(top: size.height*0.1, ),
              width: size.width*0.4,
              height: size.width*0.15,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Register',
                  style: TextStyle(

                    fontSize: size.width*0.06,
                    letterSpacing: size.width*0.01,

                  ),
                  ),
              ),
            ),

          ),
        ],
      ),
      
    );
  }
}