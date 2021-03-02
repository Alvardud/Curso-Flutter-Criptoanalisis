import 'package:aplicacion_prueba/src/core/models/persona_modelo.dart';
import 'package:flutter/material.dart';

class CuartaPaginaArgumentos{
  final String element;
  final Persona persona;
  CuartaPaginaArgumentos({this.element,this.persona});
}

class CuartaPagina extends StatelessWidget {

  final String element;
  final Persona persona;
  CuartaPagina({this.element,this.persona});

  //ruta asignada a la cuarta pantalla
  static const CUARTA_PAGINA_RUTA = "cuarta_pagina";

  @override
  Widget build(BuildContext context) {
    final CuartaPaginaArgumentos args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Nueva pantalla"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Nombre de la persona: ${args.persona.nombre}"),
          Text("Edad de la persona: ${args.persona.edad}"),
          //Espacios
          //Spacer(),
          //Padding(padding: EdgeInsets.all(16)),
          SizedBox(height: 16),
          Container(
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
        ],
      ),
    );
  }
}