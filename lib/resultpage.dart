import 'package:bmicalci/calculation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmicalci/main.dart';
class resultpage extends StatelessWidget{
  resultpage(@required this.bmie,@required this.healthye,@required this.sugge);

  final String bmie;

  final String healthye;

  final String sugge;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text("RESULT"),backgroundColor: Colors.black87,),
     body: Container(color: Colors.black54,
       width: double.infinity,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,

         children: [
           Text("Your result..",style: TextStyle(fontSize: 45,fontWeight: FontWeight.w700,color: Colors.white),),
           Container(
             width: 400,
             height: 575,
             color: Colors.black87,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Text(healthye,style: TextStyle(fontSize: 35,fontWeight: FontWeight.w700,color: Colors.white)),
               Text(bmie,style: TextStyle(fontSize: 35,fontWeight: FontWeight.w700,color: Colors.white)),
             Text(sugge,style: TextStyle(fontSize: 45,fontWeight: FontWeight.w700,color: Colors.white))],
           ),)
           ,InkWell(
             child: Container(
               height: 50,
               width: double.infinity,
               color: Colors.red,
               child: Center(child: Text("RE-CALCULATE",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w700),)),
             ),
             onTap: (){
               Navigator.pop(context);
             },
           )
         ],
       ),
     ),
   );
  }
}