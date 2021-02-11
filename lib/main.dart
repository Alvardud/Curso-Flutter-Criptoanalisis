import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //Arbol
  //Widget Padre
  //    Widget Hijos

  //Widget
  // - Contenido (String, int,.., Widget)
  // - Comportamiento (Estados: estaticos, dinamicos)
  // - Renderizado (renderizados estaticos, renderizados dinamicos)


  //inicial
  //container
  //center
  //text

  //Organizacion y Estructuracion de widgets
  //Column
  //Row
  //Stack

  //SafeArea => utilizar el area segura de la pantalla del dispositivo

  //Decoraciones
  //BoxDecoration, padding, borderradius

  //eventos
  //GestureDetector

  void doblePresionado()=>print("presionado dos veces");
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                print("presionado una sola vez");
              },
              onDoubleTap: doblePresionado,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16)
                ),
                height: 100,
                //child: Center(
                  child: Text(
                    "Hola mundo",style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30,
                      decoration: TextDecoration.none
                  //),
                  ),
                ),
              ),
            ),
            Text(
              "Hola mundo",style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                decoration: TextDecoration.none
            ),
            ),
          ],
        ),
      ),
      color: Colors.green,
    );
  }
}

/*
* Center(
        child: Text(
          "Hola mundo",style: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.none
        ),
        ),
      ),*/
