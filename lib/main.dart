import 'package:aplicacion_prueba/src/ui/pages/cuarta_pagina.dart';
import 'package:aplicacion_prueba/src/ui/pages/primera_pagina.dart';
import 'package:aplicacion_prueba/src/ui/pages/segunda_pagina.dart';
import 'package:aplicacion_prueba/src/ui/pages/tercera_pagina.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  int controlador;

  List<Widget> pantallas = [
    PrimeraPagina(),
    SegundaPagina(),
    TerceraPagina(),
  ];

  TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    controlador = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Guia de estilos
    return MaterialApp(
      routes: {
        CuartaPagina.CUARTA_PAGINA_RUTA: (context) => CuartaPagina(),
      },
      title: 'Flutter Demo',
      //Adicion de temas a la aplicacion
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        //Body sera el cuerpo de la aplicacion
        body: TabBarView(
          children: pantallas,
          controller: _controller,
        ),
        //Boton de accion flotante (parte inferior derecha)
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.edit),
        ),
        //Appbar (header o cavecera)
        appBar: AppBar(
          title: Text("Mi primera aplicacion"),
          bottom: TabBar(
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _controller.index,
          onTap: (value) {
            setState(() {
              _controller.animateTo(value);
            });
          },
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
