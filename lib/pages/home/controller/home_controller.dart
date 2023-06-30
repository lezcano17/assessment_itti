import 'dart:convert';
import 'dart:math';

import 'package:assessment_itti/config/routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:assessment_itti/config/config.dart' as conf;

import '../../../models/usuario.dart';

Future<String> getListaUsuarios() async {
  var request = http.Request('GET', Uri.parse(conf.baseURL + conf.users));

  http.StreamedResponse response = await request.send();
  String respuesta;
  if (response.statusCode == 200) {
    respuesta = await response.stream.bytesToString();
    //print(respuesta);
    return respuesta;
  } else {
    print(response.reasonPhrase);
    return '';
  }
}

Future<List<Datum>> setDatosUsuario(String datosUsuario) async {
  var jsonResult = jsonDecode(datosUsuario);
  List<Datum> listaUsuarios = List.empty(growable: true);
  for (var element in jsonResult["data"]) {
    Datum aux = Datum(
        id: element["id"],
        email: element["email"],
        firstName: element["first_name"],
        lastName: element["last_name"],
        avatar: element["avatar"]);
    listaUsuarios.add(aux);
  }
  return listaUsuarios;
}

void showUserScreen(Datum usuario, int random) {
  goToUserScreen(usuario, random);
}

void goToUserScreen(Datum usuario, int random) {
  var data = {"usuario": usuario, "random": random};
  Get.toNamed(Routes.getUserRoute(), arguments: data);
}

int randomizer() {
  Random rng = Random();
  int randomNumber = 1 + rng.nextInt(100);
  if (randomNumber < 20) {
    return 1;
  } else if (randomNumber % 20 == 0) {
    return 2;
  } else {
    return 3;
  }
}
