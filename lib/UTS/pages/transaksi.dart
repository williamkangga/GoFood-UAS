import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gojek/UTS/components/gofood.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class Transaksi extends StatefulWidget {
  final String restoId;
  final List<Map<String, dynamic>> selectedMenuItems;

  const Transaksi({
    Key? key,
    required this.restoId,
    required this.selectedMenuItems,
  }) : super(key: key);

  @override
  _TransaksiState createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  int quantity = 1;
  final _deliveryAddressController = TextEditingController();
  final _paymentMethodController = TextEditingController(text: 'Credit Card');
  final _promoController = TextEditingController();
  final String baseUrl = 'https://foodbe.vercel.app';

  @override
  void dispose() {
    _deliveryAddressController.dispose();
    _paymentMethodController.dispose();
    super.dispose();
  }

  double _calculateTotalPrice() {
    double total = 0.0;
    widget.selectedMenuItems.forEach((menuItem) {
      double price = double.parse(menuItem['price'].toString());
      int quantity = menuItem['quantity'];
      total += price * quantity;
    });
    return total;
  }

  Future<void> createTransaction({
    required String restoId,
    required List<Map<String, dynamic>> selectedMenuItems,
    required String paymentMethod,
    required String deliveryAddress,
  }) async {
    final url = Uri.parse('$baseUrl/transaction/create');
    final body = jsonEncode({
      'restoId': restoId,
      'items': selectedMenuItems.map((item) {
        return {
          'menuId': item['menuId'],
          'quantity': item['quantity'],
        };
      }).toList(),
      'paymentMethod': paymentMethod,
      'alamatPengiriman': deliveryAddress,
    });

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        // Handle successful transaction creation
        print('Transaction created successfully.');
      } else {
        throw Exception('Failed to create transaction.');
      }
    } catch (e) {
      throw Exception('Failed to create transaction: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = _calculateTotalPrice();
    return Scaffold(
      appBar: AppBar(
        title: Text('Burger King Order'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Burger King, Centre Point Mall'),
                Icon(
                  Icons.thumb_up_alt_rounded,
                  color: Colors.yellow[900],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color.fromARGB(255, 9, 101, 1),
                    child: Image.asset(
                      'assets/images2/gojek/gojek/scooter.978x1024.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pesan antar',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text("tiba 30-40 min")
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "Ganti",
                      style: TextStyle(
                          color: Colors.green.shade900,
                          fontWeight: FontWeight.w900,
                          fontSize: 13),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.green.shade900),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15,),
          // Delivery options
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Text('Regular 30-40 min'),
              ],
            ),
          ),
          SizedBox(height: 16),

          // Address
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Alamat pengantaran',
                  style: TextStyle(fontSize: 12),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Universitas Mikroskil',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        "Ganti Alamat",
                        style: TextStyle(
                            color: Colors.green.shade900,
                            fontWeight: FontWeight.w900,
                            fontSize: 13),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.green.shade900),
                      ),
                    ),
                  ],
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    "Isi detail alamat biar driver gampang cari alamatmu pas antar makanan",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 151, 71, 0),
                        fontSize: 10),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Color.fromARGB(255, 151, 71, 0)),
                  ),
                ),
                TextField(
                  controller: _deliveryAddressController,
                  decoration: InputDecoration(
                      labelText: 'Isi detail alamat',
                      hintText: 'Rumah Pagar Biru'),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),

          // Menu item
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.selectedMenuItems.length,
            itemBuilder: (context, index) {
              final menuItem = widget.selectedMenuItems[index];
              return ListTile(
                leading: Image.network(
                  menuItem[
                      'gambar'], // Ganti dengan atribut yang sesuai dari menuItem
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons
                        .error); // Widget fallback jika gambar tidak bisa dimuat
                  },
                ),
                title: Text(menuItem['name']),
                subtitle:
                    Text('Rp. ${menuItem['price']} x ${menuItem['quantity']}'),
                trailing:
                    Text('Rp. ${menuItem['price'] * menuItem['quantity']}'),
              );
            },
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Promo"),
                TextField(
                  controller: _promoController,
                  decoration: InputDecoration(
                      labelText: 'Masukkan Kode Promo', hintText: 'NewUser123'),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),

          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Total: Rp $totalPrice'),
                TextField(
                  controller: _paymentMethodController,
                  decoration: InputDecoration(
                    labelText: 'Payment Method',
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Ringkasan pembayaran'),
                    Text('VISA'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Harga'),
                    Text('Rp $totalPrice'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Biaya Penanganan dan Pengiriman'),
                    Text('Rp 19.700'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Biaya lainnya'),
                    Text('Rp 14.500'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total pembayaran'),
                    Text('Rp ${totalPrice + 19700 + 14500}'),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Jangan kelewatan Flash Sale! Kelar jam 21:00',
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
                SizedBox(height: 16),
                Text(
                  'Hijaukan Bumi sambil mam enak~ Cuma Rp1.000 tiap beli GoFood',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  '✰ Yay! Kamu hemat 13.300 untuk pembelian ini.',
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              final paymentMethod = _paymentMethodController.text;
              final deliveryAddress = _deliveryAddressController.text;
              createTransaction(
                restoId: widget.restoId,
                selectedMenuItems: widget.selectedMenuItems,
                paymentMethod: paymentMethod,
                deliveryAddress: deliveryAddress,
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Gofood()),
              );
            },
            child: Text('Create Transaction'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green.shade900),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
