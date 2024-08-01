
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiSecondPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
  return BmiSecondPageState();
  }
}

class BmiSecondPageState extends State<StatefulWidget>{
  TextEditingController agecontroller = TextEditingController();
  TextEditingController gendarcontroller = TextEditingController();
  TextEditingController heightcontroller = TextEditingController();
  TextEditingController weightcontroller = TextEditingController();
  Color mycolor = Colors.white;
  String result="";
  String bmi="";
  num? yourbmi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:mycolor,

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 50),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Result Show...
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("YOUR REASULAT",style: mytextstylebold(),),
                    Text("$bmi",style: TextStyle(fontSize: 51,fontWeight: FontWeight.w900),)
                  ],
                ),
               
                ///Some Text..
                Container(
                  width: 220,
                  // color: Colors.orange,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("$result",style:TextStyle(fontSize: 30,fontWeight: FontWeight.w900),),

                    ],
                  ),
                ),
                SizedBox(height: 50,),
                ///Details Enter Gender,Age,height,weight....
                Row(
                  children: [
                    ///Gander Text Field..
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///Gander Text Field..
                        Text("Gender",style: mytextstylebold(),),
                        SizedBox(
                            width: 100,
                            child: TextField(
                              controller: gendarcontroller,
                              decoration: InputDecoration(
                                  hintText: "Gender"
                              ),
                            ))
                      ],
                    ),
                    SizedBox(width: 50,),
                    ///Age Text Field..
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text("Age",style: mytextstylebold(),),
                        SizedBox(
                            width: 100,
                            child: TextField(
                              controller: agecontroller,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: "Age"
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 50,),
                ///Details Enter Height,Weight...
                Row(
                  children: [
                    ///Height Text Field..
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Height",style: mytextstylebold(),),
                        SizedBox(
                            width: 100,
                            child: TextField(
                              controller: heightcontroller,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: "Height"
                              ),
                            ))
                      ],
                    ),
                    SizedBox(width: 50,),
                    ///Weight Text Field..
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Weight",style: mytextstylebold(),),
                        SizedBox(
                            width: 100,
                            child: TextField(
                              controller: weightcontroller,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: "Weight"
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 50,),
                ///Calculate BMI Button...
                Center(
                  child: InkWell(
                    onTap: (){
                      if(gendarcontroller.text!=""&&agecontroller!=""&&heightcontroller!=""&&weightcontroller!=""){
                        num userheight = num.parse(heightcontroller.text.toString());
                        num userweight = num.parse(weightcontroller.text.toString());

                        num totalmiter = userheight/100;
                        yourbmi = userweight/pow(totalmiter, 2);
                        bmi="${yourbmi!.toStringAsFixed(2)}";
                        if(yourbmi!<18){
                          result="You are under weight";
                          mycolor = Color(0xff87B1E2);
                        }
                        else if(yourbmi!>25){
                          result="You are over weight";
                          mycolor = Color(0xffF58C8C);
                        }
                        else{
                          result="You are healthy";
                          mycolor= Color(0xffC1E899);
                        }
                      }
                      else{
                        result="All field are required !!";
                      }
                      // mycolor=Colors.green;
                      setState(() {

                      });

                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      width: 300,
                      decoration: BoxDecoration(
                          color: Color(0xff7877D3),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(child: Text("CALCULATE",style: TextStyle(fontSize: 16),)),
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle mytextstylebold(){
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
  }

}