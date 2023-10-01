import 'package:flutter/material.dart';
import 'package:appejercicio/usuarios.dart';
import 'package:appejercicio/datosusuario.dart';

class ListadoClientes extends StatefulWidget{
  const ListadoClientes({super.key});
  @override
  ListaState createState()=>ListaState();
}
class ListaState extends State<ListadoClientes>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lista de usuarios"),
        ),
        body: ListView.builder(
          itemCount: listaClientes.length,
          itemBuilder: (BuildContext context, int index){
            return ListTile(
              leading: const Icon(Icons.list),
              title: Text('$listaClientes'),
              onTap: (){
                ElevatedButton(
            child: const Text('Ver particulares'),
            onPressed: (){
            }
            );
            ElevatedButton(
            child: const Text('Ver empresarios'),
            onPressed: (){
        }
        );
          },
        ); 
      },
      ),
    ); 
  }
}
/*
class ListadoClientes extends StatelessWidget {
   const ListadoClientes( {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: const Text("Lista de usuarios")),
    body: 
    ListView.builder(
      itemCount: listaEleccion.length,
      itemBuilder: (BuildContext context, int index){
        return ListTile(
          leading: const Icon(Icons.list),
          title: Text('$listaEleccion'),
          //subtitle: Text(listaEleccion[index].apellido1),
          onTap: (){
             ElevatedButton(
        child: const Text('Ver particulares'),
        onPressed: (){
        }
        );
         ElevatedButton(
        child: const Text('Ver empresarios'),
        onPressed: (){
        }
        );
          },
        ); 
      },
      ),
    ); 
  }
}
*/