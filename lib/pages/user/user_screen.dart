import 'package:assessment_itti/models/usuario.dart';
import 'package:assessment_itti/pages/common/appbar.dart';
import 'package:assessment_itti/pages/home/view/home_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsuarioScreen extends StatelessWidget {
  const UsuarioScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    print(Get.arguments["random"]);
    Datum user = Get.arguments["usuario"];
    int rng = Get.arguments["random"];
    switch (rng) {
      case 1:
        {
          return usuarioActivoScreen(context, user);
        }
      case 2:
        {
          return usuarioInactivoScreen(context, user);
        }
      case 3:
        {
          return usuarioBloqueadoScreen(context, user);
        }
    }
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 500,
              width: 500,
              child: CachedNetworkImage(
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                imageUrl: user.avatar,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget usuarioActivoScreen(BuildContext context, Datum user) {
  return Scaffold(
    appBar: const CommonAppBar(),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Usuario activo",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          CircleAvatar(
            radius: 80,
            backgroundImage: CachedNetworkImageProvider(user.avatar),
          ),
          SizedBox(height: 16),
          Text(
            "${user.firstName} ${user.lastName}",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 16),
          emailField(user.email),
        ],
      ),
    ),
  );
}

Widget usuarioBloqueadoScreen(BuildContext context, Datum user) {
  return Scaffold(
    appBar: const CommonAppBar(),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Usuario bloqueado",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          CircleAvatar(
            radius: 80,
            backgroundImage: CachedNetworkImageProvider(user.avatar),
          ),
          SizedBox(height: 16),
          Text(
            "${user.firstName} ${user.lastName}",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 16),
          emailField(user.email),
        ],
      ),
    ),
  );
}

Widget usuarioInactivoScreen(BuildContext context, Datum user) {
  return Scaffold(
    appBar: const CommonAppBar(),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Usuario inactivo",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          CircleAvatar(
            radius: 80,
            backgroundImage: CachedNetworkImageProvider(user.avatar),
          ),
          SizedBox(height: 16),
          Text(
            "${user.firstName} ${user.lastName}",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 16),
          emailField(user.email),
        ],
      ),
    ),
  );
}
