import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _submitCredentials() async {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      try {
        final response = await http.post(
          Uri.parse('https://foodbe.vercel.app/register'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: '{"username": "$username", "password": "$password"}',
        );

        if (response.statusCode == 200) {
          Navigator.pushReplacementNamed(context, '/home');
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
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Username dan password tidak boleh kosong')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row 1
                Row(
                  children: [
                    // Item 1
                    IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                    Spacer(),
                    // Item 2
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.question_mark_rounded),
                      iconSize: 15,
                    ),
                    // Item 3
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        backgroundColor: Colors.white,
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.language, color: Colors.black87),
                          Text(
                            "Bahasa Indonesia",
                            style: TextStyle(fontSize: 13, color: Colors.black87),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15),
                // Row 2
                // Item 1
                Text(
                  "Selamat datang di Gojek!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                ),
                // Item 2
                Text(
                  "Masuk atau daftar hanya dalam beberapa langkah mudah ",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
                SizedBox(height: 15),
                // Row 3
                Row(
                  children: [
                    // Item 1
                    Text(
                      'Username',
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                    // Item 2
                    Text(
                      '*',
                      style: TextStyle(fontSize: 13, color: Colors.red),
                    )
                  ],
                ),
                // Row 4
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: "Username",
                          hintText: "Masukkan username",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Row 5
                Row(
                  children: [
                    // Item 1
                    Text(
                      'Password',
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                    // Item 2
                    Text(
                      '*',
                      style: TextStyle(fontSize: 13, color: Colors.red),
                    )
                  ],
                ),
                // Row 6
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Masukkan password",
                        ),
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Row 7
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _submitCredentials,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: const Color.fromARGB(
                              255, 28, 110, 31), // Green color
                        ),
                        child: Text(
                          'Lanjut',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Row 8
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Text("Saya menyetujui "),
                    Text(
                      "Ketentuan Layanan",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: const Color.fromARGB(255, 28, 110, 31),
                      ),
                    ),
                    Text(" & "),
                    Text(
                      "Kebijakan Privasi ",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: const Color.fromARGB(255, 28, 110, 31),
                      ),
                    ),
                    Text("Gojek"),
                  ],
                ),
                SizedBox(height: 15),
                // Row 9
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  child: Text(
                    'Ada kendala atau lupa username?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                // Row 10
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "From",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "goto",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
