import 'package:flutter/material.dart';

class SellView extends StatefulWidget {
  const SellView({super.key});

  @override
  _SellViewState createState() => _SellViewState();
}

class _SellViewState extends State<SellView> {
  bool _showFab = true;
  bool _showNotch = true;
  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.endDocked;
  final TextEditingController text1Controller = TextEditingController();
  final TextEditingController text2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            color: const Color.fromARGB(
                255, 199, 199, 199), // Color de fondo del título
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 8.0),
                  Text(
                    'Vender mis juegos',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0, 137, 195, 100),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Contenido de la vista
          Expanded(
            child: Center(
              child: Text(
                '',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: _showFab
          ? FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/newsell');
              },
              tooltip: 'Nuevo Juego',
              child: const Icon(Icons.add),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class NewSellView extends StatefulWidget {
  const NewSellView({super.key});

  @override
  _NewSellViewState createState() => _NewSellViewState();
}

class _NewSellViewState extends State<NewSellView> {
  // File? _image;
  // final picker = ImagePicker();
  // final textController = TextEditingController();

  // Future getImage(ImageSource source) async {
  //   final pickedFile = await picker.pickImage(source: source);

  //   setState(() {
  //     if (pickedFile != null) {
  //       _image = File(pickedFile.path);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            color: const Color.fromARGB(255, 199, 199, 199), // Color de fondo del título
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Utiliza Navigator.pop para retroceder a la vista anterior
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text('Cancelar'),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Nuevo juego',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 137, 195, 100),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Contenido de la vista
          Expanded(
            child: Center(
              child: Text(
                '',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
