import 'package:flutter/material.dart';
import 'package:gojek/UTS/theme.dart';

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 20),
            const Text(
              'Akun',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildMenuItem(
              Icons.shopping_bag,
              'Pesanan',
            ),
            _buildMenuItem(Icons.subscriptions, 'Langgananku'),
            _buildMenuItem(Icons.local_offer, 'Promo'),
            _buildMenuItem(Icons.credit_card, 'Cara Pembayaran'),
            _buildMenuItem(Icons.help_outline, 'Bantuan & Laporan Saya'),
            _buildMenuItem(Icons.business_center, 'Profil Bisnis'),
            _buildMenuItem(Icons.language, 'Pilihan Bahasa'),
            _buildMenuItem(Icons.bookmark_border, 'Alamat Favorit'),
            _buildMenuItem(Icons.accessibility, 'Aksesibilitas'),
            _buildMenuItem(Icons.person_add, 'Ajak Teman, dapat voucher'),
            _buildMenuItem(Icons.notifications, 'Notifikasi'),
            _buildMenuItem(Icons.security, 'Keamanan Akun'),
            _buildMenuItem(Icons.settings, 'Pengaturan Akun'),
            _buildMenuItem(Icons.description, 'Ketentuan dan Privasi'),
            _buildMenuItem(Icons.star, 'Beri Kami Nilai'),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/images2/avatar.png'),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'William',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text('kanggwilliam@gmail.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF999798),
                  )),
              Text(
                '+6281362422359',
                style: TextStyle(fontSize: 16, color: Color(0xFF999798)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData iconData, String text) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    iconData,
                    size: 24,
                    color: green1,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    text,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
