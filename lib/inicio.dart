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
      body: Column(children: [
        Center(
          child: Image.asset(
            '/imagenes/BannerInicio.png',
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
            '/imagenes/Marcas.png',
            width: double.infinity,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
      ]),
    );
  }
}
