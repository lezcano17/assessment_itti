import 'package:flutter/material.dart';
import 'package:assessment_itti/config/colors.dart';
import 'package:get/route_manager.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 80.0,
                bottom: 20.0,
              ),
              child: Image.network(
                'https://centralinaaging.org/wp-content/uploads/2021/03/Your-Logo-here.png', // Replace with your logo image path
                height: 150.0,
                width: 150.0,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child: Column(
                children: [
                  buildTextField(_userController, 'Usuario', false),
                  const SizedBox(height: 10.0),
                  buildTextField(_passwordController, 'Password', true),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      String user = _userController.text;
                      String password = _passwordController.text;
                      if (password.length == 5 && user.length > 2) {
                        sendLoginData(context, user, password);
                      } else if (password.length < 5) {
                        Get.defaultDialog(
                            title: "Datos inválidos",
                            content: const Text(
                                "La contraseña debe ser numérica de 5 dígitos"));
                      } else {
                        Get.defaultDialog(
                            title: "Datos inválidos",
                            content: const Text(
                                "El usuario debe contener al menos 3 caracteres"));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: primaryColor,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 20.0,
                      ),
                      child: Text(
                        'Iniciar sesión',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
