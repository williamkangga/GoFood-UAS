import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gojek/UTS/datas/icons.dart';
import 'package:gojek/UTS/theme.dart';
import 'package:gojek/UTS/components/gofood.dart'; // Import halaman GoFoodHome.dart

class MenuIcons extends StatelessWidget {
  const MenuIcons({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 27, right: 27, top: 32),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (final icon in menuIcons.sublist(0, 4))
                _buildIcon(
                    icon.icon, icon.title, icon.color, context), // Pass context
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (final icon in menuIcons.sublist(4, menuIcons.length))
                _buildIcon(
                    icon.icon, icon.title, icon.color, context), // Pass context
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(
      IconData icon, String title, Color? color, BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              if (icon == Icons.fastfood) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Gofood(),
                  ),
                );
              } else {}
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: icon == Icons.card_membership
                    ? Color(0xFF87027B)
                    : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: icon == Icons.card_membership
                  ? SvgPicture.asset(
                      'assets/icons/${Icons}.svg',
                      color: Colors.white,
                      width: 24,
                    )
                  : Icon(
                      icon,
                      color: color ?? const Color(0xFF4A4A4A),
                      size: 24,
                    ),
            ),
          ),
          const SizedBox(height: 9),
          Text(
            title,
            style: regular12_5.copyWith(color: dark2),
          ),
        ],
      ),
    );
  }
}
