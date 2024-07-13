import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gojek/UTS/components/gofood.dart';
import 'package:gojek/UTS/pages/restobyidscreen.dart';
import 'package:http/http.dart' as http;
import 'package:gojek/UTS/models/RestoModel.dart'; // Correct import for RestoByIdScreen

class Terdekat extends StatefulWidget {
  const Terdekat({super.key});

  @override
  State<Terdekat> createState() => _TerdekatState();
}

class _TerdekatState extends State<Terdekat> {
  int _selectedIndex = 0;
  List<Restaurant> _restaurants = [];
  bool _isLoading = false;
  String _errorMessage = '';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchRestaurantList();
  }

  Future<void> _fetchRestaurantList() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final response =
          await http.get(Uri.parse('https://foodbe.vercel.app/resto/list'));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final restoModel = RestoModel.fromJson(jsonResponse);
        setState(() {
          _restaurants = restoModel.data;
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Failed to load restaurant list';
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
              ? Center(child: Text(_errorMessage))
              : ListView(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          'assets/images2/terdekat/terdekat/banner.jpeg',
                          width: 450,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Gofood()), // Gantilah TargetPage dengan nama halaman tujuan
                              );
                            },
                            icon: Icon(Icons.arrow_back_outlined),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Terdekat",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      "Resto yummy di deket sini.",
                      style: TextStyle(fontSize: 13),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 40,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.tune_outlined,
                                color: Colors.black,
                                size: 14,
                              ),
                            ),
                            SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("Terdekat",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Colors.black)),
                            ),
                            SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("Bintang 4.5+",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Colors.black)),
                            ),
                            SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("Gojek PLUS",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Colors.black)),
                            ),
                            SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("Promo makanan",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Colors.black)),
                            ),
                            SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("Buka sekarang",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Colors.black)),
                            ),
                            SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("Pickup",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Colors.black)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    ..._restaurants
                        .map((restaurant) => ListTile(
                              leading: restaurant.gambar.isNotEmpty
                                  ? Image.network(
                                      restaurant.gambar,
                                      width: 60,
                                      height: 100,
                                      fit: BoxFit.fill,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Icon(Icons.broken_image,
                                            size: 60);
                                      },
                                    )
                                  : Icon(Icons.broken_image, size: 60),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    restaurant.nama,
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 4),
                                      Icon(Icons.check_circle_rounded,
                                          color: Colors.green, size: 12),
                                      SizedBox(width: 4),
                                      Icon(Icons.price_change, size: 16),
                                      Icon(Icons.price_change, size: 16),
                                      Icon(Icons.price_change, size: 16),
                                      Icon(Icons.price_change_outlined,
                                          size: 16),
                                      SizedBox(width: 4),
                                      Icon(Icons.star,
                                          color: Colors.amber, size: 14),
                                      Text(
                                        "4.7",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        "4.5 rb+ rating",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        "Diantar dalam 30-40 min",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                            color: Colors.black54),
                                      ),
                                      SizedBox(width: 5),
                                      Icon(Icons.circle,
                                          size: 4, color: Colors.black38),
                                      SizedBox(width: 5),
                                      Text(
                                        "${restaurant.jarak} km",
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.black38),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 6),
                                  Row(
                                    children: [
                                      Icon(Icons.percent_rounded,
                                          size: 14, color: Colors.black54),
                                      SizedBox(width: 5),
                                      Text(
                                        "Diskon 20%, maks.20rb",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RestoByIdWidget(
                                      id: restaurant.id,
                                    ),
                                  ),
                                );
                              },
                            ))
                        .toList(),
                  ],
                ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Eksplor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_walk),
            label: 'Pickup',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Cari',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.discount),
            label: 'Promo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 0, 166, 33),
        onTap: _onItemTapped,
      ),
    );
  }
}
