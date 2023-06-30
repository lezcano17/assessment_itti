import 'package:assessment_itti/models/usuario.dart';
import 'package:assessment_itti/pages/common/appbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsuarioScreen extends StatelessWidget {
  const UsuarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(Get.arguments["random"]);
    Datum user = Get.arguments["usuario"];
    //int rng = Get.arguments["random"];
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Center(
          child: Column(
        children: [
          Container(
            height: 500,
            width: 500,
            child: CachedNetworkImage(
              placeholder: (context, url) => const CircularProgressIndicator(),
              imageUrl: user.avatar,
            ),
          ),
        ],
      )),
    );
  }
}
