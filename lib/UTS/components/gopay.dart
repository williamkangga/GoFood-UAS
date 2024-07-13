import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:gojek/UTS/datas/icons.dart';
import 'package:gojek/UTS/theme.dart';

class Gopay extends StatelessWidget {
  const Gopay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 7, top: 15),
      child: Container(
        height: 112,
        decoration: BoxDecoration(
          color: blue1,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:
              MainAxisAlignment.spaceEvenly, // Main axis alignment
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 2,
                    height: 8,
                    decoration: BoxDecoration(
                      color: const Color(0xFFBBBBBB),
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    width: 2,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10), // Added SizedBox for spacing
            Column(
              children: [
                Container(
                  height: 11,
                  width: 118,
                  decoration: const BoxDecoration(
                    color: Color(0xFF9CCDDB),
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(8)),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 82,
                  width: 132,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 9),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images2/gopay.png',
                        height: 14,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Rp56.800',
                        style: bold16.copyWith(color: dark1),
                      ),
                      Text(
                        'Klik & cek riwayat',
                        style: semibold12_5.copyWith(color: green1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10), // Added SizedBox for spacing
            Expanded(
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // Main axis alignment
                children: [
                  const SizedBox(width: 5), // Added SizedBox for spacing
                  ...gopayIcons.map(
                    (icon) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              icon.icon,
                              color: blue1,
                              size: 24,
                            ),
                          ),
                          const SizedBox(height: 7),
                          Text(
                            icon.title,
                            style: semibold14.copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10), // Added SizedBox for spacing
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
