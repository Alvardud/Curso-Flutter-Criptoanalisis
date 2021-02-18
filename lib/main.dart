import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //Guia de estilos
    return MaterialApp(
      title: 'Flutter Demo',
      //Adicion de temas a la aplicacion
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        //Body sera el cuerpo de la aplicacion
        body: MyHomePage(),
        //Boton de accion flotante (parte inferior derecha)
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.edit),
        ),
        //Appbar (header o cavecera)
        appBar: AppBar(
          actions: [IconButton(onPressed: (){
            print("icono presionado");
          },icon: Icon(Icons.menu))],
          title: Text("Mi primera pantalla"),
        ),
      ),
    );
  }
}

class MiPrimerWidget extends StatelessWidget {

  String titulo;
  MiPrimerWidget({this.titulo});

  Widget texto(BuildContext context){
    return Text(
                    titulo,style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 30,
                      decoration: TextDecoration.none
                  ),
                );
  }

  @override
  Widget build(BuildContext context) {
    return texto(context);
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
                  child: MiPrimerWidget(titulo: "Mi primer widget")
              ),
            ),
            Text(
              "Hola mundo",style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                decoration: TextDecoration.none
            ),
            ),
            MiSegundoWidget(),
          ],
        ),
      ),
      color: Colors.green,
    );
  }
}

class MiSegundoWidget extends StatefulWidget {
  @override
  _MiSegundoWidgetState createState() => _MiSegundoWidgetState();
}

class _MiSegundoWidgetState extends State<MiSegundoWidget> {

  ///Stateless Widget => no contienen estados dinamicos (estaticos)
  ///
  ///Stateful Widget => contiene estado dinamico y a su vez, este se actualiza mediante
  /// setState
  ///y debe ser inicializado mediante
  /// initState
  /// 
  /// dispose
  /// didChangeDependencies
  /// 
  /// Atajos
  /// stle (Stateless)
  /// stful (Stateful)
  /// init (initstate)
  /// sets (setState) 

  bool encendido;

  @override
  void initState() {
    // se inicializa el estado
    super.initState();
    encendido = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 100,width: 100,color: encendido?Colors.red:Colors.blue),
            Container(height: 100,width: 100,color: !encendido?Colors.red:Colors.blue)
          ],
        ),
        GestureDetector(
          onTap: (){
            //se actualiza el estado
            setState(() {
              encendido = !encendido;
            });
          },
              child: Container(
            height: 70,
            width: 300,

            //hacemos referencia al tema mediante el contexto para poder acceder al color primario
            color: Theme.of(context).primaryColor,
            child: Center(child: Text("Cambiar",style: TextStyle(decoration: TextDecoration.none))),
          ),
        ),
      ],
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
