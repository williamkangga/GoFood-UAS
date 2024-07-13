import 'package:flutter/material.dart';
import 'package:gojek/UTS/components/detailriwayat.dart';

class riwayat extends StatefulWidget {
  const riwayat({super.key});

  @override
  State<riwayat> createState() => _riwayatState();
}

// ignore: camel_case_types
class _riwayatState extends State<riwayat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                //row 1
                Row(children: [
                  //item1
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Pesanan",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                  const Spacer(),
                  //item2
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.question_mark),
                    iconSize: 20,
                  ),
                  //item3
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.download_for_offline_rounded),
                    iconSize: 22,
                  )
                ]),
                const Divider(),
                //row2
                Row(
                  children: [
                    //item 1
                    ToggleUnderlineTextButton(
                      onPressed: () {},
                      text: "Riwayat",
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      underlineColor: Color.fromARGB(255, 34, 136, 37),
                    ),
                    //item 2
                    ToggleUnderlineTextButton(
                      onPressed: () {},
                      text: "Dalam proses",
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      underlineColor: const Color.fromARGB(255, 34, 136, 37),
                    ),
                    //item 3
                    ToggleUnderlineTextButton(
                      onPressed: () {},
                      text: "Terjadwal",
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      underlineColor: const Color.fromARGB(255, 34, 136, 37),
                    ),
                    //item 4
                    ToggleUnderlineTextButton(
                      onPressed: () {},
                      text: "Draft",
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      underlineColor: const Color.fromARGB(255, 34, 136, 37),
                    ),
                  ],
                ),
                //row 3
                const Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    MyButton(text: "Gocar"),
                    SizedBox(
                      width: 5,
                    ),
                    MyButton(text: "GoFood"),
                    SizedBox(
                      width: 5,
                    ),
                    MyButton(text: "GoRide"),
                    SizedBox(
                      width: 5,
                    ),
                    MyButton(text: "Status")
                  ],
                ),
                //row 4
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor:
                            const Color.fromARGB(255, 237, 237, 237),
                        minimumSize: Size(
                            370, 50), // Memberikan ukuran minimum pada tombol
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.wallet_outlined,
                            color: Colors.blue,
                          ),
                          SizedBox(
                              width:
                                  8), // Memberikan jarak antara ikon dan teks
                          Text(
                            'Transaksi Gopay',
                            style: TextStyle(color: Colors.black),
                          ),
                          Icon(
                            Icons.arrow_right_outlined,
                            color: Colors.black,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                //row 5
                //riwayat 1
                ListTile(
                  leading: Column(
                    children: [
                      const Text(
                        "1 May, 21.53",
                        style: TextStyle(fontSize: 9),
                      ),
                      Image.asset(
                        'images2/logobk.jpg',
                        height: 32,
                      )
                    ],
                  ),
                  title: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Text(
                          "Burger King",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Spacer(),
                      ]),
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                          ),
                          Text(
                            "Makanan udah sampai",
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      )
                    ],
                  ),
                  trailing: Column(
                    children: [
                      const Text(
                        "Rp123.000",
                        style: TextStyle(fontSize: 10),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 28, 110, 31),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5)),
                          child: const Text(
                            'Pesan lagi',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 10),
                          )),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const detailriwayat()), // Ganti DetailPage() dengan halaman tujuan Anda
                    );
                  },
                ),
                //riwayat 2
                ListTile(
                  leading: const Column(
                    children: [
                      Text(
                        "29 April, 21.53",
                        style: TextStyle(fontSize: 9),
                      ),
                      Icon(Icons.car_crash, size: 30, color: Colors.green)
                    ],
                  ),
                  title: const Column(
                    children: [
                      Row(children: [
                        Text(
                          "CenterPoint Mall",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Spacer(),
                      ]),
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                          ),
                          Text(
                            "Perjalanan Selesai",
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      )
                    ],
                  ),
                  trailing: Column(
                    children: [
                      const Text(
                        "Rp.19.500",
                        style: TextStyle(fontSize: 11),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 28, 110, 31),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5)),
                          child: const Text(
                            'Pesan lagi',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 10),
                          )),
                    ],
                  ),
                  onTap: () {},
                ),
                //riwayat 3
                ListTile(
                  leading: const Column(
                    children: [
                      Text(
                        "22 April, 17.30",
                        style: TextStyle(fontSize: 9),
                      ),
                      Icon(Icons.motorcycle_rounded,
                          size: 30, color: Colors.green)
                    ],
                  ),
                  title: const Column(
                    children: [
                      Row(children: [
                        Text(
                          "Universitas Mikroskil",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Spacer(),
                      ]),
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                          ),
                          Text(
                            "Perjalanan Selesai",
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      )
                    ],
                  ),
                  trailing: Column(
                    children: [
                      const Text(
                        "Rp.8.500",
                        style: TextStyle(fontSize: 11),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 28, 110, 31),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5)),
                          child: const Text(
                            'Pesan lagi',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 10),
                          )),
                    ],
                  ),
                  onTap: () {},
                ),
                //riwayat 4
                ListTile(
                  leading: const Column(
                    children: [
                      Text(
                        "20 April, 14.50",
                        style: TextStyle(fontSize: 9),
                      ),
                      Icon(Icons.car_crash_rounded,
                          size: 30, color: Colors.green)
                    ],
                  ),
                  title: const Column(
                    children: [
                      Row(children: [
                        Text(
                          "Delipark",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Spacer(),
                      ]),
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                          ),
                          Text(
                            "Perjalanan Selesai",
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      )
                    ],
                  ),
                  trailing: Column(
                    children: [
                      const Text(
                        "Rp.22.000",
                        style: TextStyle(fontSize: 11),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 28, 110, 31),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5)),
                          child: const Text(
                            'Pesan lagi',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 10),
                          )),
                    ],
                  ),
                  onTap: () {},
                ),
                //riwayat 5
                ListTile(
                  leading: const Column(
                    children: [
                      Text(
                        "15 April, 17.30",
                        style: TextStyle(fontSize: 9),
                      ),
                      Icon(Icons.motorcycle_rounded,
                          size: 30, color: Colors.green)
                    ],
                  ),
                  title: const Column(
                    children: [
                      Row(children: [
                        Text(
                          "Universitas Mikroskil",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Spacer(),
                      ]),
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                          ),
                          Text(
                            "Perjalanan Selesai",
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      )
                    ],
                  ),
                  trailing: Column(
                    children: [
                      const Text(
                        "Rp.8.500",
                        style: TextStyle(fontSize: 11),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 28, 110, 31),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5)),
                          child: const Text(
                            'Pesan lagi',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 10),
                          )),
                    ],
                  ),
                  onTap: () {},
                ),
                //riwayat 6
                ListTile(
                  leading: Column(
                    children: [
                      const Text(
                        "10 April, 19.30",
                        style: TextStyle(fontSize: 9),
                      ),
                      Image.asset(
                        "images2/apj.jpg",
                        height: 33,
                      ),
                    ],
                  ),
                  title: const Column(
                    children: [
                      Row(children: [
                        Text(
                          "Ayam Penyet Jakarta",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Spacer(),
                      ]),
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                          ),
                          Text(
                            "Makanan udah sampai",
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      )
                    ],
                  ),
                  trailing: Column(
                    children: [
                      const Text(
                        "Rp.45.000",
                        style: TextStyle(fontSize: 11),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 28, 110, 31),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5)),
                          child: const Text(
                            'Pesan lagi',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 10),
                          )),
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// class button untuk item row 2
class ToggleUnderlineTextButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final TextStyle textStyle;
  final Color underlineColor;

  const ToggleUnderlineTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.textStyle,
    required this.underlineColor,
  }) : super(key: key);

  @override
  _ToggleUnderlineTextButtonState createState() =>
      _ToggleUnderlineTextButtonState();
}

class _ToggleUnderlineTextButtonState extends State<ToggleUnderlineTextButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          _isPressed = !_isPressed; // Mengubah status tombol
        });
        widget.onPressed(); // Memanggil fungsi onPressed
      },
      style: ButtonStyle(
        textStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) {
            // Jika tombol ditekan, tambahkan atau hilangkan garis bawah
            if (_isPressed) {
              return TextStyle(
                decorationColor: widget.underlineColor,
                decoration: TextDecoration.underline,
              ).merge(widget.textStyle);
            }
            return widget.textStyle;
          },
        ),
      ),
      child: Text(widget.text, style: widget.textStyle),
    );
  }
}

// class button untuk item row 3
class MyButton extends StatefulWidget {
  final String text;

  const MyButton({Key? key, required this.text}) : super(key: key);

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _isPressed = !_isPressed; // Toggle status tombol
        });
      },
      style: ElevatedButton.styleFrom(
        fixedSize: Size(90, 30), // Atur ukuran sesuai kebutuhan
        // Atur properti lain seperti warna, borderRadius, dsb.
        backgroundColor:
            _isPressed ? Color.fromARGB(255, 34, 136, 37) : Colors.white70,
      ),
      child: Text(
        widget.text,
        style: TextStyle(
            color: _isPressed ? Colors.white : Colors.black, fontSize: 10),
      ),
      // Gunakan teks dari properti text
    );
  }
}
