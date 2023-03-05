import 'package:bmicalci/calculation.dart';
import 'package:bmicalci/resultpage.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: "BMI Calculator",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: homepage(),
    );
  }
}
class homepage extends StatefulWidget{
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  void agedec(){
    if(bmiage>1){
    bmiage--;}

  }
  void ageinc(){
    if(bmiage<120){
    bmiage++;}
  }
  void changecolorm(){
    if(selectedgender=="male"){
      colorm=selected;
      colorf=unselected;

    }
  }
  void changecolorf(){
    if(selectedgender=="female"){
      colorf=selected;
      colorm=unselected;
    }
  }
  Color selected = Colors.black54;
  Color unselected=Colors.black38;
  Color colorm=Colors.black38;
  Color colorf=Colors.black38;
  double bmiheight=150;
  int bmiweight=50;
  int bmiage=20;
  String selectedgender = "male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        backgroundColor: Colors.black87,
        ),
      body: Container(

        width: double.infinity,
        color: Colors.black54,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [
                InkWell(
                  onTap: (){
                    selectedgender="male";
                    setState(() {
                      changecolorm();
                    });
                  },
                  child: Container(

                    height: 200,
                    width: 170,
                    color: colorm,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("MALE",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 25,color: Colors.white, ),),
                        Icon(Icons.male,size: 100,color: Colors.white,),
                      ],
                    )
                  ),
                ),
                InkWell(
                  onTap: (){
                    selectedgender="female";
                    setState(() {
                      changecolorf();
                    });
                  },
                  child: Container(

                    height: 200,
                    width: 170,
                    color: colorf,
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("FEMALE",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 25,color: Colors.white ),),
                        Icon(Icons.female,size: 100,color: Colors.white,),
                      ],
                    )
                  ),
                ),

              ],),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15,bottom: 15),
              child: Container(
                width: double.infinity,
                height: 159,
                color: Colors.black54,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("HEIGHT",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 25,color: Colors.white),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [

                        Text(bmiheight.toInt().toString(),style: TextStyle(fontSize: 60,color: Colors.white),),
                        Text("cm",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w600)),
                      ],
                    ),

                    Slider(value: bmiheight.toDouble(),min: 130.0,max: 220.0, onChanged: (double newvalue){
                      setState(() {
                        bmiheight=newvalue;
                      });
                    })
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [ Container(
                    height: 200,
                    width: 170,
                    color: Colors.black54,

                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("WEIGHT",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 25,color: Colors.white ),),
                        Text("$bmiweight",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w400,color: Colors.white),),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                              children : [ InkWell(
                                child: Container(
                                  child: Icon(Icons.remove,size: 50,color: Colors.white,),),
                                onTap: (){
                                  if(bmiweight>1){
                                    setState(() {
                                      bmiweight--;
                                    });
                                  }
                                },
                              ),

                                InkWell(child: Container(child: Icon(Icons.add,size: 50,color: Colors.white,)),
                                onTap: (){
                                  if(bmiweight<200){
                                    setState(() {
                                      bmiweight++;
                                    });
                                  }
                                },)]),
                      ],
                    )
                ),
                Container(
                    height: 200,
                    width: 170,
                    color: Colors.black54,

                    child:  Column(

                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        Text("AGE",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 25,color: Colors.white ),),
                        Text("$bmiage",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w400,color: Colors.white),),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                            children : [ InkWell(
                              child: Container(
                                child: Icon(Icons.remove,size: 50,color: Colors.white,),),
                              onTap: (){
                               setState(() {
                                 agedec();
                               });
                              },
                            ),

                          InkWell(child: Container(child: Icon(Icons.add,size: 50,color: Colors.white,)),
                          onTap: (){
                            setState(() {
                              ageinc();
                            });
                          },)]),
                      ],
                    )
                ),
                ],
              ),
            ),
            InkWell(
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.red,
                child: Center(child: Text("CALCULATE",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w700),)),
              ),
              onTap: (){
                Calculation cal= new Calculation( bmiheight,bmiweight);
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>resultpage(cal.cali(), cal.health(), cal.sugg())),);
              },
            )

          ],
        ),
      ),
    );
  }
}
