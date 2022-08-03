import 'package:flutter/material.dart';
import 'package:soft_frontend/controllers/user.controller.dart';
import 'package:soft_frontend/services/user.service.dart';

class CrearUser extends StatefulWidget {
  @override
  State<CrearUser> createState() => _CrearUserState();
}

class _CrearUserState extends State<CrearUser> {
  var idController = TextEditingController();
  var usuarioController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var idEmpleadoController = TextEditingController();
  var idRolController = TextEditingController();

  @override
  Widget build(context) =>
      Scaffold(body: LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Crear Usuario'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, 'gestionUsuarios');
                },
                child: Text('Regresar',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ],
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: constraints.maxWidth < 500
                  ? const EdgeInsets.all(20)
                  : const EdgeInsets.all(30.0),
              color: const Color(0xffF3F3F3),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Crear Usuario",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 3),
                    const Text(
                      "Por favor llene los campos",
                      style: TextStyle(fontSize: 15, color: Color(0xff606060)),
                    ),
                    const SizedBox(height: 40),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: 500,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(40),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Usuario",
                                  style: TextStyle(fontSize: 18),
                                ),
                                TextFormField(
                                  controller: usuarioController,
                                  decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      hintText: 'usuario'),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  "Password",
                                  style: TextStyle(fontSize: 18),
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      hintText: '**********'),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  "Email",
                                  style: TextStyle(fontSize: 18),
                                ),
                                TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      hintText: 'Email'),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  "IdEmpleado",
                                  style: TextStyle(fontSize: 18),
                                ),
                                TextFormField(
                                  controller: idEmpleadoController,
                                  decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      hintText: '1'),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  "IdRol",
                                  style: TextStyle(fontSize: 18),
                                ),
                                TextFormField(
                                  controller: idRolController,
                                  decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      hintText: '1'),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                TextButton(
                                  onPressed: null,
                                  child: Center(
                                    child: ElevatedButton(
                                        onPressed: () =>
                                            crearUsuario_Controller(
                                                idController.text,
                                                usuarioController.text,
                                                passwordController.text,
                                                emailController.text,
                                                idEmpleadoController.text,
                                                idRolController.text,
                                                context),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          child: Text('Aceptar'),
                                        )),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }));
}
