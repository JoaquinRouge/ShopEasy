import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_easy/features/presentation/providers/product_provider.dart';
import 'package:shop_easy/features/presentation/widgets/appbar.dart';
import 'package:shop_easy/features/presentation/widgets/bottomBar.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsList = ref.watch(productProvider);

    return Scaffold(
      appBar: CustomAppBar(),
      body: productsList.when(
        data: (products) => ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final p = products[index];
            return ListTile(
              leading: Image.network(p.imageUrl, height: 50, width: 50),
              title: Text(p.title),
              subtitle: Text('\$${p.price.toStringAsFixed(2)}'),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
