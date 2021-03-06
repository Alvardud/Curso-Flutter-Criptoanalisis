import 'package:flutter/material.dart';

class LoadingWidgetController{

  //instanciamos el controlador mediante un singleton
  //siempre devolvera la misma instancia
  LoadingWidgetController._();
  static LoadingWidgetController instance = LoadingWidgetController._();

  //value notifier permite notificar el estado o contenido almacenado
  ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);
  ValueNotifier<String> _textLoading = ValueNotifier<String>("");

  //obtenemos el value notifier mediante un getter
  ValueNotifier<bool> get isLoading => _isLoading;
  ValueNotifier<String> get textLoading => _textLoading;

  //actualizamos los valores de los value notifier
  void loading(){
    _isLoading.value = true;
  }

  void close(){
    _isLoading.value = false;
  }

  void changeText(String value){
    _textLoading.value = value;
  }
}