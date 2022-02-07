import 'package:flutter/material.dart';

import 'shopping_cart.dart';
class HomePage extends StatefulWidget {
  // const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
          onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => ShoppingCart(),)
                );
          }, 
          icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: SingleChildScrollView(
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height*0.1,),
            Text("Welcome To Home Page"),
            SizedBox(height: size.height*0.1,),
            Container(
              margin: EdgeInsets.only(left: size.width*0.07,right: size.width*0.07),
              height: size.height,
              width: size.width*0.9,
              child: GridView.count(
                crossAxisCount: (size.width/300).toInt(),
                children: List.generate(100, (index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    // height: size.height*0.03,
                    // width: size.width*0.03,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        // borderRadius:BorderRadius.circular(20)
                        
                    ),
                    child: Center(
                      child: Text(
                        'Item $index',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  );
                }),
                ),
            )
      
              
          ],
        ),
      ),
      
    );
  }
}