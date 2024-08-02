import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_front/models/cliente_model.dart';
import 'package:flutter_front/utils/constants.dart';
import 'package:http/http.dart' as http;

class ClienteList extends ChangeNotifier {
  final List<ClienteModel> _items = [];

  List<ClienteModel> get items => [..._items];
  int get itemsCount => _items.length;

  void loadProducts() async {
    _items.clear();

    final response = await http.get(
      Uri.parse(Constants.urlClientes),
    );

    if (response.body == 'null') return;

    final Map<String, dynamic> data = json.decode(response.body);

    data['clientes'].forEach((cliente) {
      _items.add(ClienteModel(
        id: cliente['id'],
        name: cliente['name'],
        email: cliente['email'],
        pix: cliente['pix'],
      ));
    });

    debugPrint('loadProducts: ${_items.length}');

    notifyListeners();
  }
}
