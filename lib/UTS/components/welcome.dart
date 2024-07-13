import 'package:flutter/material.dart';
import 'package:gojek/UTS/components/login.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Image.asset(
                'assets/images2/gojek/gojek/Gojek_logo_2019.svg.png',
                height: 100,
                width: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                children: [
                  Container(
                    height: 35,
                    width: 170,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Bahasa Indonesia',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                        side: MaterialStatePropertyAll(BorderSide(
                            color: const Color.fromARGB(255, 221, 221, 221))),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Image.asset(
                'assets/images2/gojek/gojek/IMG_4533-removebg.png',
                height: 200,
                fit: BoxFit.contain, // Ubah fit sesuai kebutuhan Anda
              ),
              const SizedBox(height: 20),
              Container(
                child: Text(
                  "Transportasi & logistik",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Container(
                width: 300,
                child: Text(
                  "Anterin kamu jalan atau ambilin barang lebih gampang tinggal ngeklik doang~",
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 75),
              Container(
                width: 450,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: const Text(
                    'Masuk',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.green.shade800),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: 450,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text(
                    'Belum ada akun? Daftar dulu',
                    style: TextStyle(
                        color: Color.fromARGB(255, 6, 100, 9),
                        fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    side: MaterialStatePropertyAll(BorderSide(
                        color: const Color.fromARGB(255, 61, 145, 64))),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                child: Text(
                  'Dengan masuk atau mendaftar, kamu menyetujui Ketentuan layanan dan Kebijakan pprivasi.',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
