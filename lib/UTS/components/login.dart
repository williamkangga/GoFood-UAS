import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:gojek/UTS/pages/home_page.dart';
 
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
 
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
 
class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isButtonEnabled = false;
 
  @override
  void initState() {
    super.initState();
    usernameController.addListener(checkInputLength);
    passwordController.addListener(checkInputLength);
  }
 
  void checkInputLength() {
    setState(() {
      isButtonEnabled = usernameController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }
 
  Future<void> _submitCredentials() async {
    final String username = usernameController.text;
    final String password = passwordController.text;
 
    if (username.isNotEmpty && password.isNotEmpty) {
      try {
        final response = await http.post(
          Uri.parse('https://foodbe.vercel.app/login'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: '{"username": "$username", "password": "$password"}',
        );
 
        if (response.statusCode == 200) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false,
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Gagal mendaftarkan: ${response.body}')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Terjadi kesalahan: $e')),
        );
      }
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 255, 255, 255)),
                        side: MaterialStatePropertyAll(BorderSide(
                            color: const Color.fromARGB(255, 221, 221, 221))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Text(
                "Selamat datang di Gojek!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
              ),
            ),
            SizedBox(height: 5),
            Container(
              child: Text(
                "Masuk hanya dalam beberapa langkah mudah.",
                style: TextStyle(
                    color: const Color.fromARGB(255, 119, 119, 119),
                    fontSize: 15),
              ),
            ),
            SizedBox(height: 15),
            Container(
              child: Text(
                "Username",
                style: TextStyle(
                    color: const Color.fromARGB(255, 88, 88, 88),
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: usernameController,
                    onChanged: (value) {
                      setState(() {
                        isButtonEnabled = usernameController.text.isNotEmpty && passwordController.text.isNotEmpty;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Masukkan username anda',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              child: Text(
                "Password",
                style: TextStyle(
                    color: const Color.fromARGB(255, 88, 88, 88),
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: passwordController,
                    onChanged: (value) {
                      setState(() {
                        isButtonEnabled = usernameController.text.isNotEmpty && passwordController.text.isNotEmpty;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Masukkan password anda',
                    ),
                    obscureText: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: 300,
              child: ElevatedButton(
                onPressed: isButtonEnabled ? _submitCredentials : null,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return const Color.fromARGB(255, 205, 205, 205); // Warna tombol saat dinonaktifkan
                      }
                      return Color.fromARGB(255, 42, 141, 45); // Warna tombol saat diaktifkan
                    },
                  ),
                ),
                child: const Text('Lanjut',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: 16),
            Container(
              child: Text(
                'Saya menyetujui Ketentuan Layanan & Kebijakan Privasi Gojek.',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
              ),
            ),
            SizedBox(height: 16),
            Container(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Ada kendala atau lupa nomor?',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 255, 255, 255)),
                    side: MaterialStatePropertyAll(BorderSide(
                        color: const Color.fromARGB(255, 221, 221, 221)))),
              ),
            ),
            const SizedBox(height: 10),
            Image.asset(
              'assets/images2/gojek/gojek/logogoto.png',
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
 
 