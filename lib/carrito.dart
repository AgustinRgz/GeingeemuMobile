import 'package:flutter/material.dart';

class ShoppingCartView extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems = [
    {
      "nombre": "Halo Infinite Xbox Collector Steelbook Edition",
      "imagen": "assets/imagenes/haloinfinite.jpg",
      "precio": 2500.00
    },
    {
      "nombre": "Halo 5",
      "imagen": "assets/imagenes/halo5.jpg",
      "precio": 2500.00
    },
    {
      "nombre": "Halo 4",
      "imagen": "assets/imagenes/halo4.jpg",
      "precio": 1999.99
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de Compras'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ShoppingCartItem(
            productName: cartItems[index]['nombre'],
            price: cartItems[index]['precio'],
            image: cartItems[index]['imagen'],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$${calculateTotal()}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  // Lógica para proceder al pago o realizar otras acciones
                },
                child: Text('Proceder al Pago'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calculateTotal() {
    double total = 0;
    for (var item in cartItems) {
      total += item['precio'];
    }
    return total;
  }
}

class ShoppingCartItem extends StatefulWidget {
  final String productName;
  final double price;
  final String image;

  ShoppingCartItem({
    required this.productName,
    required this.price,
    required this.image,
  });

  @override
  _ShoppingCartItemState createState() => _ShoppingCartItemState();
}

class _ShoppingCartItemState extends State<ShoppingCartItem> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(widget.productName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('\$${widget.price.toStringAsFixed(2)}'),
            Row(
              children: [
                Text('Cantidad: '),
                DropdownButton<int>(
                  value: quantity,
                  items: List.generate(10, (index) => index + 1)
                      .map((value) => DropdownMenuItem(
                            value: value,
                            child: Text(value.toString()),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      quantity = value!;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
        leading: Image.asset(
          widget.image,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        trailing: ElevatedButton(
          onPressed: () {
            // Lógica para eliminar del carrito
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${widget.productName} eliminado del carrito'),
              ),
            );
          },
          child: Text('Eliminar'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ShoppingCartView(),
  ));
}
