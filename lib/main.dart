import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/', // Página inicial
      routes: {
        '/': (context) => HomeView(),
        '/second': (context) => const SecondView(),
        '/third': (context) => const ThirdView(),
        '/fourth': (context) => const FourthView(),
        '/fifth': (context) => const FifthView(),
      },
    );
  }
}

class HomeView extends StatelessWidget {
  final TextEditingController text1Controller = TextEditingController();
  final TextEditingController text2Controller = TextEditingController();

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vista Principal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: text1Controller,
              decoration: const InputDecoration(
                labelText: 'Campo de Texto 1',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: text2Controller,
              decoration: const InputDecoration(
                labelText: 'Campo de Texto 2',
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/second',
                    arguments: [text1Controller, text2Controller]);
              },
            ),
            ListTile(
              title: const Text('Item 3'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/third');
              },
            ),
            ListTile(
              title: const Text('Item 4'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/fourth');
              },
            ),
            ListTile(
              title: const Text('Item 5'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/fifth');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondView extends StatelessWidget {
  const SecondView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> controllers =
        ModalRoute.of(context)?.settings.arguments as List<TextEditingController>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Segunda Vista'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Primera fila de botones
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showMessage(context, controllers);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    minimumSize: const Size(120.0, 60.0), // Ajusta el tamaño del botón
                  ),
                  child: const Text('Botón 1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para el segundo botón
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    minimumSize: const Size(120.0, 60.0), // Ajusta el tamaño del botón
                  ),
                  child: const Text('Botón 2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para el tercer botón
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    minimumSize: const Size(120.0, 60.0), // Ajusta el tamaño del botón
                  ),
                  child: const Text('Botón 3'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            // Segunda fila de botones
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Lógica para el cuarto botón
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    minimumSize: const Size(120.0, 60.0), // Ajusta el tamaño del botón
                  ),
                  child: const Text('Botón 4'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para el quinto botón
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    minimumSize: const Size(120.0, 60.0), // Ajusta el tamaño del botón
                  ),
                  child: const Text('Botón 5'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para el sexto botón
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    minimumSize: const Size(120.0, 60.0), // Ajusta el tamaño del botón
                  ),
                  child: const Text('Botón 6'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            // Tercera fila de botones
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Lógica para el séptimo botón
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    minimumSize: const Size(120.0, 60.0), // Ajusta el tamaño del botón
                  ),
                  child: const Text('Botón 7'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para el octavo botón
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    minimumSize: const Size(120.0, 60.0), // Ajusta el tamaño del botón
                  ),
                  child: const Text('Botón 8'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para el noveno botón
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    minimumSize: const Size(120.0, 60.0), // Ajusta el tamaño del botón
                  ),
                  child: const Text('Botón 9'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showMessage(BuildContext context, List<TextEditingController> controllers) {
    final text1 = controllers[0].text;
    final text2 = controllers[1].text;

    final message = 'Este es el contenido de la vista principal:\n$text1\n$text2';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}

class ThirdView extends StatelessWidget {
  const ThirdView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tercera Vista'),
      ),
      body: const Center(
        child: Text('Contenido tercera vista'),
      ),
    );
  }
}

class FourthView extends StatefulWidget {
  const FourthView({super.key});

  @override
  _FourthViewState createState() => _FourthViewState();
}

class _FourthViewState extends State<FourthView> {
  double _var1 = 0;
  double _var2 = 0;
  String _operation = 'suma';
  int _result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cuarta Vista")),
      body: Column(
        children: [
          Slider(
            value: _var1,
            min: 0,
            max: 10,
            onChanged: (value) {
              setState(() {
                _var1 = value;
              });
            },
          ),
          DropdownButton<int>(
            value: _var2.round(),
            items: List.generate(11, (i) => i)
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text("$e"),
                    ))
                .toList(),
            onChanged: (int? value) {
              setState(() {
                _var2 = value!.toDouble();
              });
            },
          ),
          Row(
            children: [
              Radio(
                value: 'suma',
                groupValue: _operation,
                onChanged: (value) {
                  setState(() {
                    _operation = value!;
                  });
                },
              ),
              const Text('Sumar'),
              Radio(
                value: 'multiplicación',
                groupValue: _operation,
                onChanged: (value) {
                  setState(() {
                    _operation = value!;
                  });
                },
              ),
              const Text('Multiplicar'),
            ],
          ),
          TextField(
            controller: TextEditingController(text: _resultText),
          ),
        ],
      ),
    );
  }

  String get _resultText {
    if (_operation == 'suma') {
      _result = _var1.round() + _var2.round();
    } else {
      _result = _var1.round() * _var2.round();
    }

    return 'El resultado de la $_operation es: $_result';
  }
}

class FifthView extends StatefulWidget {
  const FifthView({super.key});

  @override
  _FifthViewState createState() => _FifthViewState();
}

class _FifthViewState extends State<FifthView> {
  File? _image;
  final picker = ImagePicker();
  final textController = TextEditingController();

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
      appBar: AppBar(title: const Text("Quinta Vista")),
      body: Column(
        children: <Widget>[
          if (_image != null)
            kIsWeb
                ? Image.network(_image!.path)
                : Image.file(_image!),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () => getImage(ImageSource.gallery),
                  child: const Text("Cargar Imagen")),
              const SizedBox(width: 10),
              ElevatedButton(
                  onPressed: () => getImage(ImageSource.camera),
                  child: const Text("Tomar Foto")),
            ],
          ),
          TextField(
            controller: textController,
            decoration: const InputDecoration(hintText: 'Nombre'),
          ),
          ElevatedButton(
              onPressed: () {
                // Aquí puedes usar la imagen (_image) y el texto (textController.text)
                setState(() {});
              },
              child: const Text('Submit')),
          if (_image != null) Text(textController.text),
        ],
      ),
    );
  }
}