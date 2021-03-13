import 'dart:convert';

import 'package:aplicacion_prueba/src/ui/pages/cuarta_pagina.dart';
import 'package:aplicacion_prueba/src/ui/pages/primera_pagina.dart';
import 'package:aplicacion_prueba/src/ui/pages/segunda_pagina.dart';
import 'package:aplicacion_prueba/src/ui/pages/tercera_pagina.dart';
import 'package:aplicacion_prueba/src/ui/widgets/loading_widget/loading_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

//Scaffold Key
GlobalKey<ScaffoldState> homeState = GlobalKey<ScaffoldState>();

//ticker provider nos permitira sincronizar los estados dentro de nuestra aplicacion
//en este caso se utilizara en el controlador del tab bar
class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  int controlador;

  //lista de paginas que se utilizara en el cuerpo de la aplicacion
  List<Widget> pantallas = [
    PrimeraPagina(),
    SegundaPagina(),
    TerceraPagina(),
  ];

  //controlador del tabbar
  TabController _controller;

  final customIcon = IconData(0xe900,fontFamily: 'CustomFont');
  Map<String,dynamic> json = Map<String,dynamic>();
  String titulo;

  void obtenerJson()async{
    json = await jsonDecode(await DefaultAssetBundle.of(context).loadString("assets/nombres.json"));
    setState(() {
      titulo = json["nombre"];
    });
  }

  @override
  void initState() {
    //al inicializar el controlador asignamos la propiedad vsync la cual sera utilizada en el mixin
    _controller = TabController(length: 3, vsync: this);
    controlador = 0;
    titulo = "Mi primera aplicacion";
    super.initState();
    obtenerJson();
  }

  @override
  Widget build(BuildContext context) {
    //Guia de estilos
    return MaterialApp(
      //podemos asignar las rutas nombradas en MaterialApp para tener un control mas sencillo de las rutas de la app
      routes: {
        //Ruta de la cuarta pagina que retorna su Widget o clase asignada
        CuartaPagina.CUARTA_PAGINA_RUTA: (context) => CuartaPagina(),
      },
      title: 'Flutter Demo',
      //Adicion de temas a la aplicacion
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme
        ),
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        key: homeState,
        //TabBarView administra las pantallas mediante la fisica del arrastrado de izquierda a derecha
        body: TabBarView(
          children: pantallas,
          //Se debe asignar el controlador tanto al tab bar como al tabbarview
          controller: _controller,
        ),
        //Boton de accion flotante (parte inferior derecha)
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            LoadingWidgetController.instance.loading();
            LoadingWidgetController.instance.changeText("Se activo en FAB");
          },
          child: Icon(customIcon),
        ),
        //Appbar (header o cavecera)
        appBar: AppBar(
          title: Text(titulo),
          //bottom es un widget que se posicionara en la parte inferior del app bar
          //generalmente es otro appbar o un tabbar
          bottom: TabBar(
            //tab bar retorna un valor asignado o picker del numero de tab que fue presionado
            onTap: (value) {
              setState(() {
                controlador = value;
              });
            },
            controller: _controller,
            tabs: [
              Tab(text: "PRIMERA", icon: Icon(Icons.home)),
              Tab(text: "SEGUNDA", icon: Icon(Icons.hotel_rounded)),
              Tab(text: "TERCERA", icon: Icon(Icons.android))
            ],
          ),
        ),
        //drawer es un menu que se encuentra oculto en la parte izquierda de la pantalla
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                DrawerHeader(
                    margin: EdgeInsets.all(0),
                    padding: EdgeInsets.all(0),
                    child: Container(
                        margin: const EdgeInsets.all(0), color: Colors.red)),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Primera"),
                  onTap: () {
                    setState(() {
                      _controller.animateTo(0);
                    });
                    //Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.hotel_rounded),
                  title: Text("Segunda"),
                  onTap: () {
                    setState(() {
                      _controller.animateTo(1);
                    });
                    //Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.android),
                  title: Text("Tercera"),
                  onTap: () {
                    setState(() {
                      _controller.animateTo(2);
                    });
                    //Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ),
        //bottom navigation bar es un menu que se ubica en la parte inferior de la pantalla
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _controller.index,
          //al igual que tab bar retorna el valor numerico del elemento en el que se presiono
          onTap: (value) {
            setState(() {
              //en este caso indicaremos a nuestro tab bar que navegue hacia el valor de la pantalla
              _controller.animateTo(value);
            });
          },
          //items del bottom navigation bar 
          items: [
            BottomNavigationBarItem(
              label: "Primera",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Segunda",
              icon: Icon(Icons.hotel_rounded),
            ),
            BottomNavigationBarItem(
              label: "Tercera",
              icon: Icon(Icons.android),
            )
          ],
        ),
      ),
    );
  }
}
//Dart
//Herencia y Clases Abstractas

// extends (Herencia) = Agrega todas las props. del padre al hijo
// implements (Abstractas) = Agrega todas las props. del padre al hijo

// with (Mixins) = Agrega algunas de las props. del padre al hijo
