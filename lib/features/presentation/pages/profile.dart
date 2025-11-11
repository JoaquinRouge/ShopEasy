import 'package:flutter/material.dart';
import 'package:shop_easy/features/presentation/widgets/appbar.dart';
import 'package:shop_easy/features/presentation/widgets/bottomBar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text("Profile Screen"),
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}