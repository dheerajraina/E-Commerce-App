

import 'dart:convert';

import 'package:http/http.dart' as http;

class APIServices{

  String user='';
  String pass='';
  bool logged=false;

  APIServices._instantiate();
  
  static final APIServices instance=APIServices._instantiate();


  // to fetch the list of items to be shown on the home page
 Future<List> getCatalog()async{
// 10.0.2.2
 final response =await http
        .get(Uri.parse('http://10.0.2.2:8000/products/'));

  
  if(response.statusCode==200){

    final data = await jsonDecode(response.body);

    // print(data);
    return data;

  }else{
    throw Exception('Failed to load data');
  }

}



Future userAuthentication(username,password) async{
    print(username+""+password);

    final response =await http
        .get(Uri.parse('http://10.0.2.2:8000/customerData/$username'));
    
    if(response.statusCode==200){

    final data = await jsonDecode(response.body);

    // print(data);

    if (password==data['password']){
      // print(password);
      
      logged=true;
      return true;
    }else{
      // print('Password Incorrect');
      user=username;
      pass=password;
      return false;
    }
    // return data;

  }else{
    throw Exception('Failed to load data');
  }

}

Future userRegistration(email,username,password,name) async{

//   {
//  "email":"dheerajraina@gmail.com",
//  "userName":"Dheeraj",
//      "password":"Rainadheeraj55",
//     "name":"Dheeraj Raina"
//  }

  var userData='{"email" : "$email", "userName":"$username" , "password" : "$password" ,"name" : "$name"}';


  var response =await http.post(
    Uri.parse("http://10.0.2.2:8000/add-customer/"),

    headers: <String ,String>{
      'Content-Type': 'application/json',
    },

    body:  userData,
  );
  print(response.body);
  return response.statusCode;
}



}
