import 'package:flutter/material.dart';

class Videojuego {
  final String nombre;
  final double precio;
  final String imagenPath;

  Videojuego({required this.nombre, required this.precio, required this.imagenPath});
}

class WishlistView extends StatefulWidget {
  @override
  _WishlistViewState createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  // Lista de videojuegos deseados
  final List<Videojuego> videojuegosDeseados = [
    Videojuego(nombre: 'The Legend of Zelda: Breath of the Wild', precio: 1999.99, imagenPath: 'assets/imagenes/zelda.jpg'),
    Videojuego(nombre: 'Halo Infinite Xbox Collector Steelbook Edition', precio: 2500.00, imagenPath: 'assets/imagenes/haloinfinite.jpg'),
    Videojuego(nombre: 'Halo 5',  precio: 2500.00, imagenPath: 'assets/imagenes/halo5.jpg'),
    // Puedes agregar más videojuegos según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de deseos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lista de videojuegos deseados
            Expanded(
              child: ListView.builder(
                itemCount: videojuegosDeseados.length,
                itemBuilder: (context, index) {
                  final videojuego = videojuegosDeseados[index];
                  return Card(
                    child: ListTile(
                      leading: Image.asset(
                        videojuego.imagenPath,
                        width: 50.0,
                        height: 50.0,
                        fit: BoxFit.cover,
                      ),
                      title: Text(videojuego.nombre),
                      subtitle: Text('\$${videojuego.precio}'),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_circle),
                        onPressed: () {
                          _removerDeWishlist(videojuego);
                        },
                      ),
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

  void _removerDeWishlist(Videojuego videojuego) {
    setState(() {
      videojuegosDeseados.remove(videojuego);
    });
  }
}