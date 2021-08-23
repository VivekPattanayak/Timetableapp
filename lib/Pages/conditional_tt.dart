import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bit_timetable/Pages/time_table.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class CTT extends StatelessWidget {
  //Only modify these lines to change the timetable according to your needs
  //start_________________________________________________________________________________________________________________________________
  final List<String> mon= ['9:00AM-9:50AM ➔ French','10:00AM-12:50PM ➔ DBMS Lab','❖','1:30PM-2:20PM ➔ DCCN','2:30PM-3:20PM ➔ DCCN'];
  final List<String> tue= ['9:00AM-9:50AM ➔ DBMS','10:00AM-10:50AM ➔ French','11:00AM-11:50AM ➔ SE','12:00PM-12:50PM ➔ FLAT','❖','1:30PM-4:20PM ➔ DCCN Lab'];
  final List<String> wed= ['9:00AM-9:50AM ➔ DBMS','10:00AM-10:50AM ➔ French','11:00AM-11:50AM ➔ SC/CC','12:00PM-12:50PM ➔ SE','❖','1:30PM-4:20PM ➔ SK Lab'];
  final List<String> thu= ['9:00AM-9:50AM ➔ SC/CC','10:00AM-10:50AM ➔ DBMS','11:00AM-11:50AM ➔ SE','12:00PM-12:50PM ➔ FLAT','❖','1:30PM-4:20PM ➔ SE Lab'];
  final List<String> fri= ['9:00AM-9:50AM ➔ DCCN','10:00AM-10:50AM ➔ DCCN','11:00AM-11:50AM ➔ SC/CC','12:00PM-12:50PM ➔ FLAT'];
  //final List<String> sat= [''];
  //end_________________________________________________________________________________________________________________________________
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('EEEE');
  final String curr_day = formatter.format(now);
  static final DateFormat formatter2 = DateFormat('Hm');
  final String curr_time = formatter2.format(now);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: Colors.black,
        backgroundColor: const Color(0xFF212121),
        accentColor: Colors.white,
        accentIconTheme: IconThemeData(color: Colors.black),
        dividerColor: Colors.black12,
        fontFamily: 'ProductSans',
        brightness: Brightness.dark,
      ),
      title: 'BIT Timetable',
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text('MO-2021 (Sem V)'),
          actions: <Widget>[
          ],
            leading: new IconButton(
                icon: new Icon(Icons.info,color:Color(0xFFB6B2B8),),
                color: Color(0xFF26282b),
                onPressed: () => _scaffoldKey.currentState.openDrawer()),
        ),
        body: Center(
              child: ListView(
                children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
              child: Text('${curr_day}',textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Sherlyn',color: Color(0xFF809fff),fontSize: 85)),
              ),
              SizedBox(
                height: 5,
              ),
              //This is from a plugin, so commands are from the documentation
              DigitalClock(
                is24HourTimeFormat: false,
                showSecondsDigit : false,
                  hourMinuteDigitDecoration : BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(0)
                ),
                areaDecoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                hourMinuteDigitTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
                amPmDigitTextStyle: TextStyle(color: Color(0xFF809fff), fontWeight: FontWeight.bold),
              ),
              Text('════════════',textAlign: TextAlign.center,style: TextStyle(color:Color(0xFF4d4d4d),fontSize: 20)),
              if(curr_day=='Monday')
                Container(
                  child: ListView.builder(
                    itemCount: mon.length,
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true ,
                    itemBuilder: (context, index) => ListTile(
                      title: Text('${mon[index]}',textAlign: TextAlign.center,style: TextStyle(fontSize: 17)),
                    ),
                  ),
                ),
              if(curr_day=='Tuesday')
                Container(
                  child: ListView.builder(
                    itemCount: tue.length,
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true ,
                    itemBuilder: (context, index) => ListTile(
                      title: Text('${tue[index]}',textAlign: TextAlign.center,style: TextStyle(fontSize: 17)),
                    ),
                  ),
                ),
              if(curr_day=='Wednesday')
                Container(
                  child: ListView.builder(
                    itemCount: wed.length,
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true ,
                    itemBuilder: (context, index) => ListTile(
                      title: Text('${wed[index]}',textAlign: TextAlign.center,style: TextStyle(fontSize: 17)),
                    ),
                  ),
                ),
              if(curr_day=='Thursday')
                Container(
                  child: ListView.builder(
                    itemCount: thu.length,
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true ,
                    itemBuilder: (context, index) => ListTile(
                      title: Text('${thu[index]}',textAlign: TextAlign.center,style: TextStyle(fontSize: 17)),
                    ),
                  ),
                ),
              if(curr_day=='Friday')
                Container(
                  child: ListView.builder(
                    itemCount: fri.length,
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true ,
                    itemBuilder: (context, index) => ListTile(
                      title: Text('${fri[index]}',textAlign: TextAlign.center,style: TextStyle(fontSize: 17)),
                    ),
                  ),
                ),
              if(curr_day=='Saturday')
                Image.asset('assets/images/Sleeping.png'),
              if(curr_day=='Sunday')
                Image.asset('assets/images/Sleeping.png'),
            ],

          ),

        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => TimeTable(),
                transitionDuration: Duration(seconds: 0),
              ),
            );
          },
          child: Icon(Icons.sort_sharp,color:Color(0xFF000000),),
          backgroundColor: Color(0xFF809fff),
        ),
        drawer:
        Container(
          width: 250,
         child:Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 100.0 ,
              child: DrawerHeader(
                child: Text('About' , style:TextStyle(color: Colors.white, fontSize: 33 ) ,textAlign: TextAlign.center),
                decoration: BoxDecoration(

                  color: Color(0xFF000000),
                ),
              ),
              ),
              Image.asset('assets/images/sunset.png',width: 120, height: 120),
              ListTile(
                title: Text('\nApp Developed by:',style: TextStyle(fontSize: 15),textAlign: TextAlign.center),
                subtitle: Text('Vivek Pattanayak\nCSE K19',style: TextStyle(fontSize: 15),textAlign: TextAlign.center),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  //Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              InkWell(
                onTap: () => launch('https://github.com/VivekPattanayak'),
                child:Image.asset(
                  'assets/images/Github_logo.png',
                  width: 50,
                  height: 50,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              InkWell(
                onTap: () => launch('https://www.linkedin.com/in/vivek-pattanayak-8225021a0'),
                child:Image.asset(
                'assets/images/Linkedin_logo.png',
                width: 50,
                height: 50,
              ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}