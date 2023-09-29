import 'package:flutter/material.dart';


class Menu extends StatefulWidget{
  
  @override
  MenuState createState()=>MenuState();
}
class MenuState extends State<Menu>{
  @override
                                                        //MENU CON BOTONES
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: const Text("Menu"),
        ),
        body: Column(
          children: [
                                                        //BOTON CREAR CLIENTE
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, "usuarios");
              },
              child: const Text("Crear cliente")),
                                                         //LISTAR CLIENTES
            ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, "listas");
              },
              child: const Text("Listar clientes")),
          ]),
    );
  }
  

}