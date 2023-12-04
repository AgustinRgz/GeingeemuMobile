import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';

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
  File? _image;
  final picker = ImagePicker();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  // Function to increment the stock
  void incrementStock() {
    setState(() {
      int currentStock = int.tryParse(stockController.text) ?? 0;
      stockController.text = (currentStock + 1).toString();
    });
  }

  // Function to decrement the stock
  void decrementStock() {
    setState(() {
      int currentStock = int.tryParse(stockController.text) ?? 0;
      if (currentStock > 0) {
        stockController.text = (currentStock - 1).toString();
      }
    });
  }

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            color: const Color.fromARGB(
                255, 199, 199, 199), // Color de fondo del título
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
          if (_image != null)
            kIsWeb
                ? Image.network(
                    _image!.path,
                    width: MediaQuery.of(context).size.width,
                  )
                : Image.file(
                    _image!,
                    width: MediaQuery.of(context).size.width,
                  ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => getImage(ImageSource.gallery),
                  child: const Text("Cargar Imagen")),
              const SizedBox(
                width: 10,
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () => getImage(ImageSource.camera),
                  child: const Text("Tomar Foto")),
            ],
          ),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(hintText: 'Nombre'),
          ),
          TextField(
            controller: brandController,
            decoration: const InputDecoration(hintText: 'Marca'),
          ),
          TextField(
            controller: stockController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'Stock'),
          ),

          // Numeric input for incrementing and decrementing stock
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: incrementStock,
                child: Icon(Icons.add),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: decrementStock,
                child: Icon(Icons.remove),
              ),
            ],
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(hintText: 'Descripción'),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {});
                Navigator.pop(context);
                Navigator.pushNamed(context, '/');
              },
              child: const Text('Submit')),
          if (_image != null) Text(nameController.text),
        ],
      ),
    );
  }
}
