import 'package:aplicacion_prueba/src/ui/widgets/loading_widget/loading_widget_controller.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Widget de alineacion
    return ValueListenableBuilder(
      //value listenable permite escuchar el valor de un notificador
      //este se almacena en value dentro del builder (context,value,child)
        valueListenable: LoadingWidgetController.instance.textLoading,
        builder: (context, value, child) {
          return Align(
            alignment: Alignment.center,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text(
                    "Cargando",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    value,
                    style: TextStyle(color: Colors.grey[600]),
                  )
                ],
              ),
            ),
          );
        });
  }
}
