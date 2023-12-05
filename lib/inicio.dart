import 'package:flutter/material.dart';

class InicioView extends StatefulWidget {
  const InicioView({Key? key}) : super(key: key);

  @override
  _InicioViewState createState() => _InicioViewState();
}

class _InicioViewState extends State<InicioView> {
  Widget _buildImageWithText(String imagePath, String text, String textP) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          height: 150.0,
        ),
        SizedBox(height: 8.0),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          textP,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(242, 35, 255, 1),
          ),
        ),
      ],
    );
  }

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
            height: 250.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      right: 16.0), // Adjust the spacing between images
                  child: _buildImageWithText(
                      'assets/imagenes/halo4.jpg', 'Halo 4', '\$1000.00'),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 16.0), // Adjust the spacing between images
                  child: _buildImageWithText(
                      'assets/imagenes/halo5.jpg', 'Halo 5', '\$1000.00'),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 16.0), // Adjust the spacing between images
                  child: _buildImageWithText(
                      'assets/imagenes/haloinfinite.jpg', 'Halo Infinite', '\$1000.00'),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 16.0), // Adjust the spacing between images
                  child: _buildImageWithText(
                      'assets/imagenes/kirby.jpg', 'Kirby and the forgotten lands', '\$1000.00'),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 16.0), // Adjust the spacing between images
                  child: _buildImageWithText(
                      'assets/imagenes/zelda.jpg', 'Zelda: TOTK', '\$1000.00'),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 16.0), // Adjust the spacing between images
                  child: _buildImageWithText(
                      'assets/imagenes/pokemon.jpg', 'Pokemon Scarlet', '\$1000.00'),
                ),
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
            height: 250.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      right: 16.0), // Adjust the spacing between images
                  child: _buildImageWithText(
                      'assets/imagenes/kirby.jpg', 'Kirby and the forgotten lands', '\$1000.00'),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 16.0), // Adjust the spacing between images
                  child: _buildImageWithText(
                      'assets/imagenes/zelda.jpg', 'Zelda: TOTK', '\$1000.00'),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 16.0), // Adjust the spacing between images
                  child: _buildImageWithText(
                      'assets/imagenes/pokemon.jpg', 'Pokemon Scarlet', '\$1000.00'),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 16.0), // Adjust the spacing between images
                  child: _buildImageWithText(
                      'assets/imagenes/halo4.jpg', 'Halo 4', '\$1000.00'),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 16.0), // Adjust the spacing between images
                  child: _buildImageWithText(
                      'assets/imagenes/halo5.jpg', 'Halo 5', '\$1000.00'),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 16.0), // Adjust the spacing between images
                  child: _buildImageWithText(
                      'assets/imagenes/haloinfinite.jpg', 'Halo Infinite', '\$1000.00'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
