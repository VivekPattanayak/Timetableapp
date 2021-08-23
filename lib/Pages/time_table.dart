import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bit_timetable/Pages/conditional_tt.dart';

class TimeTable extends StatelessWidget {
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('EEEE');
  final String curr_day = formatter.format(now);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Color day_color(day_given){
        if(day_given==curr_day){
          return Color(0xFF84f6c8);
        }
        return Color(0xFF809fff);
  }
  @override
  Widget build(BuildContext context) {
    //Only modify these lines to change the timetable according to your needs
    //_________________________________________________________________________________________________________________________________
    final List<String> mon= ['9:00AM-9:50AM ➔ French\n10:00AM-12:50PM ➔ DBMS Lab\n❖\n1:30PM-2:20PM ➔ DCCN\n2:30PM-3:20PM ➔ DCCN'];
    final List<String> tue= ['9:00AM-9:50AM ➔ DBMS\n10:00AM-10:50AM ➔ French\n11:00AM-11:50AM ➔ SE\n12:00PM-12:50PM ➔ FLAT\n❖\n1:30PM-4:20PM ➔ DCCN Lab'];
    final List<String> wed= ['9:00AM-9:50AM ➔ DBMS\n10:00AM-10:50AM ➔ French\n11:00AM-11:50AM ➔ SC/CC\n12:00PM-12:50PM ➔ SE\n❖\n1:30PM-4:20PM ➔ SK Lab'];
    final List<String> thu= ['9:00AM-9:50AM ➔ SC/CC\n10:00AM-10:50AM ➔ DBMS\n11:00AM-11:50AM ➔ SE\n12:00PM-12:50PM ➔ FLAT\n❖\n1:30PM-4:20PM ➔ SE Lab'];
    final List<String> fri= ['9:00AM-9:50AM ➔ DCCN\n10:00AM-10:50AM ➔ DCCN\n11:00AM-11:50AM ➔ SC/CC\n12:00PM-12:50PM ➔ FLAT'];
    final List<String> sat= [''];
    //Do not try to implement them as separate elements, as the space between subjects will not be compact if done in that manner
    //_________________________________________________________________________________________________________________________________
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
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text('MO-2021 (Sem V)'),
            leading: new IconButton(
                icon: new Icon(Icons.info,color:Color(0xFFB6B2B8),),
                color: Color(0xFF1f1f1f),
                onPressed: () => _scaffoldKey.currentState.openDrawer()),
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 4,
              ),
              Center(
                child: Container(
                  width: 290,
                  child: Card(
                    color: Color(0xFF1a1a1a),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(13.0),
                      child : ListView(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        children: <Widget>[
                          Text('Monday',textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w500,color: day_color('Monday'),fontSize: 21)),
                          Container(
                            child: ListView.builder(
                              itemCount: mon.length,
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true ,
                              itemBuilder: (context, index) => ListTile(
                                title: Text('${mon[index]}',textAlign: TextAlign.center,style: TextStyle(fontSize:14)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 290,
                  child: Card(
                    color: Color(0xFF1a1a1a),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(13.0),
                      child : ListView(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        children: <Widget>[
                          Text('Tuesday',textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w500,color: day_color('Tuesday'),fontSize: 21)),
                          Container(
                            child: ListView.builder(
                              itemCount: tue.length,
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true ,
                              itemBuilder: (context, index) => ListTile(
                                title: Text('${tue[index]}',textAlign: TextAlign.center,style: TextStyle(fontSize:14)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 290,
                  child: Card(
                    color: Color(0xFF1a1a1a),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(13.0),
                      child : ListView(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        children: <Widget>[
                          Text('Wednesday',textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w500,color: day_color('Wednesday'),fontSize: 21)),
                          Container(
                            child: ListView.builder(
                              itemCount: wed.length,
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true ,
                              itemBuilder: (context, index) => ListTile(
                                title: Text('${wed[index]}',textAlign: TextAlign.center,style: TextStyle(fontSize:14)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 290,
                  child: Card(
                    color: Color(0xFF1a1a1a),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(13.0),
                      child : ListView(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        children: <Widget>[
                          Text('Thursday',textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w500,color: day_color('Thursday'),fontSize: 21)),
                          Container(
                            child: ListView.builder(
                              itemCount: thu.length,
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true ,
                              itemBuilder: (context, index) => ListTile(
                                title: Text('${thu[index]}',textAlign: TextAlign.center,style: TextStyle(fontSize:14)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 290,
                  child: Card(
                    color: Color(0xFF1a1a1a),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(13.0),
                      child : ListView(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        children: <Widget>[
                          Text('Friday',textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w500,color: day_color('Friday'),fontSize: 21)),
                          Container(
                            child: ListView.builder(
                              itemCount: fri.length,
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true ,
                              itemBuilder: (context, index) => ListTile(
                                title: Text('${fri[index]}',textAlign: TextAlign.center,style: TextStyle(fontSize:14)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],

          ),

        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => CTT(),
                transitionDuration: Duration(seconds: 0),
              ),
            );
          },
          child: Icon(Icons.north_west,color:Color(0xFF000000),),
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
                  title: Text('App Developed by:',style: TextStyle(fontSize: 15),textAlign: TextAlign.center),
                  subtitle: Text('Vivek Pattanayak\nCSE K19',style: TextStyle(fontSize: 15),textAlign: TextAlign.center),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
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