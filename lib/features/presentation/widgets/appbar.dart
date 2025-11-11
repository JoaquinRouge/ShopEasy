import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shop_easy/core/theme/app_colors.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 120);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      toolbarHeight: 300,
      titleSpacing: 10, // elimina espacio a los costados del title
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 38,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      controller: _searchController,
                      style: const TextStyle(color: Colors.black),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: 'Buscar en ShopEasy',
                        hintStyle: TextStyle(
                          color: AppColors.textSecondaryColor,
                          fontSize: 14,
                        ),
                        isDense: true,
                        prefixIcon: HeroIcon(
                          HeroIcons.magnifyingGlass,
                          color: AppColors.textSecondaryColor,
                        ),
                        border: InputBorder.none,
                        //contentPadding: EdgeInsets.symmetric(vertical: 0),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                IconButton(
                  onPressed: () {},
                  icon: const HeroIcon(
                    HeroIcons.shoppingCart,
                    style: HeroIconStyle.solid,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            SizedBox(height: 12),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(),
                SizedBox(width: 10),
                Text("Usuario", style: TextStyle(fontSize: 16)),
              ],
            ),

            SizedBox(height: 12),

            Row(
              children: [
                HeroIcon(HeroIcons.mapPin),
                Text("Direccion", style: TextStyle(fontSize: 15)),
                SizedBox(width: 5),
                HeroIcon(HeroIcons.chevronRight, size: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
