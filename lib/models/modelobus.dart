 // To parse this JSON data, do
//
//     final corredores = corredoresFromJson(jsonString);

import 'dart:convert';

Corredores corredoresFromJson(String str) => Corredores.fromJson(json.decode(str));

String corredoresToJson(Corredores data) => json.encode(data.toJson());

class Corredores {
    Datos datos;
    List<Bus> buses;

    Corredores({
        this.datos,
        this.buses,
    });

    factory Corredores.fromJson(Map<String, dynamic> json) => Corredores(
        datos: Datos.fromJson(json["datos"]),
        buses: List<Bus>.from(json["buses"].map((x) => Bus.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "datos": datos.toJson(),
        "buses": List<dynamic>.from(buses.map((x) => x.toJson())),
    };
}

class Bus {
    TipoRuta tipoRuta;
    Categoria categoria;
    String ruta;
    String codigoRuta;
    String servicio;
    String vid;
    String vidExt;
    String placa;
    double latitud;
    double longitud;
    String conductor;
    Direccion direccion;
    Concesionario concesionario;
    String hora;
    dynamic geo;
    int velocidad;
    dynamic icono;
    dynamic idServicio;
    dynamic flgAlerta;
    dynamic ultimoMensaje;

    Bus({
        this.tipoRuta,
        this.categoria,
        this.ruta,
        this.codigoRuta,
        this.servicio,
        this.vid,
        this.vidExt,
        this.placa,
        this.latitud,
        this.longitud,
        this.conductor,
        this.direccion,
        this.concesionario,
        this.hora,
        this.geo,
        this.velocidad,
        this.icono,
        this.idServicio,
        this.flgAlerta,
        this.ultimoMensaje,
    });

    factory Bus.fromJson(Map<String, dynamic> json) => Bus(
        tipoRuta: tipoRutaValues.map[json["tipo_ruta"]],
        categoria: categoriaValues.map[json["categoria"]],
        ruta: json["ruta"],
        codigoRuta: json["codigo_ruta"],
        servicio: json["servicio"],
        vid: json["vid"],
        vidExt: json["vid_ext"],
        placa: json["placa"],
        latitud: json["latitud"] ,
        longitud: json["longitud"] ,
        conductor: json["conductor"],
        direccion: direccionValues.map[json["direccion"]],
        concesionario: concesionarioValues.map[json["concesionario"]],
        hora: json["hora"],
        geo: json["geo"],
        velocidad: json["velocidad"],
        icono: json["icono"],
        idServicio: json["id_servicio"],
        flgAlerta: json["flg_alerta"],
        ultimoMensaje: json["ultimo_mensaje"],
    );

    Map<String, dynamic> toJson() => {
        "tipo_ruta": tipoRutaValues.reverse[tipoRuta],
        "categoria": categoriaValues.reverse[categoria],
        "ruta": ruta,
        "codigo_ruta": codigoRuta,
        "servicio": servicio,
        "vid": vid,
        "vid_ext": vidExt,
        "placa": placa,
        "latitud": latitud,
        "longitud": longitud,
        "conductor": conductor,
        "direccion": direccionValues.reverse[direccion],
        "concesionario": concesionarioValues.reverse[concesionario],
        "hora": hora,
        "geo": geo,
        "velocidad": velocidad,
        "icono": icono,
        "id_servicio": idServicio,
        "flg_alerta": flgAlerta,
        "ultimo_mensaje": ultimoMensaje,
    };
}

enum Categoria { ESPECIAL, REGULAR, EXPRESO, CORREDOR_VERDE, CORREDOR_AZUL, CORREDOR_MORADO }

final categoriaValues = EnumValues({
    "Corredor Azul": Categoria.CORREDOR_AZUL,
    "Corredor Morado": Categoria.CORREDOR_MORADO,
    "Corredor Verde": Categoria.CORREDOR_VERDE,
    "Especial": Categoria.ESPECIAL,
    "Expreso": Categoria.EXPRESO,
    "Regular": Categoria.REGULAR
});

enum Concesionario { TRANSVIAL, LIMA_BUS_INTERNACIONAL, PERU_MASIVO, LIMA_VIAS_EXPRESS, CCENTRAL, CONSORCIO_TRANSPORTES_AREQUIPA_S_A, SAN_JUAN_DE_LURIGANCHO }

final concesionarioValues = EnumValues({
    "Ccentral": Concesionario.CCENTRAL,
    "Consorcio Transportes Arequipa S.A": Concesionario.CONSORCIO_TRANSPORTES_AREQUIPA_S_A,
    "LIMA BUS INTERNACIONAL": Concesionario.LIMA_BUS_INTERNACIONAL,
    "LIMA VIAS EXPRESS": Concesionario.LIMA_VIAS_EXPRESS,
    "PERU MASIVO": Concesionario.PERU_MASIVO,
    "San Juan de Lurigancho": Concesionario.SAN_JUAN_DE_LURIGANCHO,
    "TRANSVIAL": Concesionario.TRANSVIAL
});

enum Direccion { NORTE, SUR, A, NS, EO }

final direccionValues = EnumValues({
    "A": Direccion.A,
    "EO": Direccion.EO,
    "Norte": Direccion.NORTE,
    "NS": Direccion.NS,
    "Sur": Direccion.SUR
});

enum TipoRuta { ALIMENTADOR, TRONCAL, CORREDOR_COMPLEMENTARIO }

final tipoRutaValues = EnumValues({
    "Alimentador": TipoRuta.ALIMENTADOR,
    "Corredor Complementario": TipoRuta.CORREDOR_COMPLEMENTARIO,
    "Troncal": TipoRuta.TRONCAL
});

class Datos {
    double latitud;
    double longitud;
    String direccion;

    Datos({
        this.latitud,
        this.longitud,
        this.direccion,
    });

    factory Datos.fromJson(Map<String, dynamic> json) => Datos(
        latitud: json["latitud"] ,
        longitud: json["longitud"] ,
        direccion: json["direccion"],
    );

    Map<String, dynamic> toJson() => {
        "latitud": latitud,
        "longitud": longitud,
        "direccion": direccion,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
