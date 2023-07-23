import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  //ใช้ในการวาดหน้าจอ
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int numdif = 0;
  int numdif2 = 0;

  static const List<String> quotesList = [

    'กุหลาบยังมีหนาม ผู้หญิงงามต้องมีพุง',
    'ไม่กล้าไปเติมเต็มใครหรอก ขนาดตัวเองยังไม่เต็มเลย',
    'Sundayอ่ะวันอาทิตย์ นอนอีกนิดวันจริงแล้วหรอ',
    'ถ้าเธอชอบอะไรน่ารักๆ ก็ต้องเป็นเราแล้วแหละ',
    'ดึงหน้าพี่ไม่ชอบ แต่ถ้าดึงไปกอดอันนี้ไม่ว่ากันค้าบบบ',
  ];
  static const List<Color> colorList =[
    Colors.pink,Colors.orange,Colors.teal,Colors.green,Colors.blue,
  ];

  var quote = quotesList[0];
  var colors = colorList[0];

  void handleClickGo(){
    setState(() {
      var rand =Random();
      var rand2 = Random();
      var randIndex=0;
      var randIndex2=0;
      while(true){
        randIndex = rand.nextInt(quotesList.length);
        if(randIndex!=numdif){
          break;
        }
      }
      while(true){
        randIndex2 = rand2.nextInt(colorList.length);
        if(randIndex2!=numdif2){
          break;
        }
      }
      quote = quotesList[randIndex];
      numdif=randIndex;
      colors = colorList[randIndex2];
      numdif2 = randIndex2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('คำคม/แคปชั่นกวนๆ')),
      floatingActionButton: FloatingActionButton(
        child : Text('GO'),
        onPressed: handleClickGo,
      ),
      body: Center(
        child: Text(quote,
          style: TextStyle(
              color: colors,
              fontSize: 30,
              fontStyle : FontStyle.italic,
              fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}