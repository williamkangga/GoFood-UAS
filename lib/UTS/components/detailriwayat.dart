import 'package:flutter/material.dart';
import 'package:gojek/UTS/components/riwayat.dart';

class detailriwayat extends StatefulWidget {
  const detailriwayat({super.key});

  @override
  State<detailriwayat> createState() => _detailriwayatState();
}

class _detailriwayatState extends State<detailriwayat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //row 1
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  riwayat()), // Ganti DetailPage() dengan halaman tujuan Anda
                        );
                      },
                      icon: Icon(Icons.arrow_back)),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Rangkuman pesanan",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              //row 2
              Row(
                children: [
                  Column(children: [
                    Row(
                      children: [
                        //item 1
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.food_bank_outlined,
                          color: Colors.red,
                        ),
                        Text(
                          "gofood",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 160,
                        ),
                        //item 3
                        Text(
                          "Jumat, 26 Apr, 11:45",
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                    //item3
                    Row(
                      children: [
                        Text(
                          "Makanan udah diantar",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Pesanan F-2437213172"),
                      ],
                    ),
                  ]),
                ],
              ),
              Divider(),
              //row3
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  SizedBox(
                    width: 500,
                  ),
                  Text(
                    "Kasih rating ke Driver?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    "(1 mengecewakan, 5 mantap!)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  StarRating(
                    starCount: 5,
                    rating: 3.5,
                    fillColor: Colors.amber,
                    emptyColor: Colors.grey,
                    size: 40,
                    onRatingChanged: (newRating) {
                      print('New Rating: $newRating');
                    },
                  ),
                ],
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),

              //row4

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                      radius: 15, // Atur radius sesuai keinginan
                      backgroundImage: AssetImage('images/Profile.jpg')),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        "Ferdi Sugianto",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "BK 121 AN",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              //row5
              Divider(),
              SizedBox(
                height: 8,
              ),
              //item 1
              Text(
                "Detail pengantaran",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              //item2
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.food_bank_outlined,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Alamat Restoran",
                        style: TextStyle(fontSize: 10),
                      ),
                      Text("Burger King, Center point",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold))
                    ],
                  ),
                ],
              ),
              //item 3
              Icon(
                Icons.more_vert,
                color: const Color.fromARGB(255, 201, 201, 201),
              ),
              //item 4
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.stop_circle_outlined,
                    color: Colors.amber,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Alamat Pengantaran",
                          style: TextStyle(fontSize: 10)),
                      Text("Rumah Medan",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              ),
              Divider(),
              //row
              Text(
                "Detail Pesanan,",
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Burger Deluxe",
                    style: TextStyle(fontSize: 10),
                  ),
                  Text("1", style: TextStyle(fontSize: 10))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Coca Cola",
                    style: TextStyle(fontSize: 10),
                  ),
                  Text("1", style: TextStyle(fontSize: 10))
                ],
              ),
              Divider(),
              Text("Tanpa alat makan / sedotan",
                  style: TextStyle(fontSize: 10)),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Harga",
                    style: TextStyle(fontSize: 10),
                  ),
                  Text("500.000.000", style: TextStyle(fontSize: 10))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Biaya Penangan dan Pengiriman",
                    style: TextStyle(fontSize: 10),
                  ),
                  Text("11.000.000", style: TextStyle(fontSize: 10))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Biaya Lainnya",
                    style: TextStyle(fontSize: 10),
                  ),
                  Text("100.000", style: TextStyle(fontSize: 10))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Diskon",
                    style: TextStyle(fontSize: 10),
                  ),
                  Text("-100.000", style: TextStyle(fontSize: 10))
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Pembayaran",
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                  Text("499.999.000",
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.bold))
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Bayar Pakai Gopay",
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                  Text("499.999.000",
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Tambahkan fungsi yang akan dijalankan saat tombol ditekan
                    },
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(
                          width: 1,
                          color: Colors.green), // Mengatur garis pinggir
                      padding: EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20), // Mengatur padding
                    ),
                    child: Text(
                      'Download Bukti',
                      style: TextStyle(
                          fontSize: 13, // Mengatur ukuran teks
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(
                              255, 0, 138, 5) // Mengatur ketebalan teks
                          ),
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Tambahkan fungsi yang akan dijalankan saat tombol ditekan
                    },
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(
                            width: 1,
                            color: Colors.green), // Mengatur garis pinggir
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        fixedSize: Size(150, 30) // Mengatur padding
                        ),
                    child: Text(
                      'Bantuan',
                      style: TextStyle(
                          fontSize: 13, // Mengatur ukuran teks
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(
                              255, 0, 138, 5) // Mengatur ketebalan teks
                          ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Tambahkan fungsi yang akan dijalankan saat tombol ditekan
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 0, 138, 5), // Mengatur warna latar belakang
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      fixedSize: Size(150, 30), // Mengatur padding
                    ),
                    child: Text(
                      'Pesan lagi',
                      style: TextStyle(
                        fontSize: 13, // Mengatur ukuran teks
                        fontWeight: FontWeight.bold, // Mengatur ketebalan teks
                        color: Colors.white, // Mengatur warna teks
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

//class untuk rating (bintang)
class StarRating extends StatefulWidget {
  final int starCount;
  final double rating;
  final Color fillColor;
  final Color emptyColor;
  final double size;
  final Function(double) onRatingChanged;

  const StarRating({
    Key? key,
    required this.starCount,
    required this.rating,
    required this.fillColor,
    required this.emptyColor,
    required this.onRatingChanged,
    this.size = 24,
  }) : super(key: key);

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  late double currentRating;

  @override
  void initState() {
    super.initState();
    currentRating = widget.rating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.starCount, (index) {
        return GestureDetector(
          onTap: () {
            final newRating = index + 1.0;
            setState(() {
              currentRating = newRating;
            });
            widget.onRatingChanged(newRating);
          },
          child: Icon(
            index < currentRating.floor()
                ? Icons.star
                : index < currentRating
                    ? Icons.star_half
                    : Icons.star_border,
            color: index < currentRating ? widget.fillColor : widget.emptyColor,
            size: widget.size,
          ),
        );
      }),
    );
  }
}
