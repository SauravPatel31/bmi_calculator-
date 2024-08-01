
import 'dart:math';

import 'package:flutter/material.dart';

class Bmi3 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return BmiState();
  }
}
class BmiState extends State<StatefulWidget>{
  TextEditingController weightcontroller = TextEditingController();
  TextEditingController featcontroller = TextEditingController();
  TextEditingController inchontroller = TextEditingController();
  Color mycolor = Colors.white;
  Image myimg=Image.asset("assets/images/white.png",fit: BoxFit.cover,);
  String bmi="";
  String resulat="";
  num? yourbmi;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: mycolor,
     appBar: AppBar(
       title: Text("BMI"),
     ),
     body: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 80),
       child: SingleChildScrollView(
         child: Column(
           children: [
             TextField(
               controller: weightcontroller,
               keyboardType: TextInputType.number,
               decoration: InputDecoration(
                 border: OutlineInputBorder(
                   borderSide: BorderSide(
                     width: 2,
                   ),
                   borderRadius: BorderRadius.circular(15)
                 ),
                 hintText: "Enter Your Weight...",
                 labelText: "Weight"
               ),
             ),
             SizedBox(height: 15,),
             TextField(
               controller: featcontroller,
               keyboardType: TextInputType.number,
               decoration: InputDecoration(
                   border: OutlineInputBorder(
                       borderSide: BorderSide(
                         width: 2,
                       ),
                       borderRadius: BorderRadius.circular(15)
                   ),
                   hintText: "Enter Your Height in Feat...",
                   labelText: "Height in Feat"
               ),
             ),
             SizedBox(height: 15,),
             TextField(
               controller: inchontroller,
               keyboardType: TextInputType.number,
               decoration: InputDecoration(
                   border: OutlineInputBorder(
                       borderSide: BorderSide(
                         width: 2,
                       ),
                       borderRadius: BorderRadius.circular(15)
                   ),
                   hintText: "Enter Your Height in inch...",
                   labelText: "Height in inch"
               ),
             ),
             SizedBox(height: 15,),
             SizedBox(
                 width: double.infinity,
                 child: ElevatedButton(onPressed: (){
                   if(weightcontroller.text!=""&&featcontroller.text!=""&&inchontroller.text!="")
                 {
                   num user_weight = num.parse(weightcontroller.text.toString());
                   num user_feat = num.parse(featcontroller.text.toString());
                   num user_inch = num.parse(inchontroller.text.toString());
         
                   num totalinch = user_feat*12;
                   num totalcm=totalinch*2.54;
                   num totalmiter = totalcm/100;
                   yourbmi = user_weight/pow(totalmiter, 2);
                   bmi="$yourbmi";
                   if(yourbmi!<18){
                     mycolor=Colors.yellow;
                     resulat="You Are Under Weight";
                     myimg=Image.asset("assets/images/underW.png");
                     
         
                   }
                   else if(yourbmi!>25){
                     mycolor=Colors.red;
                     resulat="You Are Over Weight";
                     myimg=Image.asset("assets/images/overW.png");
                   }
                   else{
                     mycolor=Colors.green;
                     resulat="You Are Healthy";
                     myimg=Image.asset("assets/images/healthy.png");
                   }
                 }
         
                   else{
                     bmi="please Fill all requred Fields";
         
                   }
                  setState(() {
         
                  });
         
                 }, child: Text("Check Your B.M.I"))),
             SizedBox(height: 15,),
             Text("Your BMI Is:-$bmi",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
             SizedBox(
               height: 10,
             ),
             Text(resulat,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
             SizedBox(height: 15,),
             SizedBox(
               width: 150,
               height: 150,
               child: myimg,
             )
             
           ],
         ),
       ),
     ),
   );
  }

}