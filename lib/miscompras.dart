// mis_compras.dart
import 'package:flutter/material.dart';

class Videojuego {
  final String nombre;
  final String fechaRecibido;
  final double precio;
final String imagenPath;  

  Videojuego({required this.nombre, required this.fechaRecibido, required this.precio, required this.imagenPath});
}

class MisComprasView extends StatelessWidget {
  final List<TextEditingController> controllers;

  MisComprasView({required this.controllers});

  // Lista ficticia de videojuegos comprados
  final List<Videojuego> videojuegosComprados = [
    Videojuego(nombre: 'Halo Infinite Xbox Collector Steelbook Edition', fechaRecibido: '01/01/2023', precio: 2500.00, imagenPath: 'assets/imagenes/haloinfinite.jpg'),
    Videojuego(nombre: 'Halo 5', fechaRecibido: '02/01/2023', precio: 2500.00, imagenPath: 'assets/imagenes/halo5.jpg'),
    Videojuego(nombre: 'Halo 4', fechaRecibido: '03/01/2023', precio: 1999.99, imagenPath: 'assets/imagenes/halo4.jpg'),
    // ... puedes agregar más videojuegos según sea necesario
  ];

  @override
  
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Mis Compras'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Lista de videojuegos comprados
          Expanded(
            child: ListView.builder(
              itemCount: videojuegosComprados.length,
              itemBuilder: (context, index) {
                final videojuego = videojuegosComprados[index];
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Imagen y detalles del videojuego
                      ListTile(
                        leading: Image.asset(
                          videojuego.imagenPath,
                          width: 50.0,
                          height: 50.0,
                          fit: BoxFit.cover,
                        ),
                        title: Text(videojuego.nombre),
                        subtitle: Text('Fecha de Recibido: ${videojuego.fechaRecibido}\nPrecio: \$${videojuego.precio}'),
                      ),
                      // Botón de Más Información
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            _mostrarMasInformacion(context, videojuego);
                          },
                          child: const Text('Más Información'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}


  void _mostrarMasInformacion(BuildContext context, Videojuego videojuego) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(videojuego.nombre),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Fecha de Recibido: ${videojuego.fechaRecibido}'),
              Text('Precio: \$${videojuego.precio}'),
              // Puedes agregar más información según sea necesario
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}

