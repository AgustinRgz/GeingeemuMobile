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
        '/sixth': (context) => const SixthView(),
      },
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;
  final String text;

  const PlaceholderWidget({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController text1Controller = TextEditingController();
  final TextEditingController text2Controller = TextEditingController();

  int _currentIndex = 0;

  final List<Widget> _pages = [
    PlaceholderWidget(color: Colors.red, text: 'Inicio'),
    PlaceholderWidget(color: Colors.green, text: 'Carrito'),
    PlaceholderWidget(color: Colors.blue, text: 'Lista de Deseos'),
    PlaceholderWidget(color: const Color.fromARGB(255, 58, 243, 33), text: 'Vender'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vista Principal'),
        backgroundColor: Colors.grey,
      ),
      body: _pages[_currentIndex], // Corregido
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.yellow,       // Cambia el color de fondo
        selectedItemColor: Colors.blue,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
            backgroundColor: const Color.fromARGB(255, 197, 197, 197),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrito',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Lista de Deseos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store),
            label: 'Vender',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Usuario'),
            ),
            ListTile(
              title: const Text('Mi perfil'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Mis compras'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/second',
                    arguments: [text1Controller, text2Controller]);
              },
            ),
            ListTile(
              title: const Text('Mi lista de deseos'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/third');
              },
            ),
            ListTile(
              title: const Text('Mis ventas'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/fourth');
              },
            ),
            Divider(),
            ListTile(
              title: const Text('Configuraciones'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/fifth');
              },
            ),
            ListTile(
              title: const Text('Ayuda y soporte'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/sixth');
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

class SixthView extends StatefulWidget {
  const SixthView({super.key});

  @override
  _SixthViewState createState() => _SixthViewState();
}

class _SixthViewState extends State<SixthView> {
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
      appBar: AppBar(title: const Text("Sexta Vista")),
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