import 'package:flutter/material.dart';
import 'package:planets_flutter_app/ui/home_page_body.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[400],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'treva',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 36.0),
        ),
        flexibleSpace: Container(
          //flexibleSpace : 최대높이
          decoration: BoxDecoration(
              //컨테이너 배경 꾸미기
              gradient: LinearGradient(
                  //라인 색상 전환. 2가지의 색상을 받는다
                  begin: Alignment.topLeft, //컬러 시작점
                  end: Alignment.topRight, //컬러 끝나는점
                  colors: <Color>[
                //입맛대로 Colors.색상 해도 상관없음
                Color(0xFF3366FF),
                Color(0xFF00CCFF)
              ])),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          HomePageBody(),
        ],
      ),
    );
  }
}
