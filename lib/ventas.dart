import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:file_picker/file_picker.dart';

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
  const NewSellView({Key? key}) : super(key: key);

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
  final TextEditingController priceController = TextEditingController();

  void populateFormFields() {
    if (game != null && game!.isNotEmpty) {
      Game firstGame = game![0];
      nameController.text = firstGame.nombre;
      brandController.text = firstGame.marca;
      stockController.text = firstGame.stock;
      descriptionController.text = firstGame.descripcion;
      priceController.text = firstGame.precio;
      _image = File(firstGame.imagen);
    }
  }

  //FilePicker
  List<Game>? game;

  Future<void> loadDJsFromJsonFile() async {
    try {
      FilePickerResult? result = await FilePickerWeb.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
      );

      if (result != null) {
        List<int> bytes = result.files.single.bytes!;
        String jsonString = String.fromCharCodes(bytes);

        List<dynamic> jsonList = json.decode(jsonString);

        List<Game> newGame = jsonList.map((json) => Game.fromJson(json)).toList();

        print('Loaded Game from file: $newGame');

        setState(() {
          game ??= [];
          game!.addAll(newGame);
          populateFormFields();
        });
      } else {
        print('No file selected.');
      }
    } catch (error) {
      print('Error loading Game from file: $error');
    }
  }
//End FilePicker

  void incrementStock() {
    setState(() {
      int currentStock = int.tryParse(stockController.text) ?? 0;
      stockController.text = (currentStock + 1).toString();
    });
  }

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
      appBar: AppBar(
        title: const Text('Nuevo Juego'),
        foregroundColor: const Color.fromRGBO(0, 137, 195, 100),
        backgroundColor: const Color.fromARGB(
          255,
          199,
          199,
          199,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          if (_image != null) _imagePreview(), //Carga la imagen del JSON
          _imageButtons(),
          _labeledTextField(nameController, 'Nombre', 'Nombre del juego'), //Carga el nombre del JSON
          _labeledTextField(brandController, 'Marca', 'Marca del juego'), //Carga la marca del JSON
          _labeledTextField(stockController, 'Stock', 'Cantidad disponible',
              keyboardType: TextInputType.number), //Carga el stock del JSON
          _numericInput(),
          _labeledTextField(
              descriptionController, 'Descripción', 'Descripción del juego',
              expands: true), //Carga la descripción del JSON
          _labeledTextField(priceController, 'Precio', 'Precio del juego',
              keyboardType: TextInputType.number), //Carga el precio del JSON
          _submitButton(),
          ElevatedButton(
              onPressed: () {
                loadDJsFromJsonFile();
              },
              child: Text('Cargar juego desde archivo JSON'),
            ),
        ],
      ),
    );
  }

  Widget _imagePreview() {
    if (_image != null) {
      return kIsWeb
          ? Image.network(
              _image!.path,
              width: double.infinity,
              height: 200.0,
              fit: BoxFit.cover,
            )
          : Image.file(
              _image!,
              width: double.infinity,
              height: 200.0,
              fit: BoxFit.cover,
            );
    } else {
      return Container(); // Placeholder for when there is no image selected
    }
  }

  Widget _imageButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => getImage(ImageSource.gallery),
          child: const Text("Cargar Imagen"),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () => getImage(ImageSource.camera),
          child: const Text("Tomar Foto"),
        ),
      ],
    );
  }

  Widget _labeledTextField(
      TextEditingController controller, String hintText, String label,
      {TextInputType? keyboardType, bool expands = false, int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.grey[200],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              maxLines: expands ? null : maxLines,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  Widget _numericInput() {
    return Row(
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
    );
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, '/');
      },
      child: const Text('Submit'),
    );
  }
}

class Game {
  final String nombre;
  final String marca;
  final String imagen;
  final String stock;
  final String descripcion;
  final String precio;

  Game({
    required this.nombre,
    required this.marca,
    required this.imagen,
    required this.stock,
    required this.descripcion,
    required this.precio
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      nombre: json['nombre'],
      marca: json['marca'],
      imagen: json['imagen'],
      stock: json['stock'],
      descripcion: json['descripcion'],
      precio: json['precio']
    );
  }
}