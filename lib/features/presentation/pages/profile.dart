import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_easy/features/providers/auth_provider.dart';
import 'package:shop_easy/features/providers/firestore_provider.dart';
import 'package:shop_easy/features/presentation/widgets/appbar.dart';
import 'package:shop_easy/features/presentation/widgets/bottomBar.dart';
import 'package:shop_easy/features/presentation/widgets/initial_circle_avatar.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameAsync = ref.watch(usernameProvider);
    final creationDateAsync = ref.watch(creationDateProvider);

    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          usernameAsync.when(
            data: (username) {
              return Row(
                children: [
                  InitialsAvatar(text: username!),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(username),
                      creationDateAsync.when(
                        data: (creationDate) {
                          return Text(creationDate.toString());
                        },
                        error: (error, stackTrace) {
                          return Text("Ocurrio un error");
                        },
                        loading: () {
                          return Text("");
                        },
                      ),
                    ],
                  ),
                ],
              );
            },
            error: (error, stakTrace) {
              return Text("ocurrrio un error");
            },
            loading: () {
              return CircularProgressIndicator();
            },
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(signOutUseCaseProvider).call();
            },
            child: Text("Log Out"),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
