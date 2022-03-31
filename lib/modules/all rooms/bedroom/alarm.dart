import 'package:beginning_app/modules/all%20rooms/bedroom/bedroom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alarm extends StatefulWidget {
  const Alarm({Key? key}) : super(key: key);
  @override
  State<Alarm> createState() => _AlarmState();

}


class _AlarmState extends State<Alarm> {
  @override
  bool val1 = true;
  bool val2 = true;
  onChangedFunction1(bool newValue1){
    setState(() {
      val1 = newValue1;
    });
  }
  onChangedFunction2(bool newValue2){
    setState(() {
      val2 = newValue2;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 260.0,
                    height: 140.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(300),
                        bottomRight: Radius.circular(300),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      end: 300.0,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) =>  bedroom()),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 35.0,
                        color: Colors.blueGrey[800],
                      ),
                    ),
                  ),
                  Text(
                    'Alarm Clock',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Stack(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: 350,
                        height: 400,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0,),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30.0,
                      left: 130.0,
                      child: Stack(
                        children: [
                          Text(
                            'Alarm Clock',
                            maxLines: 1,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:  Color(hexColor("#264653")),
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 120.0,
                      left: 40.0,
                      child: Stack(
                        children: [
                          Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(15.0,),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.0,),
                                    ),
                                    child: Icon(
                                      Icons.alarm,
                                      color: Colors.amber,
                                      size: 20.0,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      customSwitch(
                                          'On', val1, onChangedFunction1
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                    Positioned(
                      top: 185.0,
                      left: 40.0,
                      child: Stack(
                        children: [
                          Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(15.0,),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.0,),
                                    ),
                                    child: Icon(
                                      Icons.alarm,
                                      color: Colors.amber,
                                      size: 20.0,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      customSwitch(
                                          'Off', val2, onChangedFunction2
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                    Positioned(
                      top: 350,
                      left: 170,
                      child: Stack(
                        children: [
                          Center(
                            child: FloatingActionButton(
                              backgroundColor: Colors.amber,
                              onPressed: (){
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                  title: Center(
                                  child: Text(
                                  'Set Alarm',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:  Color(hexColor("#264653")),
                                    fontSize: 20.0,
                                  ),
                                ),
                                ),
                                content: Stack(
                                children: [
                                Container(
                                width: 160.0,
                                height: 220.0,
                                ),
                                ],),
                                ));
                              },
                              child: Icon(
                                Icons.add,
                                size: 30.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




Widget customSwitch(String text, bool val, Function onChangedMethod){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical:0,),
    child: Row(
      children:[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text, style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          ),
        ),
        CupertinoSwitch(
            value: val,
            trackColor: Colors.white70,
            activeColor: Colors.blueGrey,
            onChanged: (newValue)
            {
              onChangedMethod(newValue);
            }
        )
      ],
    ),
  );
}

hexColor(String colorhexcode) {
  String colornew = '0xff' + colorhexcode;
  colornew = colornew.replaceAll('#', '');
  int colorint = int.parse(colornew);
  return colorint;}