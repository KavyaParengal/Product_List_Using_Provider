
import 'package:flutter/foundation.dart';

class Provider_Class extends ChangeNotifier{

  List _image=[];
  List _name=[];
  List _price=[];
  List _unit=[];
  List get cart_image=>_image;
  List get cart_name=>_name;
  List get cart_price=>_price;
  List get cart_unit=>_unit;

  void add_to_cart(String image,String name,String price,String unit){
    final c_image=_image.contains(image);
    final c_name=_name.contains(name);
    final c_price=_price.contains(price);
    final c_unit=_unit.contains(unit);
    if(c_image){
      _image.remove(image);
      _name.remove(name);
      _price.remove(price);
      _unit.remove(unit);
    }
    else{
      _image.add(image);
      _name.add(name);
      _price.add(price);
      _unit.add(unit);
    }
    notifyListeners();
  }

}