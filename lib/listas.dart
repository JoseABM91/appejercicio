import 'package:flutter/material.dart';


class Lista extends StatefulWidget{
  const Lista({super.key});


  @override
  ListaState createState()=>ListaState();
}
class ListaState extends State<Lista>{
  @override
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