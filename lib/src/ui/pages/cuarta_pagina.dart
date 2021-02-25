import 'package:flutter/material.dart';

class CuartaPagina extends StatelessWidget {

  final String element;
  CuartaPagina({this.element});

  //ruta asignada a la cuarta pantalla
  static const CUARTA_PAGINA_RUTA = "cuarta_pagina";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nueva pantalla"),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text("Volver"),
            onPressed: (){
              //Navigator pop permitira retornar a la anterior ruta definida
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}