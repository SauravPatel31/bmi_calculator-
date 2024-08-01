import 'dart:math';

import 'package:flutter/material.dart';

class BmiPage extends StatefulWidget{
  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  TextEditingController agecontroller = TextEditingController();
  TextEditingController heightcontroller = TextEditingController();
  TextEditingController weightcontroller = TextEditingController();
  num? yourbmi;
  String bmi="0";
  String resulat="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("B.M.I",style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w700),),
        backgroundColor: Color(0xff11A286),
      ),
      body: Center(
        child: SizedBox(
          width: 600,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: 250,
                  height:250 ,
                  decoration: BoxDecoration(
                      image:  DecorationImage(image: AssetImage("assets/icons/heart.png"))
                  ),
                  child: Center(child: Text("$bmi",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 45,color: Colors.red),)),
                ),
              ),
              // Expanded(child: Image.asset("assets/icons/heart.png",width:200,color: Color(0xffE97262),)),
              ///Only Text
              Text("$resulat",style: TextStyle(color: Color(0xff11A286),fontSize: 25,fontWeight: FontWeight.w400),),
              SizedBox(height: 20,),
              ///Gender...
              Container(
                width: double.infinity,
                // color: Colors.indigo,
                padding: EdgeInsets.only(top: 0,bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text("Male",style:TextStyle(fontWeight: FontWeight.w600),),
                        Icon(Icons.male ,size: 65,color: Color(0xffC2E4F2),)
                      ],
                    ),
                    Column(
                      children: [
                        Text("Female",style: TextStyle(fontWeight: FontWeight.w600),),
                        Icon(Icons.female,size: 65,color: Color(0xffD7D8D7),)
                      ],
                    )
                  ],
                ),
              ),
              ///Details Age,Height,Weight...
              SizedBox(
                width: double.infinity,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ///Age...
                    Column(
                      children: [
                        Text("Age",style: TextStyle(color: Color(0xffC2C6C9))),
                        SizedBox(
                            width: 60,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: agecontroller,
                              keyboardType: TextInputType.number,

                            ))
                      ],
                    ),
                    ///Height...
                    Column(
                      children: [
                        Text("Height",style: TextStyle(color: Color(0xffC2C6C9)),),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                              border: Border.symmetric(
                                  vertical:BorderSide(
                                      width: 1,
                                      color: Color(0xffC2C6C9)
                                  )
                              )
                          ),
                          child:  SizedBox(
                              width: 60,
                              child: TextField(
                                textAlign: TextAlign.center,
                                controller: heightcontroller,
                                keyboardType: TextInputType.number,

                              )),)
                      ],
                    ),
                    ///Weight..
                    Column(
                      children: [
                        Text("Weight",style: TextStyle(color: Color(0xffC2C6C9))),
                        SizedBox(
                            width: 60,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: weightcontroller,
                              keyboardType: TextInputType.number,

                            )),

                      ],
                    )

                  ],
                ),
              ),
              ///BMI Calculate Button...
              InkWell(
                onTap: (){
                  if(heightcontroller.text!=""&&weightcontroller!=""){
                    num userheight =num.parse(heightcontroller.text.toString());
                    num userweight =num.parse(weightcontroller.text.toString());

                    num totalmiter=userheight/100;
                    yourbmi = userweight/pow(totalmiter, 2);
                    bmi= "${yourbmi?.toStringAsFixed(2)}";

                    if(yourbmi!<18){
                      resulat="Under Weight";
                    }
                    else if(yourbmi!>25){
                      resulat="Over Weight";
                    }
                    else{
                      resulat="Healthy";
                    }

                  }
                  else{
                    resulat="Please Enter Your Weight or Height!!";
                  }
                  setState(() {

                  });
                },
                child: Container(
                  width: double.infinity,
                  color: Color(0xff88CFC7),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Calculate BMI",textAlign: TextAlign.center,style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.w600),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}