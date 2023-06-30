import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/routes.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('ITTI'),
      actions: [
        IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {
            logout();
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void logout() {
    Get.offAllNamed(Routes.getLoginRoute());
  }
}
