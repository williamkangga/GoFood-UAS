// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TransactionCreationScreen extends StatefulWidget {
  final String restoId;
  final String menuId;
  final int quantity;
  final String paymentMethod;
  final String deliveryAddress;

  const TransactionCreationScreen({
    Key? key,
    required this.restoId,
    required this.menuId,
    required this.quantity,
    required this.paymentMethod,
    required this.deliveryAddress,
  }) : super(key: key);

  @override
  _TransactionCreationScreenState createState() =>
      _TransactionCreationScreenState();
}

class _TransactionCreationScreenState extends State<TransactionCreationScreen> {
  final String baseUrl = 'https://foodbe.vercel.app';

  Future<void> createTransaction() async {
    final url = Uri.parse('$baseUrl/transaction/create');
    final body = jsonEncode({
      'restoId': widget.restoId,
      'items': [
        {'menuId': widget.menuId, 'quantity': widget.quantity}
      ],
      'paymentMethod': widget.paymentMethod,
      'alamatPengiriman': widget.deliveryAddress,
    });

    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'}, body: body);

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('Transaction created successfully!');
      }
      // Handle success here, such as navigating to another screen
    } else {
      throw Exception('Failed to create transaction');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Transaction'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            createTransaction();
          },
          child: const Text('Create Transaction'),
        ),
      ),
    );
  }
}
