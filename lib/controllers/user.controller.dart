import 'dart:convert';
import '../models/user.model.dart';
import '../services/user.service.dart';

//bloc
//provider
//

Future<bool> login_controller(String email, String passwd) async {
  Usuario? user = await login(email, passwd);
  if (user != null) {
    return true;
  } else {
    return false;
  }
}
