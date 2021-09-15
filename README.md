# timetable  app

Simple app to view timetable.

## Basic instructions

You need to have android studio installed along with flutter to build this application.

If you just want to check out a preview , pre built apk packages are located in `..\build\app\outputs\flutter-apk`

## How to modify 

1. Open ../lib/pages/conditional_tt.dart and ../lib/pages/time_table.dart

2. In conditional_tt, modify the following code (line 8 onwards) only between the comments.

3. ```
   //Only modify these lines to change the timetable according to your needs
   //start_________________________________________________________________________________________________________________________________
   final List<String> mon= ['9:00AM-9:50AM ➔ French','10:00AM-12:50PM ➔ DBMS Lab','❖','1:30PM-2:20PM ➔ DCCN','2:30PM-3:20PM ➔ DCCN'];
   final List<String> tue= ['9:00AM-9:50AM ➔ DBMS','10:00AM-10:50AM ➔ French','11:00AM-11:50AM ➔ SE','12:00PM-12:50PM ➔ FLAT','❖','1:30PM-4:20PM ➔ DCCN Lab'];
   final List<String> wed= ['9:00AM-9:50AM ➔ DBMS','10:00AM-10:50AM ➔ French','11:00AM-11:50AM ➔ SC/CC','12:00PM-12:50PM ➔ SE','❖','1:30PM-4:20PM ➔ SK Lab'];
   final List<String> thu= ['9:00AM-9:50AM ➔ SC/CC','10:00AM-10:50AM ➔ DBMS','11:00AM-11:50AM ➔ SE','12:00PM-12:50PM ➔ FLAT','❖','1:30PM-4:20PM ➔ SE Lab'];
   final List<String> fri= ['9:00AM-9:50AM ➔ DCCN','10:00AM-10:50AM ➔ DCCN','11:00AM-11:50AM ➔ SC/CC','12:00PM-12:50PM ➔ FLAT'];
   //final List<String> sat= [''];
   //end_________________________________________________________________________________________________________________________________
   ```

4. In time_table , modify the following code only between the comments

5. ```
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
   ```

6. Now, to preview changes, you can press run .
7. To finally get a fully built apk, open terminal and type `flutter build apk`. You will obtain an apk called `apk-release` in the following location: `..\build\app\outputs\flutter-apk`
