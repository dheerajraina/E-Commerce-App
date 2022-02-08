

import 'dart:convert';

import 'package:http/http.dart' as http;

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