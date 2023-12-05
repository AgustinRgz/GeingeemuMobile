import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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
  final TextEditingController priceController = TextEditingController();

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
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            color: const Color.fromARGB(
              255,
              199,
              199,
              199,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
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
          if (_image != null) _imagePreview(),
          _imageButtons(),
          _labeledTextField(nameController, 'Nombre', 'Nombre del juego'),
          _labeledTextField(brandController, 'Marca', 'Marca del juego'),
          _labeledTextField(stockController, 'Stock', 'Cantidad disponible',
              keyboardType: TextInputType.number),
          _numericInput(),
          _labeledTextField(
              descriptionController, 'Descripción', 'Descripción del juego',
              expands: true),
          _labeledTextField(
              priceController, 'Precio', 'Precio del juego',
              keyboardType: TextInputType.number),
          _submitButton(),
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
