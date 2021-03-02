import 'package:aplicacion_prueba/src/core/models/persona_modelo.dart';
import 'package:aplicacion_prueba/src/ui/pages/cuarta_pagina.dart';
import 'package:flutter/material.dart';

class PrimeraPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        //RaisedButton
        //FlatButton
        //OutlineButton

        child: RaisedButton(
          child: Text("Navegacion"),
          onPressed: () {
            //Navigator es el widget que permite navegar entre rutas
            //Para este caso navegamos utilizando MaterialPageRoute la cual contiene la animacion de navegacion y tambien asigna al arbol de widgets la nueva pantalla mediante builder
            /*Navigator.push(context, MaterialPageRoute(
              builder: (context){
                return CuartaPagina(element: "Hola",persona: personaEjemplo);
              }
            ));*/

            //Tambien podemos navegar hacia una nueva ruta mediante las rutas nombradas
            Navigator.pushNamed(context, CuartaPagina.CUARTA_PAGINA_RUTA,
                arguments: CuartaPaginaArgumentos(persona: personaEjemplo));
          },
        ),
      ),
    );
  }
}
