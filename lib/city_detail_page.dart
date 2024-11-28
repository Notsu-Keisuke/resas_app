import 'package:flutter/material.dart';

class CityDetailPage extends StatelessWidget {
  const CityDetailPage({super.key, required this.city});

  final String city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(city),
      ),
      body: Center(
        child: Text('$city市区町村の詳細画面です'),
      ),
    );
  }
}
