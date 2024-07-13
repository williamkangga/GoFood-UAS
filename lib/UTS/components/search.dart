// ignore_for_file: dead_code, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gojek/UTS/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gojek/UTS/components/profil.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 23, left: 15, right: 15),
      child: Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFFAFAFA),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: const Color(0xFFE8E8E8),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Cari layanan, makanan, & tujuan',
                    style: regular14.copyWith(color: dark3),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          InkWell(
            onTap: () {
              // Navigasi ke halaman profil
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profil()),
              );
            },
            child: SizedBox(
              width: 35,
              height: 35,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35 / 2)),
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset('assets/images2/Avatar.png'),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35 / 2),
                          color: const Color(0xFFD1E7EE)),
                      clipBehavior: Clip.hardEdge,
                      child: SvgPicture.asset(
                        'assets/icons/goclub.svg',
                        color: blue3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
