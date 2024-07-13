// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gojek/UTS/theme.dart';

class AksesCepat extends StatelessWidget {
  const AksesCepat({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 16, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Akses cepat',
            style: bold18.copyWith(color: dark1),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: const Color(0xFFE8E8E8)),
            ),
            child: Column(
              children: [
                ...[
                  'Pintu masuk motor, Sun Plaza',
                  'Pintu keluar motor, Sun Plaza'
                ].map((text) => Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            width: 27,
                            height: 27,
                            decoration: BoxDecoration(
                              color: green2,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.two_wheeler,
                                color: Colors.white,
                                size: 17,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              text,
                              style: regular14.copyWith(color: dark1),
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
