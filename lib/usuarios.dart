import 'package:appejercicio/datosusuario.dart';
import 'package:dni_nie_validator/dni_nie_validator.dart';
import 'package:flutter/material.dart';

class Usuario extends StatefulWidget{
  
  @override
  UsuarioState createState()=>UsuarioState();
}
class UsuarioState extends State<Usuario>{
  final _formKey = GlobalKey<FormState>();
  List<String> items = ['Particular', 'Empresa'];
  String? selectedItem = 'Particular';
    String mensaje = "";
  TextEditingController Nombre = TextEditingController();
  TextEditingController Apellido1 = TextEditingController();
  TextEditingController Apellido2 = TextEditingController();
  TextEditingController DNI = TextEditingController();
  TextEditingController FechaNacimiento = TextEditingController();
      crearFecha() async{
    DateTime? fechaSeleccionada = await showDatePicker(     //CALENDARIO
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1800),
      lastDate: DateTime(2500));
      setState(() {
        if ( fechaSeleccionada!=null){
          String fechaformat ="${fechaSeleccionada.year.toString()}-${fechaSeleccionada.month.toString().padLeft(2,'0')}-${fechaSeleccionada.day.toString().padLeft(2,'0')}";
          FechaNacimiento.text = fechaformat;
                }
      });
  }
    validarDNI(String value) {      //VALIDADOR DNI
    if (value.isValidDNI()) {
      return null;
    }
    return 'Documento no valido';
  }
  
  
String? ValorDelCampo= "";

  String? obligadoNombre (String? valorCampo){    //CAMPOS OBLIGATORIOS
    if(valorCampo!.isEmpty){
      return 'Por favor, introduzca el nombre';
    }
    return null;
  }
  String? obligadoApellido1(String? valorCampo){
    if(valorCampo!.isEmpty){
      return 'Por favor, introduzca el primer apellido';
    }
    return null;
  }

  

  @override
  //MENU CON BOTONES
  Widget build(BuildContext context){
    return Scaffold(body: Form(
        child: Column(
          children: [
                      //FORMULARIO PARA RELLENAR LOS DATOS DEL CLIENTE
                      //Nombre, Apellido 1, Apellido 2 (no obligatorio), DNI (validarlo correctamente),
                TextFormField (
                  controller: Nombre,
                  validator: (value){
                    return obligadoNombre (value);
                  },
                  decoration: const InputDecoration(hintText: "Nombre"),
                  onSaved: (newValue){
                    ValorDelCampo = newValue;
                  }
                  ),
                TextFormField (
                  controller: Apellido1,
                  validator: (value){
                    return obligadoApellido1(value);
                  },
                  decoration: const InputDecoration(hintText: "Primer apellido"),
                  
                  onSaved: (newValue){
                    ValorDelCampo = newValue;
                  }
                  ),
                  TextFormField (
                  controller: Apellido2,
                  decoration: const InputDecoration(labelText: "Segundo apellido"),//No obligatorio
                  ),
                  TextFormField (
                  controller: DNI,
                  validator: (value){
                  return validarDNI (value!);
                  },
                  decoration: const InputDecoration(labelText: "DNI"),            //Falta DNI***********************
                  ),
                  //Fecha de nacimiento (datepickerdialog, sout dipicker), opción de particular O empresa(usar choice o dropdown)
                    TextFormField (
                  controller: FechaNacimiento,
                  onTap: (){
                    crearFecha();
                  },
                  decoration: const InputDecoration(labelText: "Fecha de nacimiento"),
                  
                  ),
                                        //BOTON GUARDAR QUE GENERA OBJETO CLIENTE Y LO GUARDA EN UNA LISTA
            ElevatedButton(
              onPressed: (){

                if (_formKey.currentState!.validate()){
                    datosUsuarios usuario = datosUsuarios(Nombre.text, Apellido1.text, Apellido2.text, DNI.text, FechaNacimiento.text);
                      Navigator.pop(context);

                }
                //return datosUsuarios(Nombre, Apellido1, Apellido2, DNI, FechaNacimiento);
              },
              child: const Text("Guardar")),
              
                                       //BOTON CANCELAR QUE TE DEVUELVE AL MENU INICIAL SIN GUARDAR
            ElevatedButton(onPressed: (){
                Navigator.pop(context, "Cancelar");
              },
              child: const Text("Cancelar")),
              DropdownButton<String>(
          value: selectedItem,
          items: items.map((item) => DropdownMenuItem<String>(
            value: item,
            child: Text(item)
            )).toList(),
            onChanged: (item)=> setState (() => selectedItem=item),
        ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
              
                if (_formKey.currentState!.validate()) {

                    _formKey.currentState!.save();

                
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Procesando...')));
                }
                //guardarCliente(); //guardar en las listas
              },
              child: const Text('Guardar cliente'),
            ),
          ),
          ]),
    )
    );
  
  }
  
}
