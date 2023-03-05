import 'dart:math';

import 'package:bmicalci/main.dart';
import 'package:flutter/cupertino.dart';
class Calculation {
   final double beight;
  final int bweight;

  Calculation(this.beight, this.bweight);
 double _bmi=0;
  String cali(){
    _bmi=bweight/pow(beight/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String health(){
    if(_bmi>=18 && _bmi<=25){
      return "HEALTHY";
    }
    else if(_bmi>25){
      return "OVERWEIGHT";
    }
    else{
      return "UNDERWEIGHT";
    }
  }
   String sugg(){
     if(_bmi>=18 && _bmi<=25){
       return "You are healthy keep exercise and take healthy diet.";
     }
     else if(_bmi>25){
       return "You are overweight keep more work out and avoid fast food.";
     }
     else{
       return "You are underweight eat more and healthy food.";
     }
   }


}