import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuscadorView extends StatefulWidget {
  @override
  _BuscadorViewState createState() => _BuscadorViewState();
}

class _BuscadorViewState extends State<BuscadorView> {
  late List<Map<String, dynamic>> videojuegos;
  List<Map<String, dynamic>> resultadosBusqueda = [];

  @override
  void initState() {
    super.initState();
    cargarDatos();
  }

  Future<void> cargarDatos() async {
    final String data =
        await rootBundle.loadString('assets/videojuegos.json');
    final List<dynamic> jsonData = json.decode(data);
    setState(() {
      videojuegos = jsonData.cast<Map<String, dynamic>>();
    });
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
                setState(() {
                  resultadosBusqueda = videojuegos
                      .where((videojuego) =>
                          videojuego['nombre']
                              .toLowerCase()
                              .contains(query.toLowerCase()))
                      .toList();
                });
              },
              decoration: InputDecoration(
                labelText: 'Buscar Videojuego',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: resultadosBusqueda.isNotEmpty
                  ? resultadosBusqueda.length
                  : videojuegos.length,
              itemBuilder: (context, index) {
                final videojuego = resultadosBusqueda.isNotEmpty
                    ? resultadosBusqueda[index]
                    : videojuegos[index];
                return Card(
                  child: ListTile(
                    leading: Image.asset(
                      videojuego['imagen'],
                      width: 50.0,
                      height: 50.0,
                      fit: BoxFit.cover,
                    ),
                    title: Text(videojuego['nombre']),
                    subtitle: Text('Precio: \$${videojuego['precio']}'),
                    onTap: () {
                      // Puedes agregar lógica para mostrar más detalles del videojuego
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
