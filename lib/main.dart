// //MENU CON BOTONES
//      //BOTON CREAR CLIENTE
//          //FORMULARIO PARA RELLENAR LOS DATOS DEL CLIENTE
//                //Nombre, Apellido 1, Apellido 2 (no obligatorio),
                  //DNI (validarlo correctamente),
//               //Fecha de nacimiento (datepickerdialog, sout dipicker), opción de particular O empresa(usar choice o dropdown)
                      //BOTON GUARDAR QUE GENERA OBJETO CLIENTE Y LO GUARDA EN UNA LISTA
//                      //BOTON CANCELAR QUE TE DEVUELVE AL MENU INICIAL SIN GUARDAR

          //CLIENTES, NOMBRES, E ICONOS SEGUN SI ES EMPRESA/PARTICULAR
          //BOTON PARA VER A LOS PARTICULARES
          //BOTON PARA VER A LAS EMPRESAS

    //DENTRO DEL CLIENTE SE PUEDE VER TODA LA INFORMACION Y PODER MODIFICARLA O BORRAR EL CLIENTE(soap)



//import 'package:appejercicio/listas.dart';
import 'package:appejercicio/listas.dart';
import 'package:appejercicio/menu.dart';
import 'package:appejercicio/usuarios.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "menu",
      routes: {
        'menu' : (context) => Menu(),
        'usuarios': (context) => Usuario(),
        'listas' : (context) => const Lista(),



      /*  'cuadrado2' : (context) => FiguraPage(figura: "cuadrado"),
        'rectangulo2' : (context) => FiguraPage(figura: "rectangulo"),
        'triangulo2': (context) => FiguraPage(figura: "triangulo"),
        */
      },
    );
  }
}
