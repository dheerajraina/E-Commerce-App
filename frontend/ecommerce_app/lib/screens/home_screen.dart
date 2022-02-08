import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'shopping_cart.dart';

import 'package:ecommerce_app/services/api_services.dart';
class HomePage extends StatefulWidget {
  // const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late List cataLog=[];

  void initState(){
    super.initState();

    toList(getHttp());
    // fetchCatalog();
  }

  void toList(data)async{
    var catalogList=await data;

    setState(() {
      cataLog= catalogList;
    });
    
    print(cataLog[0]);

  }
  
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;

    // print(cataLog[0]);
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
        scrollDirection: Axis.vertical,
        child: Column(
          
          
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height*0.1,),
            Text(
              "Catalog",
              style: TextStyle(
                // fontFamily: ' ',
                fontSize: size.width*0.05,
              ),
              ),
            SizedBox(height: size.height*0.1,),
            Container(
              margin: EdgeInsets.only(left: size.width*0.07,right: size.width*0.07,bottom: size.height*1),
              height: size.height,
              width: size.width*0.9,
              child: GridView.count(
                crossAxisCount: (size.width/300).toInt(),
                children: List.generate((cataLog.length)+1, (index) {
                  return index< cataLog.length?
                    Container(
                    margin: EdgeInsets.all(10),
                    // height: size.height*0.03,
                    // width: size.width*0.03,
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius:BorderRadius.circular(20)
                        
                    ),
                    child: Container(
                      
                      child: Column(
                        children:[
                          Row(
                            children: [
                              // SizedBox(
                              //   width: size.width*0.25,
                              // ),
                              SizedBox(
                                width: size.width*0.03,
                              ),
                              Text(
                                  '${cataLog[index]['name']}',
                                  style: TextStyle(
                                    fontSize: size.height*0.03,
                                    letterSpacing: size.width*0.001,
                                  ),
                                ),
                                
                            ],
                          ),
                          SizedBox(
                            height: size.height*0.01,
                          ),

                          Container(
                            width: size.width,
                            height: size.height*0.25,
                            decoration: BoxDecoration(
                              color: Colors.black26,

                            ),
                            child: Image.network(
                              
                              cataLog[index]['image'],
                              // fit: BoxFit.fill,
                            
                              ),
                          ),

                          SizedBox(
                            height: size.height*0.01,
                            child: DecoratedBox(decoration: BoxDecoration(color: Colors.black),),
                          ),

                          Row(
                            children: [

                              SizedBox(
                                width: size.width*0.02,
                                height: size.height*0.04,
                                
                              ),

                              Text(
                                "\$",
                                style: TextStyle(
                                  fontSize: size.height*0.02,
                                ),

                              ),
                              Text(
                            "${cataLog[index]['price']}",

                            style: TextStyle(
                                  fontSize: size.height*0.03,
                                ),
                          ),
                          
                          SizedBox(
                            width: size.width*0.2,
                          ),

                           InkWell(

                             onTap: (){
                               print("Added to cart ${cataLog[index]['id']}");
                             },
                            child: Container(
                              height: size.height*0.05,
                              width: size.width*0.3,
                            margin: EdgeInsets.only(top: size.height*0.003),
                              decoration:BoxDecoration(
                                color: Colors.blue[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child:Center(
                                child: Text(
                                  "Add to Cart",
                                  style: TextStyle(
                                    fontSize: size.width*0.04,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: size.width*0.005,
                                  ),
                                ),
                              ),
                            ),
                          ),
                         
                            ],
                          ),
                          
                        ]
                      ),
                    ),
                  ): SizedBox(
                    height: size.height*0.5,
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