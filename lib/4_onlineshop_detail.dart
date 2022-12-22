import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uts/3_onlineshop_model.dart';
import 'package:uts/2_login_page.dart';

class OnlineShopDetail extends StatelessWidget {
  final OnlineShopModel onlineshopModel;
  const OnlineShopDetail({super.key, required this.onlineshopModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.network(onlineshopModel.pictureId),
            const SizedBox(
              height: 24,
            ),
            Text(
              onlineshopModel.name,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24.0,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              onlineshopModel.description,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.0,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
