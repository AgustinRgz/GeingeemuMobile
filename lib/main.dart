import 'package:flutter/material.dart';
import 'package:geingeemu/inicio.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'buscador.dart';
import 'miscompras.dart';
import 'Miperfil.dart';
import 'Wishlist.dart';
import 'carrito.dart';
import 'ventas.dart';
import 'inicio.dart';
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
        '/sixth': (context) => const SellView(),
        '/newsell': (context) => const NewSellView(),
        '/shoppingCart': (context) => ShoppingCartView(),
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
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}

class ObscuredTextFieldSample extends StatelessWidget {
  final String searchText;

  const ObscuredTextFieldSample({super.key, required this.searchText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 40,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BuscadorView(searchText: searchText),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blueAccent,
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.search),
              const SizedBox(width: 8),
              Text(
                'Buscar',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final BuildContext context;
  final String searchText;

  const CustomAppBar({required this.height, required this.context, required this.searchText});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: AppBar(
        title: Center(
          child: ObscuredTextFieldSample(searchText: searchText),
        ),
        actions: [
          
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double _appBarHeight = kToolbarHeight; // Altura inicial del AppBar
  int _currentIndex = 0;
  String _searchText = ''; // Add this line

  final List<Widget> _pages = [
    const InicioView(),
    ShoppingCartView(),
    WishlistView(),
    const SellView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: _appBarHeight,
        context: context,
        searchText: _searchText,
        // Pass the search text to CustomAppBar
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.yellow,
        selectedItemColor: Colors.blue,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _appBarHeight = index == 0 ? kToolbarHeight : 0;
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
            icon: Icon(Icons.sell),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MiPerfilView(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Mis compras'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MisComprasView(controllers: []),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Mi lista de deseos'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WishlistView(),
                  ),
                );
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segunda Vista'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    minimumSize: const Size(120.0, 60.0),
                  ),
                  child: const Text('Botón 1'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    minimumSize: const Size(120.0, 60.0),
                  ),
                  child: const Text('Botón 2'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    minimumSize: const Size(120.0, 60.0),
                  ),
                  child: const Text('Botón 3'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    minimumSize: const Size(120.0, 60.0),
                  ),
                  child: const Text('Botón 4'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    minimumSize: const Size(120.0, 60.0),
                  ),
                  child: const Text('Botón 5'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    minimumSize: const Size(120.0, 60.0),
                  ),
                  child: const Text('Botón 6'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    minimumSize: const Size(120.0, 60.0),
                  ),
                  child: const Text('Botón 7'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    minimumSize: const Size(120.0, 60.0),
                  ),
                  child: const Text('Botón 8'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    minimumSize: const Size(120.0, 60.0),
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
            kIsWeb ? Image.network(_image!.path) : Image.file(_image!),
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
                setState(() {});
              },
              child: const Text('Submit')),
          if (_image != null) Text(textController.text),
        ],
      ),
    );
  }
}