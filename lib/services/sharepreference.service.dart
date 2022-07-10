  import 'package:shared_preferences/shared_preferences.dart';

import '../models/models.dart';
  
  Future<Object?> token() async {

    SharedPreferences prefs = await  SharedPreferences.getInstance();
    final String? response = prefs.getString("response");
    Object? finalresponse;
    finalresponse = response;

    User user = User.fromJson(finalresponse.toString());

    String token = user.sesion.token;
    return token;

  }