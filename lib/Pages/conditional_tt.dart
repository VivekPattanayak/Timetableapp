import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bit_timetable/Pages/time_table.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class CTT extends StatelessWidget {
  //Only modify these lines to change the timetable according to your needs
  //start_________________________________________________________________________________________________________________________________
  final List<String> mon= ['9:00AM-9:50AM ➔ OE-1','10:00AM-12:50PM ➔ DBMS Lab','❖','1:30PM-2:20PM ➔ DCCN','2:30PM-3:20PM ➔ DCCN'];
  final List<String> tue= ['9:00AM-9:50AM ➔ DBMS','10:00AM-10:50AM ➔ OE-1','11:00AM-11:50AM ➔ SE','12:00PM-12:50PM ➔ FLAT','❖','1:30PM-4:20PM ➔ DCCN Lab'];
  final List<String> wed= ['9:00AM-9:50AM ➔ DBMS','10:00AM-10:50AM ➔ OE-1','11:00AM-11:50AM ➔ SC/CC','12:00PM-12:50PM ➔ SE','❖','1:30PM-4:20PM ➔ SK Lab'];
  final List<String> thu= ['9:00AM-9:50AM ➔ SC/CC','10:00AM-10:50AM ➔ DBMS','11:00AM-11:50AM ➔ SE','12:00PM-12:50PM ➔ FLAT','❖','1:30PM-4:20PM ➔ SE Lab'];
  final List<String> fri= ['9:00AM-9:50AM ➔ DCCN','10:00AM-10:50AM ➔ DCCN','11:00AM-11:50AM ➔ SC/CC','12:00PM-12:50PM ➔ FLAT'];
  //final List<String> sat= [''];

  final List<String> hol=["1 Jan\nNew Year's Day",'15 Jan\nMakar Sankranti','26 Jan\nRepublic Day','16 Feb\nBasant Panchami','11 Mar\nMaha Shivaratri','29-30 March\nHoli','2 Apr\nGood Friday','14 Apr\nDr B.R Ambedkar Jayanti','15 Apr\nSarhul','21 Apr\nRama Navami','25 Apr\nMahavir Jayanti','14 May\nEid-Ul-Fitr','26 May\nBuddha Purnima','12 Jul\nRath Yatra','21 Jul\nEid-Ul-Zoha','15 Aug\nIndependence day','19 Aug\nMuharram','30 Aug\nJanmashtami','17 Sep\nVishwakarma Puja/Karma','2 Oct\nGandhi Jayanti','11-15 Oct\nDurga Puja','19 Oct\nEid Milad-un-Nabi','4 Nov\nDeepawali','10 Nov\nChhath Puja','15 Nov\nBirsa Jayanti','19 Nov\nGuru Nanak Jayanti','25 Dec\nChristmas'];

  //end_________________________________________________________________________________________________________________________________

  static final DateTime now = DateTime.now();
  static final DateFormat f1 = DateFormat('EEEE');
  final String curr_day = f1.format(now);
  static final DateFormat f2 = DateFormat('d MMM y');
  final String mon_dt = f2.format(now);
  static final DateFormat f3 = DateFormat('MMM');
  final String Mon_name  = f3.format(now);



  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  ScrollController _scrollController = ScrollController();

  void scrollbymon(){
    final position = _scrollController.position.minScrollExtent;
    int a=0;
    //currently scrolling to nearest hol by month
    if(Mon_name=='Jan') a=0 ; if(Mon_name=='Feb') a=600 ; if(Mon_name=='Mar') a=800 ; if(Mon_name=='Apr') a=1200 ;
    if(Mon_name=='May') a=2200 ; if(Mon_name=='Jun') a=2600 ; if(Mon_name=='Jul') a=2600 ; if(Mon_name=='Aug') a=3000 ;
    if(Mon_name=='Sep') a=3600 ; if(Mon_name=='Oct') a=3800 ; if(Mon_name=='Nov') a=4400 ; if(Mon_name=='Dec') a=5200 ;
    //formula for a: no of hol before this month x 200
    _scrollController.animateTo(
      position+a,
      duration: Duration(seconds: 1),
      curve: Curves.easeOut,
    );
  }

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
                height: 10,
              ),
              //This is from a plugin, so commands are from the documentation

              Text('${mon_dt}',textAlign:TextAlign.center,style:TextStyle( fontSize:15,color: Colors.white)),

              SizedBox(
                height: 10,
              ),

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
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 24,
                ),
                amPmDigitTextStyle: TextStyle(color: Color(0xFF809fff),fontSize:13, fontWeight: FontWeight.bold),
              ),

              Text('_________________',textAlign: TextAlign.center,style: TextStyle(color:Color(0xFF4d4d4d),fontSize: 20)),
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

              Text('____________________',textAlign: TextAlign.center,style: TextStyle(fontSize:17.0, color:Color.fromRGBO(255, 255, 255, 0.1))),

              SizedBox(
                height: 30,
              ) ,

                InkWell(
                  onTap: () => scrollbymon(),
                  child: Text('Upcoming Holidays (Click)',textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w500,fontSize:17.0,color:Color(0xFF84f6c8))),
                ),

                Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                      height: 150,
                        child: ListView.builder(
                            controller: _scrollController,
                            scrollDirection: Axis.horizontal,
                            itemCount: hol.length,
                            itemBuilder: (context, index) {
                            return Container(
                              width: 200,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                color: Color.fromRGBO(242, 242, 242,0.1),
                                child: Container(
                                  child: Center(child: Text(hol[index].toString(), style: TextStyle(color: Colors.white, fontSize: 17.0),)),
                                ),
                              ),
                            );
                        }),
                ),

                  SizedBox(
                    height: 55,
                  ) ,

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