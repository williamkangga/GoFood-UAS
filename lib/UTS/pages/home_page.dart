import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gojek/UTS/components/aksescepat.dart';
import 'package:gojek/UTS/components/goclub.dart';
import 'package:gojek/UTS/components/gopay.dart';
import 'package:gojek/UTS/components/gopay_later.dart';
import 'package:gojek/UTS/components/menu_icons.dart';
import 'package:gojek/UTS/components/search.dart';
import 'package:gojek/UTS/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedTab = 'Beranda';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: green2,
        elevation: 0,
        toolbarHeight: 71,
        title: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: green1,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      'Beranda',
                      style: semibold14.copyWith(color: green1),
                    ),
                  ),
                  SizedBox(width: 10), // Spacer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton('Promo'),
                      SizedBox(width: 18), // Adjusted Spacer
                      buildButton('Pesanan', onTap: () {
                        Navigator.pushNamed(context, '/riwayat');
                      }),
                      SizedBox(width: 16), // Spacer
                      buildButton('Chat'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Search(),
            Gopay(),
            MenuIcons(),
            GoClub(),
            AksesCepat(),
            GopayLater(),
          ],
        ),
      ),
    );
  }

  Widget buildButton(String title, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = title;
        });
        if (onTap != null) onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: _selectedTab == title ? green1 : Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          title,
          style: semibold14.copyWith(
            color: _selectedTab == title ? Colors.white : dark1,
          ),
        ),
      ),
    );
  }
}
