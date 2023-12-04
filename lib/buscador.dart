import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';

class Videojuego {
  final String nombre;
  final String imagen;
  final double precio;

  Videojuego({
    required this.nombre,
    required this.imagen,
    required this.precio,
  });
}

class BuscadorView extends StatefulWidget {
  final String searchText;

  const BuscadorView({Key? key, required this.searchText}) : super(key: key);

  @override
  _BuscadorViewState createState() => _BuscadorViewState();
}

class DetailsView extends StatelessWidget {
  final Videojuego videojuego;

  const DetailsView({required this.videojuego});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Column(
        children: [
          Image.asset(
            videojuego.imagen,
            width: 200.0,
            height: 200.0,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16.0),
          Text('Nombre: ${videojuego.nombre}'),
          Text('Precio: \$${videojuego.precio}'),
          // Add more details as needed
        ],
      ),
    );
  }
}

class _BuscadorViewState extends State<BuscadorView> {
  late List<Videojuego> videojuegos;
  List<Videojuego> resultadosBusqueda = [];

  @override
  void initState() {
    super.initState();
    cargarDatos();
  }

  Future<void> cargarDatos() async {
    videojuegos = [
      Videojuego(
        nombre: "Halo Infinite Xbox Collector Steelbook Edition",
        imagen: "assets/imagenes/haloinfinite.jpg",
        precio: 2500.00,
      ),
      Videojuego(
        nombre: "Halo 5",
        imagen: "assets/imagenes/halo5.jpg",
        precio: 2500.00,
      ),
      Videojuego(
        nombre: "Halo 4",
        imagen: "assets/imagenes/halo4.jpg",
        precio: 1999.99,
      ),
    ];

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscador de Videojuegos'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (String query) {
                print('Search Query: $query');
                setState(() {
                  resultadosBusqueda = videojuegos
                      .where((videojuego) =>
                          videojuego.nombre.toLowerCase().contains(query.toLowerCase()))
                      .toList();
                });
                print('Search Results: $resultadosBusqueda');
              },
              decoration: InputDecoration(
                labelText: 'Buscar Videojuego',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: resultadosBusqueda.isNotEmpty ? resultadosBusqueda.length : videojuegos.length,
              itemBuilder: (context, index) {
                final videojuego =
                    resultadosBusqueda.isNotEmpty ? resultadosBusqueda[index] : videojuegos[index];
                return Card(
                  child: ListTile(
                    leading: Image.asset(
                      videojuego.imagen,
                      width: 50.0,
                      height: 50.0,
                      fit: BoxFit.cover,
                    ),
                    title: Text(videojuego.nombre),
                    subtitle: Text('Precio: \$${videojuego.precio}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsView(videojuego: videojuego),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
