import 'package:flutter/material.dart';

class InicioView extends StatefulWidget {
  const InicioView({Key? key}) : super(key: key);

  @override
  _InicioViewState createState() => _InicioViewState();
}

class _InicioViewState extends State<InicioView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Center(
            child: Image.asset(
              'assets/imagenes/BannerInicio.png',
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            title: Text(
              'Marcas',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              'assets/imagenes/Marcas.png',
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            title: Text(
              'Destacados',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Container(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Image.asset('assets/imagenes/halo4.jpg'),
                Image.asset('assets/imagenes/halo5.jpg'),
                Image.asset('assets/imagenes/haloinfinite.jpg'),
              ],
            ),
          ),
          ListTile(
            title: Text(
              'Ofertas',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Container(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Image.asset('assets/imagenes/kirby.jpg'),
                Image.asset('assets/imagenes/pokemon.jpg'),
                Image.asset('assets/imagenes/zelda.jpg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
