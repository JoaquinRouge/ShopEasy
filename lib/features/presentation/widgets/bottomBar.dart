import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shop_easy/core/theme/app_colors.dart';
import 'package:shop_easy/features/presentation/providers/page_provider.dart';

class CustomBottomBar extends ConsumerStatefulWidget {
  const CustomBottomBar({super.key});

  @override
  ConsumerState<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends ConsumerState<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    ref.listen(pageProvider, (previous, next) {
      if (next != previous) context.go(next);
    });

    final currentRoute = ref.watch(pageProvider);

    return Container(
      height: 85,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          navItem(context, HeroIcons.home, "Inicio", "/home", currentRoute),
          navItem(context, HeroIcons.squares2x2, "Categorías", "/category", currentRoute),
          navItem(context, HeroIcons.shoppingCart,"Carrito","/cart",currentRoute),
          navItem(context, HeroIcons.user, "Perfil", "/profile", currentRoute),
        ],
      ),
    );
  }

  Widget navItem(
    BuildContext context,
    HeroIcons icon,
    String text,
    String route,
    String currentRoute,
  ) {
    final bool isActive = currentRoute == route;
    final color = isActive
        ? Theme.of(context).colorScheme.primary
        : AppColors.textSecondaryColor;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => ref.read(pageProvider.notifier).state = route,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeroIcon(
              icon,
              color: color,
              style: isActive ? HeroIconStyle.solid : HeroIconStyle.outline,
              size: 28,
            ),
            const SizedBox(height: 4),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                color: color,
              ),
              child: Text(text),
            ),
            const SizedBox(height: 3),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 250),
              opacity: isActive ? 1 : 0,
              child: Container(
                width: 25,
                height: 3,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
