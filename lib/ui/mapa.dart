import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:limabus/services/api.dart';
class Gmapa extends StatefulWidget {
  @override
  _GmapaState createState() => _GmapaState();
}

class _GmapaState extends State<Gmapa> {
  List puntos;
  GoogleMapController mapController;
  BitmapDescriptor myIcon;
  
   final Map<String, Marker> _markers = {};
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-12.090514, -77.024744),
    zoom: 14.4746,
  );

  
 

void startTimer() {
   
    Timer.periodic(Duration(seconds: 5),(Timer timer) async{
      puntos=await Apiruta().buses();
        setState(() {
         _markers.clear();
        for(int i=0;i<puntos.length;i++){
       // print(i);
        final marker=Marker(
           markerId: MarkerId(puntos[i]["placa"]),
            position: LatLng(puntos[i]["latitud"], puntos[i]["longitud"]),
            infoWindow: InfoWindow(title: puntos[i]["ruta"]),
            icon: myIcon
        );
        _markers[puntos[i]["placa"]]=marker;
        print(puntos[i]["latitud"]);

        
      } 
      });
     
    },
     
  );
}


    Future<void> _onMapCreated(GoogleMapController controller)async {
    mapController = controller;    
     puntos=await Apiruta().buses();
     _markers.clear();
      setState(() {
        for(int i=0;i<puntos.length;i++){
        print(i);
        final marker=Marker(
           markerId: MarkerId(puntos[i]["placa"]),
            position: LatLng(puntos[i]["latitud"], puntos[i]["longitud"]),
            infoWindow: InfoWindow(title: puntos[i]["ruta"]),
            icon: myIcon
        );
        _markers[puntos[i]["placa"]]=marker;
        print(puntos[i]["latitud"]);

        
      } 
      });
    mapController.setMapStyle('[{"stylers":[{"hue":"#e7ecf0"}]},{"featureType":"administrative","elementType":"labels.text.fill","stylers":[{"color":"#636c81"}]},{"featureType":"administrative.land_parcel","elementType":"labels.text.fill","stylers":[{"color":"#ff0000"}]},{"featureType":"administrative.neighborhood","elementType":"labels.text.fill","stylers":[{"color":"#636c81"}]},{"featureType":"landscape","elementType":"geometry.fill","stylers":[{"color":"#f1f4f6"}]},{"featureType":"landscape","elementType":"labels.text.fill","stylers":[{"color":"#496271"}]},{"featureType":"poi","stylers":[{"visibility":"off"}]},{"featureType":"road","stylers":[{"saturation":-70}]},{"featureType":"road","elementType":"geometry.fill","stylers":[{"color":"#ffffff"}]},{"featureType":"road","elementType":"geometry.stroke","stylers":[{"color":"#c6d3dc"}]},{"featureType":"road","elementType":"labels.text.fill","stylers":[{"color":"#898e9b"}]},{"featureType":"transit","stylers":[{"visibility":"off"}]},{"featureType":"water","stylers":[{"saturation":-60},{"visibility":"simplified"}]},{"featureType":"water","elementType":"geometry.fill","stylers":[{"color":"#d3eaf8"}]}]');

     }

   

     Future traedatos()async{
       puntos=await Apiruta().buses();
       //print(puntos[1]["latitud"]);
     }
    
  @override
  void initState(){
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(150, 150)), 'images/bus.png')
        .then((onValue) {
      myIcon = onValue;
    });
    startTimer();
    //traedatos();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: 
      Container(
        child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: _onMapCreated,
       markers: _markers.values.toSet(),
      ),
      )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
             puntos=await Apiruta().buses();
            
      setState(() {
         _markers.clear();
        for(int i=0;i<puntos.length;i++){
       // print(i);
        final marker=Marker(
           markerId: MarkerId(puntos[i]["placa"]),
            position: LatLng(puntos[i]["latitud"], puntos[i]["longitud"]),
            infoWindow: InfoWindow(title: puntos[i]["ruta"]),
            icon: myIcon
        );
        _markers[puntos[i]["placa"]]=marker;
        print(puntos[i]["latitud"]);

        
      } 
      });
          //Apiruta().buses();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}