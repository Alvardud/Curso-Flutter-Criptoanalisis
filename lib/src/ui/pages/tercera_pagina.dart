import 'package:aplicacion_prueba/src/ui/widgets/loading_widget/loading_widget.dart';
import 'package:aplicacion_prueba/src/ui/widgets/loading_widget/loading_widget_controller.dart';
import 'package:flutter/material.dart';

class TerceraPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: RaisedButton(
              child: Text("Prender"),
              onPressed: () {
                LoadingWidgetController.instance.loading();
                LoadingWidgetController.instance
                    .changeText("Se activo en tercera pagina");
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: RaisedButton(
              child: Text("Apagar"),
              onPressed: () {
                LoadingWidgetController.instance.close();
              },
            ),
          ),
          ValueListenableBuilder(
              valueListenable: LoadingWidgetController.instance.isLoading,
              builder: (context, value, child) {
                return value ? LoadingWidget() : Container();
              }),
        ],
      ),
    );
  }
}


//Widges
//Contenido
//Comportamiento
//Renderizado (identificadores) keys

//Keys

//Widget Padre
  //Widget hijo

  //Listas
  //for(int index)
  //elemento 1 (color, texto) key(1)
  //elemento 2 (color, texto) key(2)
