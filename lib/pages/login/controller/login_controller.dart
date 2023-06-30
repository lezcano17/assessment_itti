import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../config/routes.dart';

Widget buildTextField(
    TextEditingController controller, String labelText, bool pass) {
  return TextFormField(
    controller: controller,
    obscureText: pass,
    maxLength: pass ? 5 : null,
    keyboardType: pass ? TextInputType.number : TextInputType.text,
    maxLengthEnforcement: MaxLengthEnforcement.enforced,
    inputFormatters: <TextInputFormatter>[
      pass
          ? FilteringTextInputFormatter.digitsOnly
          : FilteringTextInputFormatter.deny(RegExp('[0-9]')),
    ],
    decoration: InputDecoration(
      labelText: labelText,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}

void goToHomeScreen() {
  Get.offAllNamed(Routes.getHomeRoute());
}

void sendLoginData(BuildContext context, String user, String password) async {
  /** Acá habría un request POST al back */
  goToHomeScreen();
}
