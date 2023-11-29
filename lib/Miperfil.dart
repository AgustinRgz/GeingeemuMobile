import 'package:flutter/material.dart';

class MiPerfilView extends StatelessWidget {
  const MiPerfilView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/imagenes/kirby.jpg'), // Agrega tu imagen de perfil aquí
            ),
            const SizedBox(height: 16.0),
            Text(
              'Nombre de Usuario',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              'correo@ejemplo.com', // Agrega tu dirección de correo aquí
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24.0),
            _buildProfileItem('Mis Pedidos', Icons.shopping_cart, () {
              // Lógica para navegar a la vista de pedidos
            }),
            _buildProfileItem('Direcciones', Icons.location_on, () {
              // Lógica para navegar a la vista de direcciones
            }),
            _buildProfileItem('Métodos de Pago', Icons.credit_card, () {
              // Lógica para navegar a la vista de métodos de pago
            }),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Lógica para cerrar sesión
              },
              child: Text('Cerrar Sesión'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
