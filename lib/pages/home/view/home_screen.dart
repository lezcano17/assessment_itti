import 'package:assessment_itti/models/usuario.dart';
import 'package:assessment_itti/pages/common/appbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  bool isError = false;
  late List<Datum> _userData;
  @override
  void initState() {
    // _loadTestData();
    loadData();
    isLoading = true;
    isError = false;
    super.initState();
  }

  Future<void> loadData() async {
    await _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      isLoading = true;
      isError = false;
    });
    try {
      String userData = await getListaUsuarios();
      List<Datum> listaUsuarios = await setDatosUsuario(userData);
      setState(() {
        isLoading = false;
        _userData = listaUsuarios;
      });
    } catch (e) {
      print(e);
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        appBar: CommonAppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text("Cargando datos"),
            ],
          ),
        ),
      );
    } else if (isError) {
      return Scaffold(
        appBar: const CommonAppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Ha ocurrido un error inesperado"),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loadData,
                child: const Text('Reintentar'),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: const CommonAppBar(),
        body: renderHome(),
      );
    }
  }

  Widget renderHome() {
    return ListView.builder(
      itemCount: _userData.length,
      itemBuilder: (BuildContext context, int index) {
        final user = _userData[index];
        return GestureDetector(
          onTap: () => showUserScreen(user, randomizer()),
          child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user.avatar),
              ),
              title: Text('${user.firstName} ${user.lastName}'),
              subtitle: emailField(user.email)),
        );
      },
    );
  }

  Widget emailField(String email) {
    final mailtoUri = Uri(scheme: 'mailto', path: email);
    print(mailtoUri);
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            style: TextStyle(color: Colors.blueGrey),
            text: email,
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                if (await canLaunchUrl(mailtoUri)) {
                  await launchUrl(
                    mailtoUri,
                    mode: LaunchMode.externalApplication,
                  );
                }
              },
          ),
        ],
      ),
    );
  }
}
