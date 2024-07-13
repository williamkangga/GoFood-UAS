import 'package:flutter/material.dart';

class GojekIcon {
  final IconData icon;
  final String title;
  final Color? color;

  const GojekIcon({required this.icon, required this.title, this.color});
}

List<GojekIcon> gopayIcons = [
  const GojekIcon(icon: Icons.payments, title: 'Bayar'),
  const GojekIcon(icon: Icons.monetization_on, title: 'Top Up'),
  const GojekIcon(icon: Icons.explore, title: 'Eksplor')
];

List<GojekIcon> menuIcons = [
  const GojekIcon(
      icon: Icons.two_wheeler, title: 'GoRide', color: Colors.green),
  const GojekIcon(icon: Icons.local_taxi, title: 'GoCar', color: Colors.green),
  const GojekIcon(icon: Icons.fastfood, title: 'GoFood', color: Colors.red),
  const GojekIcon(
      icon: Icons.local_shipping, title: 'GoSend', color: Colors.green),
  const GojekIcon(
      icon: Icons.shopping_cart, title: 'GoMart', color: Colors.red),
  const GojekIcon(
      icon: Icons.phone_android, title: 'GoPulsa', color: Colors.blue),
  const GojekIcon(
      icon: Icons.star_purple500_sharp, title: 'GoClub', color: Colors.purple),
  const GojekIcon(icon: Icons.more_vert, title: 'Lainnya', color: Colors.black),
];
