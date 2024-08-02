import 'package:flutter_front/models/auth.dart';
import 'package:flutter_front/models/cliente_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    void singOut() {
      final providerAuth = Provider.of<Auth>(context, listen: false);
      providerAuth.signOut(context);
    }


    final clienteList = Provider.of<ClienteList>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: singOut,
          ),
          IconButton(
              onPressed: clienteList.loadProducts,
              icon: const Icon(Icons.refresh)),
        ],
      ),
      body: ListView.builder(
        itemCount: clienteList.itemsCount,
        itemBuilder: (context, index) {
          final cliente = clienteList.items[index];
          return ListTile(
            title: Text(cliente.name),
            subtitle: Text(cliente.email),
          );
        },
      ),
    );
  }
}
