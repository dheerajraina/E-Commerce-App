import 'package:ecommerce_app/screens/home_screen.dart';
import 'package:ecommerce_app/screens/register_page.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart';

import 'package:ecommerce_app/services/api_services.dart';
class LoginPage extends StatefulWidget {
  LoginPage({ Key? key }) : super(key: key);

   String username='';
  String password='';
  bool logged=false;
  
  LoginPage._instantiate();

  static final LoginPage instance = LoginPage._instantiate();

 

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String username='';
  String password='';
  bool authentication=false;

  bool loginBtn=false;

  
  
  auth() async{
    var correct=await APIServices.instance.userAuthentication(username, password);

    // print("correct $correct");
    
    // return  correct? true :false; 
    // print(correct);
    // // authentication=correct;
    setState(() {
      authentication= correct;
      // loginBtn=!loginBtn;
    });
    
    //  print("authentication  $authentication");
  }
  

 
  
  @override
  Widget build(BuildContext context) {
  //   if(loginBtn){

  //       auth();
  //     //  setState(() {
  //     //    loginBtn=false;
  //     //  });
  //     // loginBtn=false;
  // }
    var size=MediaQuery.of(context).size;

    


    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          

          Container(
            margin: EdgeInsets.only(top:size.height*0.2,left: size.width*0.03, right: size.width*0.03),
            child: TextField(
              style: TextStyle(
                fontSize: size.width*0.05,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                letterSpacing: size.width*0.005,
              ),
              onChanged: (val){
                setState(() {
                  username=val;
                  
                });
              },
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
            margin: EdgeInsets.only(top:size.height*0.05,left: size.width*0.03, right: size.width*0.03),
            child: TextField(
              style: TextStyle(
                fontSize: size.width*0.05,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                letterSpacing: size.width*0.005,
              ),
              onChanged: (val){
                setState(() {
                  password=val;
                });
              },

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

          InkWell(
            onTap: (){

                // setState(() {
                //   // loginBtn=true;
                //   auth
                  
                // });

                // auth() ;
                
              auth()  ;
              // print("auth $auth()");
             
              // print(username+""+password) ; 
              // print(authentication);
              // print("authentication  $authentication");  
              if(authentication == false){
                
                showDialog(
                  context: context, 
                  builder: (context){
                    return AlertDialog(
                      title: Text('Username or Password Incorrect'),
                      contentPadding: EdgeInsets.all(20),

                      actions: [
                        TextButton(
                                            onPressed:() {
                                              Navigator.pop(context, 'Okay');
                                            }, 
                                          child: Text(
                                            "Okay",
                                            style: TextStyle(
                                              fontSize: size.width*0.05,
                                            ),
                                            ),
                                          ),
                      ],
                    );
                  });
              }if(authentication==true){

                
                  LoginPage.instance.username=username;
                  LoginPage.instance.password=password;
                  LoginPage.instance.logged=true;
               
                   
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context)=>HomePage()
                    )
                  );
              }

              // setState(() {
              //   loginBtn=false;
              //   // authentication=false;
              // });
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
                  'Login',
                  style: TextStyle(

                    fontSize: size.width*0.08,
                    letterSpacing: size.width*0.01,

                  ),
                  ),
              ),
            ),

          ),

          TextButton(
            onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context)=>RegisterPage(),
                  ),
                );
            }, 
            child: Text(
              "Create Account",
              style: TextStyle(
                fontSize: size.width*0.05,
              ),

              ))
          
        ],
      ),
      
    );
  }
}



 
  