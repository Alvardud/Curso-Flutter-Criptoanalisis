import 'package:aplicacion_prueba/src/core/models/persona_modelo.dart';
import 'package:flutter/material.dart';
import 'package:aplicacion_prueba/main.dart';

GlobalKey<FormState> formularioKey = GlobalKey<FormState>();

class SegundaPagina extends StatefulWidget {
  @override
  _SegundaPaginaState createState() => _SegundaPaginaState();
}

class _SegundaPaginaState extends State<SegundaPagina> {
  Widget caja() {
    return Container(
      margin: EdgeInsets.all(8),
      color: Colors.blue,
      height: 200,
      width: 400,
    );
  }

  TextEditingController nombreController;

  TextEditingController edadController;
  TextEditingController passwordController;

  Persona persona;

  @override
  void initState() {
    super.initState();
    nombreController = TextEditingController();
    edadController = TextEditingController();
    passwordController = TextEditingController();
    persona = Persona();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      //Widgets para formulario
      //Form
      //ListView - ScrollView
      //TextField - TextFormField

      /*child: ListView(
        children: [
          caja(),
          caja(),
          caja(),
          caja(),
          caja(),
          caja(),
          caja(),
          caja(),
        ],
      ),*/

      child: SingleChildScrollView(
        //scrollDirection: Axis.horizontal,
        child: Form(
          key: formularioKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                //for(int i =0; i<10;i++)
                //caja(),
                //TextField
                TextFormField(
                  validator: (value) {
                    if (value.length < 3) {
                      return "no es del tamaño suficiente";
                    }
                    return null;
                  },
                  controller: nombreController,
                  onChanged: (value) {
                    persona.nombre = value;
                  },
                  onFieldSubmitted: (value) {
                    persona.nombre = value;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      hintText: "Nombre",
                      labelText: "Ej. Alvaro"),
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      hintText: "Edad",
                      labelText: "Ej. 23"),
                  controller: edadController,
                  onChanged: (value) {
                    persona.edad = int.parse(value);
                    //String aux = persona.edad.toString();
                  },
                  onSubmitted: (value) {
                    persona.edad = int.parse(value);
                  },
                ),
                SizedBox(height: 8),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.security),
                      border: OutlineInputBorder(),
                      hintText: "Contraseña",
                      labelText: "Contraseña"),
                  controller: passwordController,
                  onChanged: (value) {
                    persona.password = value;
                    //String aux = persona.edad.toString();
                  },
                  onSubmitted: (value) {
                    persona.password = value;
                  },
                ),
                //FormField(builder: null),
                SizedBox(height: 16),
                OutlineButton(
                    onPressed: () {
                      //validamos el formulario
                      if (formularioKey.currentState.validate()) {
                        //SnackBar
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Todo esta correcto"),
                        ));
                      } else {
                        //mostrar snackbar mediante un key
                        homeState.currentState.showSnackBar(SnackBar(
                          content: Text("Campos Vacios"),
                        ));
                      }
                    },
                    child: Text("Enviar Textos"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  //stateful widget
  //initState => inicializa estados
  //didChangeDependencies => una vez inicializado los estados ingresa a este metodo
  //dispose => elimina el widget del arbol de widgets
  //setState => actuliza el estado del widget

  @override
  void dispose() {
    //liberamos los widgets y sus estados del arbol de widgets
    nombreController.dispose();
    edadController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

//Widgets
//Contenido - Comportamiento - Renderizado

//for
