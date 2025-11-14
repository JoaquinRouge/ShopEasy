import 'package:flutter/material.dart';
import 'package:shop_easy/features/presentation/widgets/appbar.dart';
import 'package:shop_easy/features/presentation/widgets/bottomBar.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(child: Text("Cart"),),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}