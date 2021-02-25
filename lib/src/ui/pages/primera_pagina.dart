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
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context){
                return CuartaPagina(element: "Hola");
              }
            ));

            //Navigator.pushNamed(context, CuartaPagina.CUARTA_PAGINA_RUTA);
          },
        ),
      ),
    );
  }
}