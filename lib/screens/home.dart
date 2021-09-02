import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/widgets/left_bar.dart';
import 'package:bmi_calculator_app/widgets/right_bar.dart';
import 'package:bmi_calculator_app/constants/app_constants.dart';

class HomeScreen extends StatefulWidget {
  

  @override
  _HomeScreenState createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = " ";
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
        
          style: TextStyle(
            fontSize: 30,
            color: Colors.yellow, 
            fontWeight: FontWeight.bold,
            ),
          
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.black12,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                width: 130,
                child: TextField(
                  controller: _heightController,
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue, 
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Height",
                    hintStyle: TextStyle(
                      fontSize: 35,
                       fontWeight: FontWeight.w400,
                       color: Colors.white.withOpacity(.8)
                       ),
                    ),
                  ),
                ),
                Container(
                width: 130,
                child: TextField(
                  controller: _weightController,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue, 
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Weight",
                    hintStyle: TextStyle(
                      fontSize: 38,
                       fontWeight: FontWeight.w400,
                       color: Colors.white.withOpacity(.8)
                       ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: (){
                  double _h = double.parse(_heightController.text);
                  double _w = double.parse(_weightController.text);
                  setState(() {
                    _bmiResult = _w / (_h * _h);
                    if(_bmiResult > 2.5){
                      _textResult = "You\'re over weight";
                    }else if(_bmiResult >= 1.85 && _bmiResult <= 2.5){
                      _textResult = "You have normal weight"; 
                    }else{
                      _textResult = "You\'re under weight";
                    }
                  });
              },
              child: Container(
                child: Text(
                  "Calculate",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    backgroundColor: Colors.yellow.withOpacity(.3)
                  
                  ),
                  ),
              ),
            ),
            SizedBox(height: 50,),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 100,
                  color: Colors.blue,
                ),
              ),
            ),
             Visibility(
               visible: _textResult.isNotEmpty,
               child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade200,
                  ),
                  ),
                         ),
             ),
            Container(
              
              padding: EdgeInsets.only(left:35,right:35, top:10, bottom: 10),
              
              child: Image.asset(
                'assets/bm.jpg',
                height: 175,
              
                ),
             
            ),
             Container(
                child: Text(
                  "App by Sasini Caldera:)",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  
                  ),
                  ),
              ),
  
          ],
            
          ),
          
          ),
          
    );
  }

}