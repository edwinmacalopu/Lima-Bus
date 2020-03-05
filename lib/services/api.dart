import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:limabus/models/modelobus.dart';
 
class Apiruta{
  Future<List> buses()async{
    print("entro");
    List bus;
    var url="https://sistemas.protransporte.gob.pe/FLOTA/App/ListarBusesSITAppServicio?direccion=1&servicio=2";
    //var data='{"latitud":"-12.091227","longitud":"-77.024744","direccion":"2"}';
     var response=await http.post(url); 
  if (response.statusCode==200){
      bus =jsonDecode(response.body)["buses"];
      // print(bus.toString());
      //Bus buss=Bus.fromJson(jsonDecode(response.body));
      //print(buss.placa);
      //response=jsonDecode(response.body);
      //print(buss.placa[1]);
    }else{
 
    }  
      return bus;

      //print(genio);
  
  }
}