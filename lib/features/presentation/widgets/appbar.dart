import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shop_easy/core/theme/app_colors.dart';

class CustomAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  ConsumerState<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(130);
}

class _CustomAppBarState extends ConsumerState<CustomAppBar> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      toolbarHeight: 300,
      titleSpacing: 10,
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
                        hintText: 'Buscar en ShopEasy...',
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
                      ),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 24,),
            Row(
              children: const [
                HeroIcon(HeroIcons.mapPin, color: Colors.white),
                SizedBox(width: 5),
                Text("Dirección", style: TextStyle(fontSize: 15, color: Colors.white)),
                SizedBox(width: 5),
                HeroIcon(HeroIcons.chevronRight, size: 15, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
