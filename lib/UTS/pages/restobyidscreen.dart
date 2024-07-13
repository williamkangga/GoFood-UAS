import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gojek/UTS/food_backend/restobyid.dart';
import 'package:gojek/UTS/pages/transaksi.dart';
import 'package:http/http.dart' as http;
Map<String, dynamic> selectedMenu = {};
class RestoByIdWidget extends StatefulWidget {
  final String id;

  const RestoByIdWidget({Key? key, required this.id}) : super(key: key);

  @override
  State<RestoByIdWidget> createState() => _RestoByIdWidgetState();
}

class _RestoByIdWidgetState extends State<RestoByIdWidget> {
  RestoById? restaurant;
  List<int> _counters = [];
  bool _showCheckOutButton = false;

  static const String baseUrl = 'https://foodbe.vercel.app';

  @override
  void initState() {
    super.initState();
    fetchRestaurantById(widget.id);
  }

  Future<void> fetchRestaurantById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/resto/list/$id'));
    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      final decodedJson = json.decode(response.body);
      final restoModel = RestoById.fromJson(decodedJson);
      setState(() {
        restaurant = restoModel;
        _counters = List<int>.filled(restaurant!.data.menu.length, 0);
      });
      print('Fetched Data: $restaurant');
    } else {
      throw Exception('Failed to load restaurant by ID');
    }
  }

  void _updateCheckOutButtonVisibility() {
    setState(() {
      _showCheckOutButton = _counters.any((count) => count > 0);
    });
  }
  List<Map<String, dynamic>> _getSelectedMenuItems() {
  return restaurant!.data.menu
      .asMap()
      .map((index, menu) => MapEntry(
            index,
            {
              "restoid":restaurant,
              'id': menu.id,
              'name': menu.nama,
              'price': menu.harga,
              'gambar': menu.gambar,
              'quantity': _counters[index],
            },
          ))
      .values
      .toList();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
                color: Colors.blue,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_border_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.share),
              ),
            ],
          ),
        ],
      ),
      body: restaurant == null
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                Container(
                  height: 80,
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Container(
                        child: restaurant!.data.gambar.isNotEmpty
                            ? Image.network(
                                restaurant!.data.gambar,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(Icons.broken_image, size: 50);
                                },
                              )
                            : Icon(Icons.broken_image, size: 50),
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            restaurant!.data.nama,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.thumb_up),
                            label: Text("Super Partner"),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.orange.shade900),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.fromBorderSide(BorderSide(
                        color: Color.fromARGB(255, 220, 220, 220), width: 1.0)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
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
                                  Text("tiba 40-50 min")
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
                                  side:
                                      BorderSide(color: Colors.green.shade900),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.fromBorderSide(BorderSide(
                        color: Color.fromARGB(255, 220, 220, 220), width: 1.0)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Color.fromARGB(255, 9, 101, 1),
                                child: Image.asset(
                                  'assets/images2/gojek/gojek/voucher_3837136.png',
                                  width: 30,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ada 9 promo nganggur',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                                child: IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                  'assets/images2/gojek/gojek/right_2767192.png',
                                  width: 20),
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  //jika ingin memanggil menu apa saja yang ada di restoran gunakan seperti dibawah
                  itemCount: restaurant!.data.menu.length,
                  itemBuilder: (context, index) {
                    final menu = restaurant!.data.menu[index];
                    return Container(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 10),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        menu.nama,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      Text(
                                        menu.deskripsi,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color.fromARGB(255, 91, 91, 91),
                                        ),
                                      ),
                                      Text(
                                        "${menu.harga}",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Expanded(
                                  flex: 1,
                                  child: menu.gambar.isNotEmpty
                                      ? Image.network(
                                          menu.gambar,
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Icon(Icons.broken_image,
                                                size: 50);
                                          },
                                        )
                                      : Icon(Icons.broken_image, size: 50),
                                ),
                              ],
                            ),
                            Row(children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.favorite_outline),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    _counters[index]++;
                                    _updateCheckOutButtonVisibility();
                                  });
                                },
                                icon: Icon(Icons.add),
                              ),
                              SizedBox(width: 10),
                              Text("${_counters[index]}"),
                              SizedBox(width: 10),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (_counters[index] > 0) {
                                      _counters[index]--;
                                      _updateCheckOutButtonVisibility();
                                    }
                                  });
                                },
                                icon: Icon(Icons.remove),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.rice_bowl),
                              ),
                              Text("Bisa custom"),
                              SizedBox(
                                width: 10,
                              ),
                            ])
                          ],
                        ),
                      ),
                    );
                  },
                ),
                if (_showCheckOutButton)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        final selectedMenuItems = _getSelectedMenuItems();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Transaksi(
                              restoId: widget.id,
                              selectedMenuItems: selectedMenuItems,
                            ),
                          ),
                        );
                      },
                      child: Text("Check Out"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green.shade900),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}
