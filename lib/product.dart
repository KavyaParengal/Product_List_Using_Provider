
import 'package:flutter/material.dart';
import 'package:product_list/provider/provider.dart';
import 'package:product_list/result.dart';
import 'package:provider/provider.dart';

class Product_List extends StatefulWidget {
  const Product_List({Key? key}) : super(key: key);

  @override
  State<Product_List> createState() => _Product_ListState();
}

class _Product_ListState extends State<Product_List> {

  List images=[
    'images/apple.png',
    'images/bananas.png',
    'images/grapes.png',
    'images/kiwi.png',
    'images/mango.png',
    'images/orange.png',
    'images/peach.png',
    'images/watermelon.png'
  ];
  List name=['Apple','Banana','Grapes','Kiwi','Mango','Orange','Peach','Water...'];
  List unit=['Kg','Doz','Kg','Pc','Doz','Doz','Doz','Kg',];
  List price=['20','10','8','40','30','15','35','25'];

  @override
  Widget build(BuildContext context) {

    final object= Provider.of<Provider_Class>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        centerTitle: true,
        actions: [Padding(padding: EdgeInsets.only(right: 12),
        child: IconButton(icon: Icon(Icons.shopping_cart,size: 30,),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Result_Cart()));
          },
        ),
        )
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
          itemCount: images.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 5),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*.113,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset(images[index],width: 90,height: 90,),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Name : ',style: TextStyle(fontSize: 16),),
                            Text(name[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Text('Unit : ',style: TextStyle(fontSize: 16),),
                            Text(unit[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Text('Price : \$ ',style: TextStyle(fontSize: 16),),
                            Text(price[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ElevatedButton(
                              onPressed: (){
                                object.add_to_cart(images[index], name[index], price[index], unit[index]);
                              },
                              child: Text('Add to Cart',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueGrey.shade900,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              fixedSize: Size(105, 27),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
